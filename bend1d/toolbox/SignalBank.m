function [x,f,meta] = SignalBank(signalIdentifier,N,varargin)
%SIGNALBANK Generate a signal from the BEND-1D library.
%
%   [x,f,meta] = SignalBank("TF001")
%   [x,f,meta] = SignalBank("TF001",1024)
%   [x,f,meta] = SignalBank("Percolation",1024)
%   [x,f,meta] = SignalBank("TF001_Percolation",1024)
%
% SignalBank automatically locates the appropriate local signal function
% using its unique TF### identifier. For example, catalog entry TF027 can
% call a local function named:
%
%   TF027_NasonPlethysmography
%
% even if the shorter catalog name is:
%
%   NasonPleth
%
% Every local signal function must begin with its unique TF identifier:
%
%   TF001_
%   TF002_
%   ...
%   TF230_

    %% Validate the signal identifier

    if nargin < 1 || isempty(signalIdentifier)
        error("BEND1D:MissingSignalID", ...
            "A signal identifier or name must be provided.");
    end

    %% Load the catalog

    T = catalog;

    if ~istable(T) || isempty(T)
        error("BEND1D:InvalidCatalog", ...
            "catalog.m did not return a nonempty table.");
    end

    requiredVariables = [
        "ID"
        "Name"
        "Category"
        "RecommendedN"
    ];

    actualVariables = string(T.Properties.VariableNames);

    for k = 1:numel(requiredVariables)

        if ~any(actualVariables == requiredVariables(k))
            error("BEND1D:InvalidCatalog", ...
                "The catalog is missing the required variable '%s'.", ...
                requiredVariables(k));
        end
    end

    if height(T) ~= 230
        error("BEND1D:InvalidCatalogSize", ...
            "The catalog contains %d signals; 230 were expected.", ...
            height(T));
    end

    %% Find the requested catalog entry

    query = normalizeSignalText(signalIdentifier);

    normalizedID = normalizeSignalText(T.ID);
    normalizedName = normalizeSignalText(T.Name);
    normalizedFullName = normalizedID + normalizedName;

    matchingRows = find( ...
        normalizedID == query | ...
        normalizedName == query | ...
        normalizedFullName == query);

    if isempty(matchingRows)
        error("BEND1D:UnknownSignal", ...
            "Unknown signal identifier or name: %s", ...
            string(signalIdentifier));
    end

    if numel(matchingRows) > 1

        matchingIDs = strjoin(T.ID(matchingRows),", ");

        messageText = ...
            "The name '%s' corresponds to multiple signals: %s. " + ...
            "Use the unique TF identifier.";

        error("BEND1D:AmbiguousSignalName", ...
            messageText, ...
            string(signalIdentifier),matchingIDs);
    end

    rowIndex = matchingRows(1);

    signalID = string(T.ID(rowIndex));
    signalName = string(T.Name(rowIndex));
    signalCategory = double(T.Category(rowIndex));

    %% Determine and validate the sample size

    if nargin < 2 || isempty(N)
        N = T.RecommendedN(rowIndex);
    end

    validateattributes(N,{'numeric'}, ...
        {'scalar','integer','>=',2,'finite'}, ...
        mfilename,'N');

    N = double(N);

    %% Obtain all local function handles

    functionHandles = localfunctions;
    functionNames = strings(numel(functionHandles),1);

    for k = 1:numel(functionHandles)

        currentName = string(func2str(functionHandles{k}));

        % Depending on the MATLAB release, a local function may appear as:
        %
        %   TF027_NasonPlethysmography
        %   SignalBank>TF027_NasonPlethysmography
        %   SignalBank/TF027_NasonPlethysmography
        %
        % Retain only the local-function name.

        currentName = regexprep(currentName,"^.*[>/]","");

        functionNames(k) = currentName;
    end

    %% Match the implementation by its unique TF### prefix

    functionPrefix = signalID + "_";

    matchingGenerators = find( ...
        startsWith( ...
            functionNames, ...
            functionPrefix, ...
            "IgnoreCase",true));

    if isempty(matchingGenerators)

        error("BEND1D:MissingImplementation", ...
            "No local signal function beginning with '%s' was found.", ...
            functionPrefix);
    end

    if numel(matchingGenerators) > 1

        matchingNames = strjoin( ...
            functionNames(matchingGenerators),", ");

        messageText = ...
            "Multiple local functions were found for %s: %s. " + ...
            "Each TF identifier must have exactly one implementation.";

        error("BEND1D:AmbiguousImplementation", ...
            messageText,signalID,matchingNames);
    end

    %% Execute the selected signal generator

    generator = functionHandles{matchingGenerators(1)};

    [x,f,meta] = generator(N,varargin{:});

    %% Validate basic generator outputs

    if ~isnumeric(x) || ~isvector(x)
        error("BEND1D:InvalidGrid", ...
            "%s returned an invalid sampling grid.",signalID);
    end

    if ~isnumeric(f) || ~isvector(f)
        error("BEND1D:InvalidSignal", ...
            "%s returned an invalid signal.",signalID);
    end

    % Standardize both outputs as column vectors.
    x = x(:);
    f = f(:);

    if numel(x) ~= N
        error("BEND1D:IncorrectGridLength", ...
            "%s returned %d grid points; %d were expected.", ...
            signalID,numel(x),N);
    end

    if numel(f) ~= N
        error("BEND1D:IncorrectSignalLength", ...
            "%s returned %d signal values; %d were expected.", ...
            signalID,numel(f),N);
    end

    if ~isreal(x) || any(~isfinite(x))
        error("BEND1D:InvalidGrid", ...
            "%s returned a nonreal or nonfinite sampling grid.", ...
            signalID);
    end

    if ~isreal(f) || any(~isfinite(f))
        error("BEND1D:InvalidSignal", ...
            "%s returned nonreal or nonfinite signal values.", ...
            signalID);
    end

    %% Standardize metadata using catalog.m

    if ~isstruct(meta)
        meta = struct;
    end

    % Preserve signal-specific fields such as meta.Parameters, but make
    % the central catalog authoritative for these common fields.
    meta.ID = signalID;
    meta.Name = signalName;
    meta.Category = signalCategory;
    meta.RecommendedN = double(T.RecommendedN(rowIndex));
end


function output = normalizeSignalText(input)
%NORMALIZESIGNALTEXT Normalize signal identifiers and names.
%
% Matching is case-insensitive and ignores spaces, underscores, and
% hyphens. Consequently, the following are equivalent:
%
%   TF001
%   Percolation
%   TF001_Percolation
%   TF001-Percolation
%   TF001 Percolation

    output = upper(strtrim(string(input)));
    output = regexprep(output,"[\s_-]","");
end
% function [x,f,meta] = SignalBank(signalID,N,varargin)
% %BEND1D Generate a signal from the BEND-1D library.
% %
% %   [x,f,meta] = bend1d("TF001",1024)
% %   [x,f,meta] = bend1d("Percolation",1024)
% %
% % All individual signal generators are local functions in this file.
% 
% if nargin < 1
%     error("BEND1D:MissingSignalID", ...
%         "A signal identifier must be provided.");
% end
% 
% if nargin < 2 || isempty(N)
%     N = 1024;
% end
% 
% signalID = upper(strtrim(string(signalID)));
% 
% switch signalID
% 
%     case {"TF001","PERCOLATION","TF001_PERCOLATION"}
%         [x,f,meta] = TF001_Percolation(N,varargin{:});
% 
%     case {"TF002","PLANCK","TF002_PLANCK"}
%         [x,f,meta] = TF002_Planck(N,varargin{:});
% 
%     case {"TF003","STICKSLIP","TF003_STICKSLIP"}
%         [x,f,meta] = TF003_StickSlip(N,varargin{:});
% 
%     case {"TF004","RINGDOWN","TF004_RINGDOWN"}
%         [x,f,meta] = TF004_RingDown(N,varargin{:});
% 
%     case {"TF005","DIFFUSIONBAND","TF005_DIFFUSIONBAND"}
%         [x,f,meta] = TF005_DiffusionBand(N,varargin{:});
% 
%     case {"TF006","FANO","TF006_FANO"}
%         [x,f,meta] = TF006_Fano(N,varargin{:});
% 
%     case {"TF007","BOUNCINGBALL","TF007_BOUNCINGBALL"}
%         [x,f,meta] = TF007_BouncingBall(N,varargin{:});
% 
%     case {"TF008","IMPACTSPRING","TF008_IMPACTSPRING"}
%         [x,f,meta] = TF008_ImpactSpring(N,varargin{:});
% 
%     case {"TF009","QUANTUMBARRIER","TF009_QUANTUMBARRIER"}
%         [x,f,meta] = TF009_QuantumBarrier(N,varargin{:});
% 
%     case {"TF010","AVOIDEDCROSSING","TF010_AVOIDEDCROSSING"}
%         [x,f,meta] = TF010_AvoidedCrossing(N,varargin{:});
% 
%     case {"TF011","MORSE","TF011_MORSE"}
%         [x,f,meta] = TF011_Morse(N,varargin{:});
% 
%     case {"TF012","BZPULSE","TF012_BZPULSE"}
%         [x,f,meta] = TF012_BZPulse(N,varargin{:});
% 
%     case {"TF013","ACTIONPOTENTIAL","TF013_ACTIONPOTENTIAL"}
%         [x,f,meta] = TF013_ActionPotential(N,varargin{:});
% 
%     case {"TF014","ECGBEAT","TF014_ECGBEAT"}
%         [x,f,meta] = TF014_ECGBeat(N,varargin{:});
% 
%     case {"TF015","VANHOVE","TF015_VANHOVE"}
%         [x,f,meta] = TF015_VanHove(N,varargin{:});
% 
%     case {"TF016","MARKETCRASH","TF016_MARKETCRASH"}
%         [x,f,meta] = TF016_MarketCrash(N,varargin{:});
% 
%      otherwise
%             error("BEND1D:UnknownSignal", ...
%                 "Unknown signal identifier or name: %s",signalID);
%     end
% 
%     % Use catalog.m as the authoritative source for metadata.
%     T = catalog;
%     rowIndex = find(T.ID == string(meta.ID),1);
% 
%     if isempty(rowIndex)
%         error("BEND1D:CatalogMismatch", ...
%             "Signal %s is not registered in catalog.m.", ...
%             string(meta.ID));
%     end
% 
%     meta.ID = T.ID(rowIndex);
%     meta.Name = T.Name(rowIndex);
%     meta.Category = T.Category(rowIndex);
% end


%% Category 1
function [x,f,meta] = TF001_Percolation(N,pc,beta)
    if nargin < 1 || isempty(N), N = 1024; end
    if nargin < 2 || isempty(pc), pc = 0.38; end
    if nargin < 3 || isempty(beta), beta = 0.41; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    f = max(x-pc,0).^beta;
    meta = struct;
    meta.ID = "TF001";
    meta.Name = "Percolation";
    meta.Category = 1;
    meta.RecommendedN = 1024;
    meta.Parameters = struct("pc",pc,"beta",beta);
    meta.Morphology = "Continuous onset with a singular derivative";
end

function [x,f,meta] = TF002_Planck(N)
    if nargin < 1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    lambda = 0.08 + 0.92*x;
    f = lambda.^(-5) ./ expm1(2.5./lambda);
    meta = struct;
    meta.ID = "TF002";
    meta.Name = "Planck";
    meta.Category = 1;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Smooth broadband spectral shape";
end

function [x,f,meta] = TF003_StickSlip(N,b,h)
    if nargin < 1 || isempty(N), N = 1024; end
    if nargin < 2 || isempty(b), b = [0.00 0.16 0.34 0.52 0.73 1.00]; end
    if nargin < 3 || isempty(h), h = [0.80 1.15 0.75 1.35 0.95]; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    f = zeros(size(x));
    for k = 1:numel(h)
        if k < numel(h)
            ind = (x >= b(k)) & (x < b(k+1));
        else
            ind = (x >= b(k)) & (x <= b(k+1));
        end
        f(ind) = h(k).*(x(ind)-b(k))./(b(k+1)-b(k));
    end
    f(end) = 0;
    meta = struct;
    meta.ID = "TF003";
    meta.Name = "Stick-Slip";
    meta.Category = 2;
    meta.RecommendedN = 1024;
    meta.Parameters = struct("b",b,"h",h);
    meta.Morphology = "Piecewise-linear segments with abrupt changes";
end

function [x,f,meta] = TF004_RingDown(N,x0,alpha,nu)
    if nargin < 1 || isempty(N), N = 1024; end
    if nargin < 2 || isempty(x0), x0 = 0.28; end
    if nargin < 3 || isempty(alpha), alpha = 7; end
    if nargin < 4 || isempty(nu), nu = 16; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    u = max(x - x0, 0);
    f = (x >= x0) .* exp(-alpha.*u) .* sin(2*pi*nu.*u);
    meta = struct;
    meta.ID = "TF004";
    meta.Name = "Ring-Down";
    meta.Category = 3;
    meta.RecommendedN = 1024;
    meta.Parameters = struct("x0",x0,"alpha",alpha,"nu",nu);
    meta.Morphology = "Damped resonant transient";
end

function [x,f,meta] = TF005_DiffusionBand(N)
    if nargin < 1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    f = 0.5*(erf((x-0.28)/0.025) - erf((x-0.72)/0.070));
    meta = struct;
    meta.ID = "TF005";
    meta.Name = "Diffusion Band";
    meta.Category = 4;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Two diffusive fronts of unequal sharpness";
end

function [x,f,meta] = TF006_Fano(N,q)
    if nargin < 1 || isempty(N), N = 1024; end
    if nargin < 2 || isempty(q), q = 1.5; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    epsF = (x-0.58)/0.025;
    f = 0.35*exp(-((x-0.26)/0.12).^2) + 0.75*((q+epsF).^2./(1+epsF.^2)-1);
    meta = struct;
    meta.ID = "TF006";
    meta.Name = "Fano";
    meta.Category = 5;
    meta.RecommendedN = 1024;
    meta.Parameters = struct("q",q);
    meta.Morphology = "Broad background plus asymmetric resonance";
end

function [x,f,meta] = TF007_BouncingBall(N,e,duration0)
    if nargin < 1 || isempty(N), N = 1024; end
    if nargin < 2 || isempty(e), e = 0.72; end
    if nargin < 3 || isempty(duration0), duration0 = 1-e; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    f = zeros(size(x));
    left = 0;
    duration = duration0;
    height = 1;
    for k = 1:30
        right = left + duration;
        if right > 1, right = 1; end
        ind = (x >= left) & (x <= right);
        if right > left
            u = (x(ind)-left)./(right-left);
            f(ind) = 4*height.*u.*(1-u);
        end
        if right >= 1-10*eps, break; end
        left = right;
        duration = e*duration;
        height = e^2*height;
    end
    f(end) = 0;
    meta = struct;
    meta.ID = "TF007";
    meta.Name = "Bouncing Ball";
    meta.Category = 6;
    meta.RecommendedN = 1024;
    meta.Parameters = struct("e",e,"duration0",duration0);
    meta.Morphology = "Sequence of decaying ballistic arcs accumulating at 1";
end

function [x,f,meta] = TF008_ImpactSpring(N,xImpact)
    if nargin < 1 || isempty(N), N = 1024; end
    if nargin < 2 || isempty(xImpact), xImpact = 0.27; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    u = max(x-xImpact,0);
    impactPulse = 1.20*exp(-0.5*((x-xImpact)/0.006).^2);
    ring1 = (x >= xImpact).*exp(-8*u).*sin(34*pi*u);
    ring2 = (x >= xImpact).*0.28.*exp(-11*u).*sin(82*pi*u);
    f = impactPulse + ring1 + ring2;
    meta = struct;
    meta.ID = "TF008";
    meta.Name = "Impact Spring";
    meta.Category = 7;
    meta.RecommendedN = 1024;
    meta.Parameters = struct("xImpact",xImpact);
    meta.Morphology = "Narrow impact pulse with damped modal rings";
end

function [x,f,meta] = TF009_QuantumBarrier(N,aQB,V0)
    if nargin < 1 || isempty(N), N = 1024; end
    if nargin < 2 || isempty(aQB), aQB = 7.0; end
    if nargin < 3 || isempty(V0), V0 = 1.0; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    E = 0.15 + 1.70*x;
    f = zeros(size(x));
    below = E < V0-1e-10;
    above = E > V0+1e-10;
    near  = ~(below | above);
    Eb = E(below);
    if ~isempty(Eb)
        ka = sqrt(V0-Eb);
        f(below) = 1 ./ (1 + V0^2*sinh(aQB*ka).^2 ./ (4*Eb.*(V0-Eb)));
    end
    Ea = E(above);
    if ~isempty(Ea)
        qq = sqrt(Ea-V0);
        f(above) = 1 ./ (1 + V0^2*sin(aQB*qq).^2 ./ (4*Ea.*(Ea-V0)));
    end
    f(near) = 1/(1 + V0*aQB^2/4);
    meta = struct;
    meta.ID = "TF009";
    meta.Name = "Quantum Barrier";
    meta.Category = 8;
    meta.RecommendedN = 1024;
    meta.Parameters = struct("aQB",aQB,"V0",V0);
    meta.Morphology = "Transmission probability with tunneling and resonances";
end

function [x,f,meta] = TF010_AvoidedCrossing(N,xcross,Delta)
    if nargin < 1 || isempty(N), N = 1024; end
    if nargin < 2 || isempty(xcross), xcross = 0.52; end
    if nargin < 3 || isempty(Delta), Delta = 0.035; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    f = sqrt(4*(x-xcross).^2 + Delta^2);
    meta = struct;
    meta.ID = "TF010";
    meta.Name = "Avoided Crossing";
    meta.Category = 9;
    meta.RecommendedN = 1024;
    meta.Parameters = struct("xcross",xcross,"Delta",Delta);
    meta.Morphology = "Upper branch of coupled linear levels";
end

function [x,f,meta] = TF011_Morse(N,De,aMorse,re)
    if nargin < 1 || isempty(N), N = 1024; end
    if nargin < 2 || isempty(De), De = 1.0; end
    if nargin < 3 || isempty(aMorse), aMorse = 2.8; end
    if nargin < 4 || isempty(re), re = 0.80; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    r = 0.35 + 2.00*x;
    f = De*(1-exp(-aMorse*(r-re))).^2 - De;
    meta = struct;
    meta.ID = "TF011";
    meta.Name = "Morse";
    meta.Category = 10;
    meta.RecommendedN = 1024;
    meta.Parameters = struct("De",De,"aMorse",aMorse,"re",re);
    meta.Morphology = "Diatomic bond potential with exponential approach";
end

function [x,f,meta] = TF012_BZPulse(N)
    if nargin < 1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    riseBZ = 1 ./ (1 + exp(-100*(x-0.25)));
    fallBZ = 1 ./ (1 + exp(-40*(x-0.55)));
    u = max(x-0.55,0);
    relaxBZ = 0.20*(x >= 0.55).*exp(-9*u).*sin(45*pi*u);
    f = riseBZ - fallBZ + relaxBZ;
    meta = struct;
    meta.ID = "TF012";
    meta.Name = "BZ Pulse";
    meta.Category = 11;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Excitable pulse with damped relaxation";
end

function [x,f,meta] = TF013_ActionPotential(N)
    if nargin < 1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    depol = 1.20 ./ (1 + exp(-180*(x-0.23)));
    repol = 1.05 ./ (1 + exp(-55*(x-0.53)));
    undershoot = 0.22*exp(-((x-0.67)/0.065).^2);
    f = depol - repol - undershoot;
    meta = struct;
    meta.ID = "TF013";
    meta.Name = "Action Potential";
    meta.Category = 12;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Rapid depolarization, slower repolarization, after-hyperpolarization";
end

function [x,f,meta] = TF014_ECGBeat(N)
    if nargin < 1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    f = zeros(size(x));
    rCenters = [0.28 0.76];
    beatAmp  = [1.00 0.88];
    offset = [-0.15 -0.025 0 0.025 0.16];
    amp    = [ 0.15 -0.12 1.00 -0.25 0.32];
    width  = [ 0.035 0.010 0.008 0.012 0.060];
    for ib = 1:numel(rCenters)
        for iq = 1:5
            muq = rCenters(ib) + offset(iq);
            f = f + beatAmp(ib)*amp(iq).*exp(-0.5*((x-muq)/width(iq)).^2);
        end
    end
    meta = struct;
    meta.ID = "TF014";
    meta.Name = "ECG Beat";
    meta.Category = 13;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Two unequal heartbeats composed of signed Gaussian components";
end

function [x,f,meta] = TF015_VanHove(N,xcVH,deltaVH)
    if nargin < 1 || isempty(N), N = 1024; end
    if nargin < 2 || isempty(xcVH), xcVH = 0.57; end
    if nargin < 3 || isempty(deltaVH), deltaVH = 0.006; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    bandEnvelope = sqrt(max(x.*(1-x),0));
    f = -bandEnvelope .* log(sqrt((x-xcVH).^2 + deltaVH^2));
    meta = struct;
    meta.ID = "TF015";
    meta.Name = "Van Hove";
    meta.Category = 14;
    meta.RecommendedN = 1024;
    meta.Parameters = struct("xcVH",xcVH,"deltaVH",deltaVH);
    meta.Morphology = "Regularized logarithmic singularity with finite-band envelope";
end

function [x,f,meta] = TF016_MarketCrash(N,xcCrash)
    if nargin < 1 || isempty(N), N = 1024; end
    if nargin < 2 || isempty(xcCrash), xcCrash = 0.72; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    f = zeros(size(x));
    pre = x < xcCrash;
    dx = xcCrash - x(pre);
    f(pre) = 1.50 - 0.80*dx.^0.42 .* (1 + 0.12*cos(9*log(dx)));
    post = ~pre;
    uCrash = x(post)-xcCrash;
    crashLevel = 0.92;
    f(post) = crashLevel + 0.42*(1-exp(-8*uCrash));
    meta = struct;
    meta.ID = "TF016";
    meta.Name = "Market Crash";
    meta.Category = 15;
    meta.RecommendedN = 1024;
    meta.Parameters = struct("xcCrash",xcCrash);
    meta.Morphology = "Log-periodic precursor, abrupt crash, smooth recovery";
end

%% Category 2

function [x,f,meta] = TF017_Klatno(N,x0K,aK)
    if nargin < 1 || isempty(N), N = 1024; end
    if nargin < 2 || isempty(x0K), x0K = 0.48; end
    if nargin < 3 || isempty(aK), aK = 12; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    base = 4*atan(exp(aK*(x-x0K))) - pi;
    u = max(x-x0K,0);
    swing = 0.18*exp(-2.2*x).*sin(8*pi*x);
    post = 0.10*(x>=x0K).*exp(-8*u).*sin(36*pi*u);
    f = base + swing + post;
    meta = struct;
    meta.ID = "TF017";
    meta.Name = "Klatno";
    meta.Category = 2;
    meta.RecommendedN = 1024;
    meta.Parameters = struct("x0K",x0K,"aK",aK);
    meta.Morphology = "Nonlinear pendulum separatrix with localized derivative";
end

function [x,f,meta] = TF018_Cantilever(N)
    if nargin < 1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    beta1 = 1.875104068711961;
    beta3 = 7.854757438237612;
    c1 = (cosh(beta1)+cos(beta1))/(sinh(beta1)+sin(beta1));
    c3 = (cosh(beta3)+cos(beta3))/(sinh(beta3)+sin(beta3));
    phi1 = cosh(beta1*x)-cos(beta1*x) - c1*(sinh(beta1*x)-sin(beta1*x));
    phi3 = cosh(beta3*x)-cos(beta3*x) - c3*(sinh(beta3*x)-sin(beta3*x));
    phi1 = phi1/max(abs(phi1));
    phi3 = phi3/max(abs(phi3));
    xCrack = 0.63;
    hinge = max(x-xCrack,0) - (1-xCrack).*x;
    f = phi1 + 0.18*phi3 + 0.12*hinge;
    meta = struct;
    meta.ID = "TF018";
    meta.Name = "Cantilever";
    meta.Category = 2;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Euler-Bernoulli first mode with third-mode perturbation and hinge";
end

function [x,f,meta] = TF019_WaterHammer(N,xWH)
    if nargin < 1 || isempty(N), N = 1024; end
    if nargin < 2 || isempty(xWH), xWH = 0.30; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    u = max(x-xWH,0);
    front = 0.65*(1+tanh(120*(x-xWH)));
    ring = 0.38*(x>=xWH).*exp(-6*u).*cos(54*pi*u);
    f = front + ring;
    meta = struct;
    meta.ID = "TF019";
    meta.Name = "Water Hammer";
    meta.Category = 2;
    meta.RecommendedN = 1024;
    meta.Parameters = struct("xWH",xWH);
    meta.Morphology = "Steep smooth pressure rise with damped acoustic ringing";
end

function [x,f,meta] = TF020_ThermalRunaway(N,xcTR,marginTR)
    if nargin < 1 || isempty(N), N = 1024; end
    if nargin < 2 || isempty(xcTR), xcTR = 0.68; end
    if nargin < 3 || isempty(marginTR), marginTR = 0.035; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    f = zeros(size(x));
    pre = x < xcTR;
    base = -log(1 - x(pre)/(xcTR+marginTR));
    osc = 0.12*(x(pre)/xcTR).^3 .* sin(20*pi*x(pre));
    f(pre) = base + osc;
    oscCrit = 0.12*sin(20*pi*xcTR);
    fcrit = -log(1 - xcTR/(xcTR+marginTR)) + oscCrit;
    post = ~pre;
    u = x(post)-xcTR;
    f(post) = fcrit*exp(-11*u) - 0.18*exp(-((x(post)-0.80)/0.035).^2);
    meta = struct;
    meta.ID = "TF020";
    meta.Name = "Thermal Runaway";
    meta.Category = 2;
    meta.RecommendedN = 1024;
    meta.Parameters = struct("xcTR",xcTR,"marginTR",marginTR);
    meta.Morphology = "Log-accelerating pre-critical rise with exponential quench";
end

function [x,f,meta] = TF021_Diffraction(N)
    if nargin < 1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    zD = 18*pi*(x-0.50);
    sincD = ones(size(x));
    nz = abs(zD)>1e-12;
    sincD(nz) = sin(zD(nz))./zD(nz);
    fringe = 0.18 + 0.82*cos(15*pi*(x-0.50)).^2;
    zD2 = 34*pi*(x-0.67);
    sincD2 = ones(size(x));
    nz2 = abs(zD2)>1e-12;
    sincD2(nz2) = sin(zD2(nz2))./zD2(nz2);
    f = sincD.^2 .* fringe + 0.10*sincD2.^2;
    meta = struct;
    meta.ID = "TF021";
    meta.Name = "Diffraction";
    meta.Category = 2;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Fraunhofer-like sinc^2 envelope with interference fringes";
end

function [x,f,meta] = TF022_Titration(N)
    if nargin < 1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    f = 0.08*log(1+20*x) + 0.55*tanh((x-0.31)/0.018) + 0.32*tanh((x-0.69)/0.060) + 0.13*tanh((x-0.84)/0.014);
    f = f + 0.07*exp(-((x-0.50)/0.028).^2);
    meta = struct;
    meta.ID = "TF022";
    meta.Name = "Titration";
    meta.Category = 2;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Log background with multiple smooth equivalence transitions";
end

function [x,f,meta] = TF023_RabiChirp(N)
    if nargin < 1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    phaseR = 2*pi*(3*x + 7*x.^2);
    f = exp(-0.9*x).*sin(phaseR).^2;
    meta = struct;
    meta.ID = "TF023";
    meta.Name = "Rabi Chirp";
    meta.Category = 2;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Chirped population oscillation with decoherence";
end

function [x,f,meta] = TF024_MuscleTwitch(N)
    if nargin < 1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    tMuscle = [0.10 0.24 0.39 0.44 0.67 0.83];
    AMuscle = [0.70 1.00 0.55 0.85 1.15 0.65];
    tauMuscle = [0.035 0.050 0.028 0.042 0.060 0.032];
    f = zeros(size(x));
    for k = 1:numel(tMuscle)
        u = (x-tMuscle(k))/tauMuscle(k);
        ind = u>=0;
        tmp = zeros(size(x));
        tmp(ind) = AMuscle(k)*u(ind).*exp(1-u(ind));
        f = f + tmp;
    end
    meta = struct;
    meta.ID = "TF024";
    meta.Name = "Muscle Twitch";
    meta.Category = 2;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Superposition of causal alpha-function responses";
end

function [x,f,meta] = TF025_Platinum5Y(N)
    if nargin < 1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    platinumRawUSD = [ ...
        1009 973 1017 1038 945 994 1049 1043 965 958 957 869 909 881 915 989 1011 1053 959 971 1051 1063 971 950 925 921 892 906 935 926 894 909 940 1015 985 979 945 967 999 966 938 949 978 980 959 980 1251 1391 1343 1435 1616 1565 1893 2434 2137 2046 2028 1998 1726 1622 ];
    ps = platinumRawUSD;
    ps(1) = (7*platinumRawUSD(1)+platinumRawUSD(2))/8;
    ps(end) = (platinumRawUSD(end-1)+7*platinumRawUSD(end))/8;
    ps(2:end-1) = (platinumRawUSD(1:end-2) + 6*platinumRawUSD(2:end-1) + platinumRawUSD(3:end))/8;
    tMonth = linspace(0,1,numel(platinumRawUSD));
    fUSD = interp1(tMonth,ps,x,'pchip');
    f = (fUSD-mean(fUSD))/std(fUSD);
    meta = struct;
    meta.ID = "TF025";
    meta.Name = "Platinum5Y";
    meta.Category = 2;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "5-year monthly platinum price (standardized)";
end

function [x,f,meta] = TF026_FlashCrash(N,xcFC)
    if nargin < 1 || isempty(N), N = 1024; end
    if nargin < 2 || isempty(xcFC), xcFC = 0.58; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    background = 1 + 0.12*sqrt(x+0.02) + 0.025*sin(10*pi*x);
    drop = -0.31*(1+tanh(180*(x-xcFC)));
    u = max(x-xcFC,0);
    rebound = 0.48*(x>=xcFC).*(1-exp(-22*u));
    volatility = 0.09*(x>=xcFC).*exp(-10*u).*sin(65*pi*u);
    f = background + drop + rebound + volatility;
    meta = struct;
    meta.ID = "TF026";
    meta.Name = "Flash Crash";
    meta.Category = 2;
    meta.RecommendedN = 1024;
    meta.Parameters = struct("xcFC",xcFC);
    meta.Morphology = "Slow background, rapid loss, delayed rebound, damped volatility";
end

%% Category 3
function [x,f,meta] = TF027_NasonPlethysmography(N,scriptFolder,phaseRespCoef,wDistMu,wDistSigma)
    if nargin < 1 || isempty(N), N = 1024; end
    if nargin < 2, scriptFolder = ""; end
    if nargin < 3 || isempty(phaseRespCoef), phaseRespCoef = struct("a",10.5,"b",0.20,"c",0.75); end
    if nargin < 4 || isempty(wDistMu), wDistMu = 0.51; end
    if nargin < 5 || isempty(wDistSigma), wDistSigma = 0.105; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    ipdFile = fullfile(scriptFolder,"ipd.csv");
    usedExactNasonIPD = false;
    if exist(ipdFile,'file') == 2
        z = readmatrix(ipdFile);
        if ~isempty(z)
            z = z(:,end);
            z = z(isfinite(z));
            if numel(z) >= 16
                xx = linspace(0,1,numel(z));
                f = interp1(xx,z(:).',x,'pchip');
                usedExactNasonIPD = true;
            end
        end
    end
    if ~usedExactNasonIPD
        phaseResp = 2*pi*(phaseRespCoef.a*x + phaseRespCoef.b*sin(2*pi*phaseRespCoef.c*x));
        normalResp = (0.92 + 0.10*sin(2*pi*0.55*x)) .* (sin(phaseResp) + 0.18*sin(2*phaseResp-0.45));
        wDist = exp(-0.5*((x-wDistMu)/wDistSigma).^2);
        disturb = 0.48*wDist.*sin(2*pi*(4.1*x + 1.6*x.^2) + 0.6) + 0.25*wDist.*sin(2*pi*31*x) + 0.14*wDist.*sin(2*pi*53*x + 0.8);
        f = (1-0.88*wDist).*normalResp + disturb;
    end
    meta = struct;
    meta.ID = "TF027";
    meta.Name = "Nason Plethysmography";
    meta.Category = 3;
    meta.RecommendedN = 1024;
    meta.Parameters = struct("usedExactIPD",usedExactNasonIPD,"ipdFile",ipdFile,"phaseRespCoef",phaseRespCoef,"wDistMu",wDistMu,"wDistSigma",wDistSigma);
    meta.Morphology = "Respiratory oscillation with central disturbance or exact plethysmogram if provided";
end

function [x,f,meta] = TF028_VasospasmTCD(N,phaseTCDcoef,onsetGain)
    if nargin < 1 || isempty(N), N = 1024; end
    if nargin < 2 || isempty(phaseTCDcoef), phaseTCDcoef = struct("a",9.0,"b",0.06,"c",0.8); end
    if nargin < 3 || isempty(onsetGain), onsetGain = struct("k",65,"xc",0.56,"scale",0.48); end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    phaseTCD = 2*pi*(phaseTCDcoef.a*x + phaseTCDcoef.b*sin(2*pi*phaseTCDcoef.c*x));
    pulseTCD = 0.55*sin(phaseTCD) + 0.23*sin(2*phaseTCD-0.55) + 0.10*sin(3*phaseTCD-1.00);
    onsetVS = 1./(1 + exp(-onsetGain.k*(x-onsetGain.xc)));
    f = 0.35 + 0.18*pulseTCD + onsetVS.*(onsetGain.scale + 0.18*pulseTCD) + 0.035*sin(2*pi*1.1*x);
    meta = struct;
    meta.ID = "TF028";
    meta.Name = "Vasospasm TCD";
    meta.Category = 3;
    meta.RecommendedN = 1024;
    meta.Parameters = struct("phaseTCDcoef",phaseTCDcoef,"onsetGain",onsetGain);
    meta.Morphology = "TCD velocity with smooth pathological onset increasing mean and pulsatility";
end

function [x,f,meta] = TF029_PVCTrain(N,normalCenters,normalAmp,cPVC)
    if nargin < 1 || isempty(N), N = 1024; end
    if nargin < 2 || isempty(normalCenters), normalCenters = [0.09 0.22 0.35 0.48 0.76 0.89]; end
    if nargin < 3 || isempty(normalAmp), normalAmp = [1.00 0.98 1.03 1.00 0.97 1.02]; end
    if nargin < 4 || isempty(cPVC), cPVC = 0.595; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    f = zeros(size(x));
    for ib = 1:numel(normalCenters)
        c = normalCenters(ib);
        aBeat = normalAmp(ib);
        f = f + aBeat*( ...
             0.12*exp(-0.5*((x-(c-0.036))/0.012).^2) ...
           - 0.14*exp(-0.5*((x-(c-0.008))/0.0045).^2) ...
           + 1.00*exp(-0.5*((x-c)/0.0055).^2) ...
           - 0.26*exp(-0.5*((x-(c+0.010))/0.0060).^2) ...
           + 0.30*exp(-0.5*((x-(c+0.042))/0.018).^2) );
    end
    f = f + ...
         1.05*exp(-0.5*((x-(cPVC-0.006))/0.012).^2) ...
       - 0.72*exp(-0.5*((x-(cPVC+0.011))/0.015).^2) ...
       + 0.42*exp(-0.5*((x-(cPVC+0.045))/0.028).^2);
    meta = struct;
    meta.ID = "TF029";
    meta.Name = "PVC Train";
    meta.Category = 3;
    meta.RecommendedN = 1024;
    meta.Parameters = struct("normalCenters",normalCenters,"normalAmp",normalAmp,"cPVC",cPVC);
    meta.Morphology = "Multiple P-QRS-T beats with a premature ventricular contraction and compensatory pause";
end

function [x,f,meta] = TF030_CheyneStokes(N,episode,phaseCoef)
    if nargin < 1 || isempty(N), N = 1024; end
    if nargin < 2 || isempty(episode), episode = [0.00 0.26; 0.34 0.60; 0.68 0.94]; end
    if nargin < 3 || isempty(phaseCoef), phaseCoef = struct("a",12,"b",0.55); end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    env = zeros(size(x));
    for k = 1:size(episode,1)
        a0 = episode(k,1); b0 = episode(k,2);
        ind = x >= a0 & x <= b0;
        u = (x(ind)-a0)/(b0-a0);
        env(ind) = sin(pi*u).^1.65;
    end
    phaseCS = 2*pi*(phaseCoef.a*x + phaseCoef.b*x.^2);
    f = env .* (sin(phaseCS) + 0.13*sin(2*phaseCS-0.35));
    meta = struct;
    meta.ID = "TF030";
    meta.Name = "Cheyne-Stokes Respiration";
    meta.Category = 3;
    meta.RecommendedN = 1024;
    meta.Parameters = struct("episode",episode,"phaseCoef",phaseCoef);
    meta.Morphology = "Crescendo-decrescendo breathing episodes separated by apnea";
end

function [x,f,meta] = TF031_EEGBurstSuppression(N,burstCenters,burstWidths,burstAmp,oscCoef)
    if nargin < 1 || isempty(N), N = 1024; end
    if nargin < 2 || isempty(burstCenters), burstCenters = [0.17 0.46 0.75]; end
    if nargin < 3 || isempty(burstWidths), burstWidths = [0.095 0.125 0.085]; end
    if nargin < 4 || isempty(burstAmp), burstAmp = [0.95 1.15 0.82]; end
    if nargin < 5 || isempty(oscCoef), oscCoef = struct("a",31,"b",4.5,"c1",53,"phi1",0.7,"c2",79,"phi2",-0.4); end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    f = 0.018*sin(2*pi*5*x);
    osc = sin(2*pi*(oscCoef.a*x + oscCoef.b*x.^2)) + 0.52*sin(2*pi*oscCoef.c1*x + oscCoef.phi1) + 0.23*sin(2*pi*oscCoef.c2*x + oscCoef.phi2);
    for k = 1:numel(burstCenters)
        c = burstCenters(k); s = burstWidths(k);
        w = exp(-0.5*((x-c)/s).^2).^2;
        f = f + burstAmp(k)*w.*osc;
    end
    meta = struct;
    meta.ID = "TF031";
    meta.Name = "EEG Burst-Suppression";
    meta.Category = 3;
    meta.RecommendedN = 1024;
    meta.Parameters = struct("burstCenters",burstCenters,"burstWidths",burstWidths,"burstAmp",burstAmp,"oscCoef",oscCoef);
    meta.Morphology = "High-frequency bursts separated by near-quiescent intervals with weak slow component";
end

function [x,f,meta] = TF032_TremorOnset(N,onsetSlope,center,ampModFreq)
    if nargin < 1 || isempty(N), N = 1024; end
    if nargin < 2 || isempty(onsetSlope), onsetSlope = 75; end
    if nargin < 3 || isempty(center), center = 0.42; end
    if nargin < 4 || isempty(ampModFreq), ampModFreq = 1.25; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    envTremor = 1./(1 + exp(-onsetSlope*(x-center)));
    ampTremor = 0.78 + 0.15*sin(2*pi*ampModFreq*x);
    f = 0.025*sin(2*pi*3*x) + envTremor.*ampTremor.*( sin(2*pi*18*x) + 0.24*sin(2*pi*36*x+0.65) );
    meta = struct;
    meta.ID = "TF032";
    meta.Name = "Tremor Onset";
    meta.Category = 3;
    meta.RecommendedN = 1024;
    meta.Parameters = struct("onsetSlope",onsetSlope,"center",center,"ampModFreq",ampModFreq);
    meta.Morphology = "Onset of sustained amplitude-modulated tremor with a weak harmonic";
end

function [x,f,meta] = TF033_ArterialPulse(N,pulseCenters)
    if nargin < 1 || isempty(N), N = 1024; end
    if nargin < 2 || isempty(pulseCenters), pulseCenters = 0.07:0.115:0.99; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    f = zeros(size(x));
    for k = 1:numel(pulseCenters)
        c = pulseCenters(k);
        ak = 0.92 + 0.08*sin(2*pi*(k-1)/numel(pulseCenters));
        systolic = 1.05*exp(-0.5*((x-c)/0.010).^2);
        shoulder = 0.48*exp(-0.5*((x-(c+0.022))/0.020).^2);
        notch    = 0.23*exp(-0.5*((x-(c+0.039))/0.006).^2);
        reflect  = 0.20*exp(-0.5*((x-(c+0.056))/0.016).^2);
        f = f + ak*(systolic + shoulder - notch + reflect);
    end
    f = f + 0.08;
    meta = struct;
    meta.ID = "TF033";
    meta.Name = "Arterial Pulse";
    meta.Category = 3;
    meta.RecommendedN = 1024;
    meta.Parameters = struct("pulseCenters",pulseCenters);
    meta.Morphology = "Repeated asymmetric arterial-pressure pulses with dicrotic notch and reflected wave";
end

function [x,f,meta] = TF034_EMGRecruitment(N,envEMG,oscEMG)
    if nargin < 1 || isempty(N), N = 1024; end
    if nargin < 2 || isempty(envEMG), envEMG = []; end
    if nargin < 3 || isempty(oscEMG), oscEMG = []; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    if isempty(envEMG)
        envEMG = 0.08 + 0.92./(1 + exp(-35*(x-0.32)));
    elseif isscalar(envEMG)
        envEMG = repmat(envEMG, size(x));
    else
        envEMG = interp1(linspace(0,1,numel(envEMG)),envEMG,x,'linear',envEMG(end));
    end
    if isempty(oscEMG)
        oscEMG = 0.62*sin(2*pi*(24*x + 17*x.^2)) + 0.38*sin(2*pi*(49*x + 0.80*sin(2*pi*1.3*x))) + 0.23*sin(2*pi*83*x + 0.35) + 0.12*sin(2*pi*121*x - 0.8);
    elseif isscalar(oscEMG)
        oscEMG = repmat(oscEMG, size(x));
    else
        oscEMG = interp1(linspace(0,1,numel(oscEMG)),oscEMG,x,'linear',oscEMG(end));
    end
    f = envEMG .* oscEMG;
    meta = struct;
    meta.ID = "TF034";
    meta.Name = "EMG Recruitment";
    meta.Category = 3;
    meta.RecommendedN = 1024;
    meta.Parameters = struct("envEMG",envEMG,"oscEMG",oscEMG);
    meta.Morphology = "Progressive recruitment with increasingly dense oscillatory content after onset";
end

function [x,f,meta] = TF035_BearingFault(N,baseTimes)
    if nargin < 1 || isempty(N), N = 1024; end
    if nargin < 2 || isempty(baseTimes), baseTimes = 0.075:0.112:0.97; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    f = zeros(size(x));
    for k = 1:numel(baseTimes)
        tk = baseTimes(k) + 0.0045*sin(2*pi*(k-1)/5);
        u = x-tk;
        ind = u >= 0;
        impact = 0.65*exp(-0.5*(u/0.0035).^2);
        ring = zeros(size(x));
        ring(ind) = exp(-48*u(ind)).*( sin(2*pi*58*u(ind)) + 0.32*sin(2*pi*103*u(ind)) );
        f = f + impact + ring;
    end
    meta = struct;
    meta.ID = "TF035";
    meta.Name = "Bearing Fault";
    meta.Category = 3;
    meta.RecommendedN = 1024;
    meta.Parameters = struct("baseTimes",baseTimes);
    meta.Morphology = "Localized defect producing impacts and damped high-frequency resonance";
end

function [x,f,meta] = TF036_GearDefect(N,shaft,mesh,phaseGear,ampGear,localDefect)
    if nargin < 1 || isempty(N), N = 1024; end
    if nargin < 2 || isempty(shaft), shaft = 3.2; end
    if nargin < 3 || isempty(mesh), mesh = 31; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    if nargin < 4 || isempty(phaseGear)
        phaseGear = 2*pi*mesh*x + 0.22*sin(2*pi*shaft*x);
    elseif isscalar(phaseGear)
        phaseGear = repmat(phaseGear, size(x));
    else
        phaseGear = interp1(linspace(0,1,numel(phaseGear)),phaseGear,x,'linear',phaseGear(end));
    end
    if nargin < 5 || isempty(ampGear)
        ampGear = 0.78 + 0.22*cos(2*pi*shaft*x);
    elseif isscalar(ampGear)
        ampGear = repmat(ampGear, size(x));
    else
        ampGear = interp1(linspace(0,1,numel(ampGear)),ampGear,x,'linear',ampGear(end));
    end
    carrierGear = ampGear.*sin(phaseGear) + 0.20*sin(2*phaseGear-0.35);
    if nargin < 6 || isempty(localDefect)
        localDefect = 0.70*exp(-0.5*((x-0.63)/0.035).^2).*sin(2*pi*36*x+0.8);
    elseif isscalar(localDefect)
        localDefect = repmat(localDefect, size(x));
    else
        localDefect = interp1(linspace(0,1,numel(localDefect)),localDefect,x,'linear',localDefect(end));
    end
    f = carrierGear + localDefect;
    meta = struct;
    meta.ID = "TF036";
    meta.Name = "Gear Defect";
    meta.Category = 3;
    meta.RecommendedN = 1024;
    meta.Parameters = struct("shaft",shaft,"mesh",mesh,"phaseGear",phaseGear,"ampGear",ampGear,"localDefect",localDefect);
    meta.Morphology = "Gear-mesh carrier with shaft modulation and a localized defect-enhanced packet";
end

function [x,f,meta] = TF037_RotorRub(N,phaseRotor)
    if nargin < 1 || isempty(N), N = 1024; end
    if nargin < 2 || isempty(phaseRotor)
        validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
        x = linspace(0,1,N).';
        phaseRotor = 2*pi*(7*x + 0.035*sin(2*pi*0.9*x));
    end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if ~exist('x','var'), x = linspace(0,1,N).'; end
    if isscalar(phaseRotor)
        phaseRotor = repmat(phaseRotor, size(x));
    else
        phaseRotor = interp1(linspace(0,1,numel(phaseRotor)),phaseRotor,x,'linear',phaseRotor(end));
    end
    zRotor = sin(phaseRotor) + 0.16*sin(2*phaseRotor-0.5);
    contact = max(zRotor-0.48,0);
    f = zRotor - 0.78*contact + 0.09*sin(3*phaseRotor+0.3);
    meta = struct;
    meta.ID = "TF037";
    meta.Name = "Rotor Rub";
    meta.Category = 3;
    meta.RecommendedN = 1024;
    meta.Parameters = struct("phaseRotor",phaseRotor);
    meta.Morphology = "Periodic rotor motion with nonlinear contact producing harmonics and cusps";
end

function [x,f,meta] = TF038_VortexLockIn(N,freqVL,envVL)
    if nargin < 1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    if nargin < 2 || isempty(freqVL)
        freqVL = 7 + 20*min(x,0.55);
        freqVL(x > 0.55) = 18;
    elseif isscalar(freqVL)
        freqVL = repmat(freqVL, size(x));
    else
        freqVL = interp1(linspace(0,1,numel(freqVL)),freqVL,x,'linear',freqVL(end));
    end
    if nargin < 3 || isempty(envVL)
        envVL = 0.16 + 0.84./(1 + exp(-28*(x-0.33)));
    elseif isscalar(envVL)
        envVL = repmat(envVL, size(x));
    else
        envVL = interp1(linspace(0,1,numel(envVL)),envVL,x,'linear',envVL(end));
    end
    phaseVL = 2*pi*cumtrapz(x,freqVL);
    f = envVL.*( sin(phaseVL) + 0.16*sin(2*phaseVL-0.4) );
    meta = struct;
    meta.ID = "TF038";
    meta.Name = "Vortex Lock-In";
    meta.Category = 3;
    meta.RecommendedN = 1024;
    meta.Parameters = struct("freqVL",freqVL,"envVL",envVL);
    meta.Morphology = "Frequency rise then lock-in with growing amplitude";
end

function [x,f,meta] = TF039_InternalSolitons(N,baseOsc,solCenter,solAmp,solWidth)
    if nargin < 1 || isempty(N), N = 1024; end
    if nargin < 2 || isempty(baseOsc), baseOsc = 0.025; end
    if nargin < 3 || isempty(solCenter), solCenter = [0.28 0.405 0.515 0.612 0.700]; end
    if nargin < 4 || isempty(solAmp), solAmp = [1.00 0.78 0.61 0.47 0.34]; end
    if nargin < 5 || isempty(solWidth), solWidth = [0.028 0.024 0.022 0.020 0.018]; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    if isscalar(baseOsc)
        f = baseOsc*sin(2*pi*1.2*x);
    else
        baseOsc = interp1(linspace(0,1,numel(baseOsc)),baseOsc,x,'linear',baseOsc(end));
        f = baseOsc .* sin(2*pi*1.2*x);
    end
    nc = numel(solCenter);
    for k = 1:nc
        u = (x-solCenter(k))/solWidth(k);
        f = f - solAmp(k)./(cosh(u).^2);
    end
    meta = struct;
    meta.ID = "TF039";
    meta.Name = "Internal Solitons";
    meta.Category = 3;
    meta.RecommendedN = 1024;
    meta.Parameters = struct("baseOsc",baseOsc,"solCenter",solCenter,"solAmp",solAmp,"solWidth",solWidth);
    meta.Morphology = "Deep-ocean internal solitary-wave packet (negative sech^2 pulses)";
end

function [x,f,meta] = TF040_WhaleClicks(N,clickTimes,clickAmp)
    if nargin < 1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    if nargin < 2 || isempty(clickTimes)
        clickTimes = [0.105 0.205 0.298 0.397 0.515 0.655 0.815 0.925];
    elseif isscalar(clickTimes)
        clickTimes = repmat(clickTimes,1,1);
    end
    if nargin < 3 || isempty(clickAmp)
        clickAmp = [1.00 0.82 1.08 0.90 0.72 1.03 0.86 0.76];
    elseif isscalar(clickAmp)
        clickAmp = repmat(clickAmp,1,numel(clickTimes));
    end
    % Ensure vectors align to x via interpolation if lengths mismatch with intended positions
    if numel(clickAmp) ~= numel(clickTimes)
        clickAmp = interp1(linspace(0,1,numel(clickAmp)),clickAmp,linspace(0,1,numel(clickTimes)),'linear',clickAmp(end));
    end
    f = zeros(size(x));
    for k = 1:numel(clickTimes)
        tk = clickTimes(k); ak = clickAmp(k);
        s1 = 0.0022;
        u1 = (x-tk)/s1;
        click1 = ak*u1.*exp(-0.5*u1.^2);
        te = tk + 0.012 + 0.002*sin(k);
        s2 = 0.0030;
        u2 = (x-te)/s2;
        echo = 0.25*ak*u2.*exp(-0.5*u2.^2);
        f = f + click1 + echo;
    end
    meta = struct;
    meta.ID = "TF040";
    meta.Name = "Whale Clicks";
    meta.Category = 3;
    meta.RecommendedN = 1024;
    meta.Parameters = struct("clickTimes",clickTimes,"clickAmp",clickAmp);
    meta.Morphology = "Irregular train of bipolar clicks with delayed echoes";
end

function [x,f,meta] = TF041_SonarMultipath(N,c1_center,c1_width,c1_f0,c1_f1,c1_amp, ...
                                              c2_center,c2_width,c2_f0,c2_f1,c2_amp, ...
                                              c3_center,c3_width,c3_f0,c3_f1,c3_amp, ...
                                              rev_start,rev_amp,rev_decay,rev_f1,rev_f2)
    if nargin < 1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    if nargin < 2 || isempty(c1_center), c1_center = 0.22; end
    if nargin < 3 || isempty(c1_width),  c1_width  = 0.030; end
    if nargin < 4 || isempty(c1_f0),    c1_f0     = 28; end
    if nargin < 5 || isempty(c1_f1),    c1_f1     = 145; end
    if nargin < 6 || isempty(c1_amp),   c1_amp    = 1.00; end
    if nargin < 7 || isempty(c2_center), c2_center = 0.405; end
    if nargin < 8 || isempty(c2_width),  c2_width  = 0.036; end
    if nargin < 9 || isempty(c2_f0),    c2_f0     = 28; end
    if nargin < 10 || isempty(c2_f1),   c2_f1     = 120; end
    if nargin < 11 || isempty(c2_amp),  c2_amp    = 0.48; end
    if nargin < 12 || isempty(c3_center), c3_center = 0.545; end
    if nargin < 13 || isempty(c3_width),  c3_width  = 0.043; end
    if nargin < 14 || isempty(c3_f0),    c3_f0     = 26; end
    if nargin < 15 || isempty(c3_f1),    c3_f1     = 105; end
    if nargin < 16 || isempty(c3_amp),   c3_amp    = 0.28; end
    if nargin < 17 || isempty(rev_start), rev_start = 0.56; end
    if nargin < 18 || isempty(rev_amp),   rev_amp   = 0.18; end
    if nargin < 19 || isempty(rev_decay), rev_decay = 5.5; end
    if nargin < 20 || isempty(rev_f1),    rev_f1    = 18; end
    if nargin < 21 || isempty(rev_f2),    rev_f2    = 43; end

    f = chirp_packet(x,c1_center,c1_width,c1_f0,c1_f1,c1_amp) + ...
        chirp_packet(x,c2_center,c2_width,c2_f0,c2_f1,c2_amp) + ...
        chirp_packet(x,c3_center,c3_width,c3_f0,c3_f1,c3_amp);

    uRev = x - rev_start;
    indRev = uRev >= 0;
    rev = zeros(size(x));
    if any(indRev)
        rev(indRev) = rev_amp*exp(-rev_decay*uRev(indRev)).*( ...
            sin(2*pi*rev_f1*uRev(indRev)) + 0.35*sin(2*pi*rev_f2*uRev(indRev)+0.5) );
    end
    f = f + rev;
    meta = struct;
    meta.ID = "TF041";
    meta.Name = "Sonar Multipath";
    meta.Category = 3;
    meta.RecommendedN = 1024;
    meta.Parameters = struct( ...
        "c1_center",c1_center,"c1_width",c1_width,"c1_f0",c1_f0,"c1_f1",c1_f1,"c1_amp",c1_amp, ...
        "c2_center",c2_center,"c2_width",c2_width,"c2_f0",c2_f0,"c2_f1",c2_f1,"c2_amp",c2_amp, ...
        "c3_center",c3_center,"c3_width",c3_width,"c3_f0",c3_f0,"c3_f1",c3_f1,"c3_amp",c3_amp, ...
        "rev_start",rev_start,"rev_amp",rev_amp,"rev_decay",rev_decay,"rev_f1",rev_f1,"rev_f2",rev_f2);
    meta.Morphology = "Localized FM ping with delayed replicas and reverberation";
end

% Helper: chirp packet used by TF041
function y = chirp_packet(x,center,width,f0,f1,amp)
u = (x-center)/width;
env = exp(-0.5*u.^2);
k = (f1-f0)./width; % approximate instantaneous freq slope
phase = 2*pi*(f0*(x-center) + 0.5*(f1-f0).*(x-center).^2/width);
y = amp * env .* sin(phase);
end


function [x,f,meta] = TF042_LightningSferic(N,t0,s0,slow_amp,slow_tau1,slow_tau2,ring_decay,ring_f1,ring_f2,ring_a1,ring_a2,td,sd,prim_amp,delayed_amp)
    if nargin < 1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    if nargin < 2 || isempty(t0), t0 = 0.285; end
    if nargin < 3 || isempty(s0), s0 = 0.0032; end
    if nargin < 4 || isempty(slow_amp), slow_amp = 0.36; end
    if nargin < 5 || isempty(slow_tau1), slow_tau1 = 10; end
    if nargin < 6 || isempty(slow_tau2), slow_tau2 = 65; end
    if nargin < 7 || isempty(ring_decay), ring_decay = 23; end
    if nargin < 8 || isempty(ring_f1), ring_f1 = 72; end
    if nargin < 9 || isempty(ring_f2), ring_f2 = 24; end
    if nargin < 10 || isempty(ring_a1), ring_a1 = 0.34; end
    if nargin < 11 || isempty(ring_a2), ring_a2 = 0.14; end
    if nargin < 12 || isempty(td), td = 0.475; end
    if nargin < 13 || isempty(sd), sd = 0.0045; end
    if nargin < 14 || isempty(prim_amp), prim_amp = 1.25; end
    if nargin < 15 || isempty(delayed_amp), delayed_amp = 0.20; end

    u0 = (x-t0)/s0;
    primarySferic = prim_amp * u0 .* exp(-0.5*u0.^2);

    uL = x - t0;
    indL = uL >= 0;
    slowL = zeros(size(x));
    ringL = zeros(size(x));
    if any(indL)
        slowL(indL) = slow_amp * ( exp(-slow_tau1 * uL(indL)) - exp(-slow_tau2 * uL(indL)) );
        ringL(indL) = exp(-ring_decay * uL(indL)) .* ( ring_a1*sin(2*pi*ring_f1*uL(indL)) + ring_a2*sin(2*pi*ring_f2*uL(indL) + 0.55) );
    end

    ud = (x-td)/sd;
    delayedL = delayed_amp * ud .* exp(-0.5*ud.^2);

    f = primarySferic + slowL + ringL + delayedL;

    meta = struct;
    meta.ID = "TF042";
    meta.Name = "Lightning Sferic";
    meta.Category = 3;
    meta.RecommendedN = 1024;
    meta.Parameters = struct( ...
        "t0",t0,"s0",s0, ...
        "slow_amp",slow_amp,"slow_tau1",slow_tau1,"slow_tau2",slow_tau2, ...
        "ring_decay",ring_decay,"ring_f1",ring_f1,"ring_f2",ring_f2,"ring_a1",ring_a1,"ring_a2",ring_a2, ...
        "td",td,"sd",sd, ...
        "prim_amp",prim_amp,"delayed_amp",delayed_amp);
    meta.Morphology = "Multiscale electromagnetic transient with bipolar front and ringing";
end

%% Category 4: 43 - 58
function [x,f,meta] = TF043_StampShadeRun(N,base_a,base_b,base_c,batch_amp,batch_ctr,batch_w,late_amp,late_ctr,small_amp,small_freq)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(base_a), base_a = 0.20; end
    if nargin<3 || isempty(base_b), base_b = 0.34; end
    if nargin<4 || isempty(base_c), base_c = 0.035; end
    if nargin<5 || isempty(batch_amp), batch_amp = 0.18; end
    if nargin<6 || isempty(batch_ctr), batch_ctr = 0.47; end
    if nargin<7 || isempty(batch_w), batch_w = 180; end
    if nargin<8 || isempty(late_amp), late_amp = -0.22; end
    if nargin<9 || isempty(late_ctr), late_ctr = 0.47; end
    if nargin<10 || isempty(small_amp), small_amp = 0.018; end
    if nargin<11 || isempty(small_freq), small_freq = 17; end

    x = linspace(0,1,N).';
    baseShade = base_a + base_b*x + base_c*sin(2*pi*2.2*x);
    batchJump = batch_amp./(1 + exp(-batch_w*(x-batch_ctr)));
    lateDrift = late_amp*max(x-late_ctr,0);
    smallRunStructure = small_amp*sin(2*pi*small_freq*x).*(0.35 + 0.65*x);
    f = baseShade + batchJump + lateDrift + smallRunStructure;
    meta = struct;
    meta.ID = "TF043";
    meta.Name = "Stamp Shade Run";
    meta.Category = 4;
    meta.RecommendedN = 1024;
    meta.Parameters = struct( ...
        "base_a",base_a,"base_b",base_b,"base_c",base_c, ...
        "batch_amp",batch_amp,"batch_ctr",batch_ctr,"batch_w",batch_w, ...
        "late_amp",late_amp,"late_ctr",late_ctr, ...
        "small_amp",small_amp,"small_freq",small_freq);
    meta.Morphology = "Smooth press/ink drift with discrete replenishment and fine run structure";
end

function [x,f,meta] = TF044_PerforationDrift(N,offset,slope,a1,f1,a2,f2,bad_amp,bad_ctr,bad_w,bad2_amp,bad2_ctr,bad2_w)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(offset), offset = 1.00; end
    if nargin<3 || isempty(slope), slope = 0.055; end
    if nargin<4 || isempty(a1), a1 = 0.030; end
    if nargin<5 || isempty(f1), f1 = 8; end
    if nargin<6 || isempty(a2), a2 = 0.012; end
    if nargin<7 || isempty(f2), f2 = 31; end
    if nargin<8 || isempty(bad_amp), bad_amp = 0.18; end
    if nargin<9 || isempty(bad_ctr), bad_ctr = 0.63; end
    if nargin<10 || isempty(bad_w), bad_w = 0.007; end
    if nargin<11 || isempty(bad2_amp), bad2_amp = -0.10; end
    if nargin<12 || isempty(bad2_ctr), bad2_ctr = 0.648; end
    if nargin<13 || isempty(bad2_w), bad2_w = 0.005; end

    x = linspace(0,1,N).';
    f = offset + slope*(x-0.5) + a1*sin(2*pi*f1*x) + a2*sin(2*pi*f2*x+0.4);
    f = f + bad_amp*exp(-0.5*((x-bad_ctr)/bad_w).^2) + bad2_amp*exp(-0.5*((x-bad2_ctr)/bad2_w).^2);
    meta = struct;
    meta.ID = "TF044";
    meta.Name = "Perforation Drift";
    meta.Category = 4;
    meta.RecommendedN = 1024;
    meta.Parameters = struct( ...
        "offset",offset,"slope",slope,"a1",a1,"f1",f1,"a2",a2,"f2",f2, ...
        "bad_amp",bad_amp,"bad_ctr",bad_ctr,"bad_w",bad_w, ...
        "bad2_amp",bad2_amp,"bad2_ctr",bad2_ctr,"bad2_w",bad2_w);
    meta.Morphology = "Nominal pitch with slow drift, periodic eccentricity and a bad pin";
end

function [x,f,meta] = TF045_StampReflectance(N,lam_min,lam_max,baseline_k,band1_a,band1_ctr,band1_w,band2_a,band2_ctr,band2_w,shoulder_a,shoulder_ctr,shoulder_w)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(lam_min), lam_min = 400; end
    if nargin<3 || isempty(lam_max), lam_max = 700; end
    if nargin<4 || isempty(baseline_k), baseline_k = 0.00035; end
    if nargin<5 || isempty(band1_a), band1_a = 0.42; end
    if nargin<6 || isempty(band1_ctr), band1_ctr = 525; end
    if nargin<7 || isempty(band1_w), band1_w = 38; end
    if nargin<8 || isempty(band2_a), band2_a = 0.16; end
    if nargin<9 || isempty(band2_ctr), band2_ctr = 585; end
    if nargin<10 || isempty(band2_w), band2_w = 24; end
    if nargin<11 || isempty(shoulder_a), shoulder_a = 0.08; end
    if nargin<12 || isempty(shoulder_ctr), shoulder_ctr = 455; end
    if nargin<13 || isempty(shoulder_w), shoulder_w = 18; end

    x = linspace(0,1,N).';
    lambda = lam_min + (lam_max-lam_min)*x;
    baselineR = 0.72 + baseline_k*(lambda-550);
    band1 = band1_a*exp(-0.5*((lambda-band1_ctr)/band1_w).^2);
    band2 = band2_a*exp(-0.5*((lambda-band2_ctr)/band2_w).^2);
    shoulder = shoulder_a*exp(-0.5*((lambda-shoulder_ctr)/shoulder_w).^2);
    f = baselineR - band1 - band2 - shoulder;
    meta = struct;
    meta.ID = "TF045";
    meta.Name = "Stamp Reflectance";
    meta.Category = 4;
    meta.RecommendedN = 1024;
    meta.Parameters = struct( ...
        "lam_min",lam_min,"lam_max",lam_max,"baseline_k",baseline_k, ...
        "band1_a",band1_a,"band1_ctr",band1_ctr,"band1_w",band1_w, ...
        "band2_a",band2_a,"band2_ctr",band2_ctr,"band2_w",band2_w, ...
        "shoulder_a",shoulder_a,"shoulder_ctr",shoulder_ctr,"shoulder_w",shoulder_w);
    meta.Morphology = "Visible reflectance with broad absorption, shoulder and weak band";
end

function [x,f,meta] = TF046_PlateWear(N,w1_a,w1_pow,maint_amp,maint_ctr,wear2_amp,micro_amp,micro_freq)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(w1_a), w1_a = 1.0; end
    if nargin<3 || isempty(w1_pow), w1_pow = 0.82; end
    if nargin<4 || isempty(maint_amp), maint_amp = 0.20; end
    if nargin<5 || isempty(maint_ctr), maint_ctr = 0.56; end
    if nargin<6 || isempty(wear2_amp), wear2_amp = -0.28; end
    if nargin<7 || isempty(micro_amp), micro_amp = 0.018; end
    if nargin<8 || isempty(micro_freq), micro_freq = 12; end

    x = linspace(0,1,N).';
    wear1 = w1_a - 0.38*x.^w1_pow;
    maintenance = maint_amp./(1 + exp(-160*(x-maint_ctr)));
    wear2 = wear2_amp*max(x-maint_ctr,0);
    microWear = micro_amp*sin(2*pi*micro_freq*x).*(1-0.4*x);
    f = wear1 + maintenance + wear2 + microWear;
    meta = struct;
    meta.ID = "TF046";
    meta.Name = "Plate Wear";
    meta.Category = 4;
    meta.RecommendedN = 1024;
    meta.Parameters = struct( ...
        "w1_a",w1_a,"w1_pow",w1_pow,"maint_amp",maint_amp,"maint_ctr",maint_ctr, ...
        "wear2_amp",wear2_amp,"micro_amp",micro_amp,"micro_freq",micro_freq);
    meta.Morphology = "Progressive wear with maintenance reset and renewed wear";
end

function [x,f,meta] = TF047_TreeRingWidth(N,a1,p1,a2,a3,d1_ctr,d1_w,d2_ctr,d2_w,rec_amp,rec_ctr,rec_w)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(a1), a1 = 0.75; end
    if nargin<3 || isempty(p1), p1 = 0.12; end
    if nargin<4 || isempty(a2), a2 = 0.07; end
    if nargin<5 || isempty(a3), a3 = 0.035; end
    if nargin<6 || isempty(d1_ctr), d1_ctr = 0.34; end
    if nargin<7 || isempty(d1_w), d1_w = 0.055; end
    if nargin<8 || isempty(d2_ctr), d2_ctr = 0.72; end
    if nargin<9 || isempty(d2_w), d2_w = 0.035; end
    if nargin<10 || isempty(rec_amp), rec_amp = 0.14; end
    if nargin<11 || isempty(rec_ctr), rec_ctr = 0.43; end
    if nargin<12 || isempty(rec_w), rec_w = 0.025; end

    x = linspace(0,1,N).';
    f = a1 + p1*sin(2*pi*5*x+0.3) + a2*sin(2*pi*13*x) + a3*sin(2*pi*31*x+0.7);
    drought1 = 0.42*exp(-0.5*((x-d1_ctr)/d1_w).^2);
    drought2 = 0.30*exp(-0.5*((x-d2_ctr)/d2_w).^2);
    recovery = rec_amp*exp(-0.5*((x-rec_ctr)/rec_w).^2);
    f = f - drought1 - drought2 + recovery;
    meta = struct;
    meta.ID = "TF047";
    meta.Name = "Tree-Ring Width";
    meta.Category = 4;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Multi-year growth with droughts and recovery";
end

function [x,f,meta] = TF048_IceCoreProxy(N,slow_a,slow_b,slow_phi,fine_a,fine_phase,event_amp,event_ctr,event_w,step_a,step1_k,step1_ctr,step2_k,step2_ctr)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(slow_a), slow_a = 0.34; end
    if nargin<3 || isempty(slow_b), slow_b = 0.16; end
    if nargin<4 || isempty(slow_phi), slow_phi = 0.7; end
    if nargin<5 || isempty(fine_a), fine_a = 0.045; end
    if nargin<6 || isempty(fine_phase), fine_phase = 0; end
    if nargin<7 || isempty(event_amp), event_amp = -0.62; end
    if nargin<8 || isempty(event_ctr), event_ctr = 0.58; end
    if nargin<9 || isempty(event_w), event_w = 0.018; end
    if nargin<10 || isempty(step_a), step_a = 0.20; end
    if nargin<11 || isempty(step1_k), step1_k = 85; end
    if nargin<12 || isempty(step1_ctr), step1_ctr = 0.62; end
    if nargin<13 || isempty(step2_k), step2_k = 55; end
    if nargin<14 || isempty(step2_ctr), step2_ctr = 0.76; end

    x = linspace(0,1,N).';
    slowIce = slow_a*sin(2*pi*1.25*x) + slow_b*sin(2*pi*3.4*x+slow_phi);
    fineIce = fine_a*sin(2*pi*27*x).*(0.7+0.3*cos(2*pi*x + fine_phase));
    eventIce = event_amp*exp(-0.5*((x-event_ctr)/event_w).^2);
    stepIce = step_a*(1./(1+exp(-step1_k*(x-step1_ctr))) - 1./(1+exp(-step2_k*(x-step2_ctr))));
    f = slowIce + fineIce + eventIce + stepIce;
    meta = struct;
    meta.ID = "TF048";
    meta.Name = "Ice-Core Proxy";
    meta.Category = 4;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Slow paleoclimate oscillation with abrupt excursion and step";
end

function [x,f,meta] = TF049_Seismogram(N,baseline_a,p_ctr,p_w,p_amp,s_ctr,s_w,s_amp,c_amp,c_ctr,c_decay,c1_freq,c2_amp,c2_freq)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(baseline_a), baseline_a = 0.01; end
    if nargin<3 || isempty(p_ctr), p_ctr = 0.25; end
    if nargin<4 || isempty(p_w), p_w = 0.028; end
    if nargin<5 || isempty(p_amp), p_amp = 0.42; end
    if nargin<6 || isempty(s_ctr), s_ctr = 0.43; end
    if nargin<7 || isempty(s_w), s_w = 0.055; end
    if nargin<8 || isempty(s_amp), s_amp = 1.00; end
    if nargin<9 || isempty(c_amp), c_amp = 0.40; end
    if nargin<10 || isempty(c_ctr), c_ctr = 0.47; end
    if nargin<11 || isempty(c_decay), c_decay = 4.8; end
    if nargin<12 || isempty(c1_freq), c1_freq = 31; end
    if nargin<13 || isempty(c2_amp), c2_amp = 0.35; end
    if nargin<14 || isempty(c2_freq), c2_freq = 59; end

    x = linspace(0,1,N).';
    f = baseline_a*sin(2*pi*4*x);
    wP = exp(-0.5*((x-p_ctr)/p_w).^2);
    pWave = p_amp*wP.*sin(2*pi*(38*x + 24*x.^2));
    wS = exp(-0.5*((x-s_ctr)/s_w).^2);
    sWave = s_amp*wS.*(sin(2*pi*24*x) + 0.28*sin(2*pi*51*x+0.5));
    uC = max(x-c_ctr,0);
    coda = (x>=c_ctr).*c_amp.*exp(-c_decay*uC).*(sin(2*pi*c1_freq*uC)+c2_amp*sin(2*pi*c2_freq*uC+0.6));
    f = f + pWave + sWave + coda;
    meta = struct;
    meta.ID = "TF049";
    meta.Name = "Seismogram";
    meta.Category = 4;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "P- and S-wave packets with long coda on quiet baseline";
end

function [x,f,meta] = TF050_VolcanicTremor(N,env_k,env_ctr,carrier1_a,carrier2_a,burst1_a,burst1_ctr,burst1_w,burst2_a,burst2_ctr,burst2_w)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(env_k), env_k = 55; end
    if nargin<3 || isempty(env_ctr), env_ctr = 0.29; end
    if nargin<4 || isempty(carrier1_a), carrier1_a = 1; end
    if nargin<5 || isempty(carrier2_a), carrier2_a = 0.33; end
    if nargin<6 || isempty(burst1_a), burst1_a = 0.55; end
    if nargin<7 || isempty(burst1_ctr), burst1_ctr = 0.49; end
    if nargin<8 || isempty(burst1_w), burst1_w = 0.045; end
    if nargin<9 || isempty(burst2_a), burst2_a = 0.42; end
    if nargin<10 || isempty(burst2_ctr), burst2_ctr = 0.72; end
    if nargin<11 || isempty(burst2_w), burst2_w = 0.035; end

    x = linspace(0,1,N).';
    envVT = 1./(1 + exp(-env_k*(x-env_ctr)));
    carrierVT = carrier1_a*sin(2*pi*(17*x + 0.9*x.^2)) + carrier2_a*sin(2*pi*35*x+0.4);
    burstVT = 1 + burst1_a*exp(-0.5*((x-burst1_ctr)/burst1_w).^2) + burst2_a*exp(-0.5*((x-burst2_ctr)/burst2_w).^2);
    f = envVT.*burstVT.*carrierVT;
    meta = struct;
    meta.ID = "TF050";
    meta.Name = "Volcanic Tremor";
    meta.Category = 4;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Onset of persistent tremor with recurrent amplitude bursts";
end

function [x,f,meta] = TF051_RogueWave(N,sea_a,sea_mod,sea_f,rogue_a,rogue_ctr,rogue_w,rogue_freq,rogue_phase)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(sea_a), sea_a = 0.48; end
    if nargin<3 || isempty(sea_mod), sea_mod = 0.15; end
    if nargin<4 || isempty(sea_f), sea_f = 9; end
    if nargin<5 || isempty(rogue_a), rogue_a = 1.55; end
    if nargin<6 || isempty(rogue_ctr), rogue_ctr = 0.61; end
    if nargin<7 || isempty(rogue_w), rogue_w = 0.030; end
    if nargin<8 || isempty(rogue_freq), rogue_freq = 9; end
    if nargin<9 || isempty(rogue_phase), rogue_phase = pi/2; end

    x = linspace(0,1,N).';
    sea = (sea_a + sea_mod*sin(2*pi*0.8*x)).*(sin(2*pi*sea_f*x) + 0.20*sin(2*pi*(2*sea_f)*x+0.5));
    rogue = rogue_a*exp(-0.5*((x-rogue_ctr)/rogue_w).^2).*sin(2*pi*rogue_freq*(x-rogue_ctr)+rogue_phase);
    f = sea + rogue;
    meta = struct;
    meta.ID = "TF051";
    meta.Name = "Rogue Wave";
    meta.Category = 4;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Narrow-band wave train with an extreme crest-trough event";
end

function [x,f,meta] = TF052_StellarTransitFlare(N,base_a,base_f1,base_f2,transit_a,transit_ctr,transit_w,flare_a,flare_ctr,flare_rise,flare_decay)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(base_a), base_a = 1; end
    if nargin<3 || isempty(base_f1), base_f1 = 0.018; end
    if nargin<4 || isempty(base_f2), base_f2 = 0.008; end
    if nargin<5 || isempty(transit_a), transit_a = -0.080; end
    if nargin<6 || isempty(transit_ctr), transit_ctr = 0.39; end
    if nargin<7 || isempty(transit_w), transit_w = 0.037; end
    if nargin<8 || isempty(flare_a), flare_a = 0.19; end
    if nargin<9 || isempty(flare_ctr), flare_ctr = 0.69; end
    if nargin<10 || isempty(flare_rise), flare_rise = 150; end
    if nargin<11 || isempty(flare_decay), flare_decay = 18; end

    x = linspace(0,1,N).';
    stellarBase = base_a + base_f1*sin(2*pi*3*x) + base_f2*sin(2*pi*11*x+0.4);
    transit = transit_a*exp(-((x-transit_ctr)/transit_w).^8);
    uFlare = max(x-flare_ctr,0);
    flare = (x>=flare_ctr).*flare_a.*(1-exp(-flare_rise*uFlare)).*exp(-flare_decay*uFlare);
    f = stellarBase + transit + flare;
    meta = struct;
    meta.ID = "TF052";
    meta.Name = "Stellar Transit + Flare";
    meta.Category = 4;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Transit dip followed by rapid flare and slow decay";
end

function [x,f,meta] = TF053_CyclicVoltammetry(N,E_start,E_end,split_frac,scale_a,peak1_a,peak1_ctr,peak1_w,peak2_a,peak2_ctr,peak2_w)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(E_start), E_start = -1; end
    if nargin<3 || isempty(E_end), E_end = 3; end
    if nargin<4 || isempty(split_frac), split_frac = 0.5; end
    if nargin<5 || isempty(scale_a), scale_a = 0.07; end
    if nargin<6 || isempty(peak1_a), peak1_a = 1.00; end
    if nargin<7 || isempty(peak1_ctr), peak1_ctr = 0.36; end
    if nargin<8 || isempty(peak1_w), peak1_w = 0.18; end
    if nargin<9 || isempty(peak2_a), peak2_a = -0.82; end
    if nargin<10 || isempty(peak2_ctr), peak2_ctr = 0.08; end
    if nargin<11 || isempty(peak2_w), peak2_w = 0.22; end

    x = linspace(0,1,N).';
    Ecv = zeros(size(x));
    forward = x <= split_frac;
    reverse = ~forward;
    Ecv(forward) = E_start + (E_end - E_start)*(x(forward)/split_frac);
    Ecv(reverse) = E_end - (E_end - E_start)*((x(reverse)-split_frac)/(1-split_frac));
    iCV = scale_a*Ecv;
    iCV(forward) = iCV(forward) + peak1_a*exp(-0.5*((Ecv(forward)-peak1_ctr)/peak1_w).^2);
    iCV(reverse) = iCV(reverse) + peak2_a*exp(-0.5*((Ecv(reverse)-peak2_ctr)/peak2_w).^2);
    f = iCV;
    meta = struct;
    meta.ID = "TF053";
    meta.Name = "Cyclic Voltammetry";
    meta.Category = 4;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Forward and reverse potential sweep with redox peaks";
end

function [x,f,meta] = TF054_FractureAcousticEmission(N,eventT,eventA,ring_base_decay,pulse_width,ring_freq_base,ring_freq_step)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(eventT), eventT = [0.16 0.31 0.47 0.60 0.70 0.775 0.835 0.885 0.925 0.955].'; end
    if nargin<3 || isempty(eventA), eventA = [0.22 0.28 0.25 0.35 0.42 0.55 0.68 0.82 1.00 1.18].'; end
    if nargin<4 || isempty(ring_base_decay), ring_base_decay = 30; end
    if nargin<5 || isempty(pulse_width), pulse_width = 0.0025; end
    if nargin<6 || isempty(ring_freq_base), ring_freq_base = 45; end
    if nargin<7 || isempty(ring_freq_step), ring_freq_step = 4; end

    x = linspace(0,1,N).';
    f = zeros(size(x));
    for k = 1:numel(eventT)
        u = x - eventT(k);
        ind = u >= 0;
        ring = zeros(size(x));
        ring(ind) = eventA(k)*exp(-(ring_base_decay+2*k).*u(ind)).*sin(2*pi*(ring_freq_base+ring_freq_step*k).*u(ind));
        pulse = 0.45*eventA(k)*exp(-0.5*(u/pulse_width).^2);
        f = f + pulse + ring;
    end
    meta = struct;
    meta.ID = "TF054";
    meta.Name = "Fracture Acoustic Emission";
    meta.Category = 4;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Sparse AE bursts becoming denser/larger near failure";
end

function [x,f,meta] = TF055_Pharmacokinetic(N,tPK_scale,abs_k,elim_a,elim_b,elim_k1,elim_k2,secondDoseTime,secondDoseA,secondDose_onset_k,secondDose_decay_k)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(tPK_scale), tPK_scale = 12; end
    if nargin<3 || isempty(abs_k), abs_k = 2.2; end
    if nargin<4 || isempty(elim_a), elim_a = 0.78; end
    if nargin<5 || isempty(elim_b), elim_b = 0.22; end
    if nargin<6 || isempty(elim_k1), elim_k1 = 0.24; end
    if nargin<7 || isempty(elim_k2), elim_k2 = 1.3; end
    if nargin<8 || isempty(secondDoseTime), secondDoseTime = 5.3; end
    if nargin<9 || isempty(secondDoseA), secondDoseA = 0.16; end
    if nargin<10 || isempty(secondDose_onset_k), secondDose_onset_k = 2.8; end
    if nargin<11 || isempty(secondDose_decay_k), secondDose_decay_k = 0.55; end

    x = linspace(0,1,N).';
    tPK = tPK_scale*x;
    absorb = 1 - exp(-abs_k*tPK);
    elim = elim_a*exp(-elim_k1*tPK) + elim_b*exp(-elim_k2*tPK);
    f = absorb .* elim;
    uDose = max(tPK - secondDoseTime, 0);
    f = f + (tPK>=secondDoseTime).*secondDoseA.*(1 - exp(-secondDose_onset_k*uDose)).*exp(-secondDose_decay_k*uDose);
    meta = struct;
    meta.ID = "TF055";
    meta.Name = "Pharmacokinetic";
    meta.Category = 4;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Oral-like absorption with biexponential elimination and second dose shoulder";
end

function [x,f,meta] = TF056_EpidemicSeasonal(N,season_base,season_amp,season_freq,season_phase,outbreak_a,outbreak_ctr,outbreak_w,interv_a,interv_k,interv_ctr)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(season_base), season_base = 0.30; end
    if nargin<3 || isempty(season_amp), season_amp = 0.10; end
    if nargin<4 || isempty(season_freq), season_freq = 4; end
    if nargin<5 || isempty(season_phase), season_phase = -0.8; end
    if nargin<6 || isempty(outbreak_a), outbreak_a = 0.95; end
    if nargin<7 || isempty(outbreak_ctr), outbreak_ctr = 0.54; end
    if nargin<8 || isempty(outbreak_w), outbreak_w = 0.060; end
    if nargin<9 || isempty(interv_a), interv_a = -0.18; end
    if nargin<10 || isempty(interv_k), interv_k = 70; end
    if nargin<11 || isempty(interv_ctr), interv_ctr = 0.63; end

    x = linspace(0,1,N).';
    season = season_base + season_amp*sin(2*pi*season_freq*x + season_phase);
    outbreak = outbreak_a*exp(-0.5*((x-outbreak_ctr)/outbreak_w).^2);
    intervention = interv_a./(1 + exp(-interv_k*(x-interv_ctr)));
    f = season + outbreak + intervention;
    meta = struct;
    meta.ID = "TF056";
    meta.Name = "Epidemic Seasonal";
    meta.Category = 4;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Seasonal endemic background with localized outbreak and intervention decay";
end

function [x,f,meta] = TF057_PollutionEpisode(N,diurnal_base,diurnal_amp1,diurnal_freq,diurnal_amp2,diurnal_phase,episode1_a,episode1_ctr,episode1_w,episode2_a,episode2_ctr,episode2_w)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(diurnal_base), diurnal_base = 0.36; end
    if nargin<3 || isempty(diurnal_amp1), diurnal_amp1 = 0.11; end
    if nargin<4 || isempty(diurnal_freq), diurnal_freq = 7; end
    if nargin<5 || isempty(diurnal_amp2), diurnal_amp2 = 0.04; end
    if nargin<6 || isempty(diurnal_phase), diurnal_phase = -0.5; end
    if nargin<7 || isempty(episode1_a), episode1_a = 0.62; end
    if nargin<8 || isempty(episode1_ctr), episode1_ctr = 0.38; end
    if nargin<9 || isempty(episode1_w), episode1_w = 0.030; end
    if nargin<10 || isempty(episode2_a), episode2_a = 0.42; end
    if nargin<11 || isempty(episode2_ctr), episode2_ctr = 0.73; end
    if nargin<12 || isempty(episode2_w), episode2_w = 0.055; end

    x = linspace(0,1,N).';
    diurnal = diurnal_base + diurnal_amp1*sin(2*pi*diurnal_freq*x + diurnal_phase) + diurnal_amp2*sin(2*pi*(2*diurnal_freq)*x + 0.2);
    episode1 = episode1_a*exp(-0.5*((x-episode1_ctr)/episode1_w).^2);
    episode2 = episode2_a*exp(-0.5*((x-episode2_ctr)/episode2_w).^2);
    f = diurnal + episode1 + episode2;
    meta = struct;
    meta.ID = "TF057";
    meta.Name = "Pollution Episode";
    meta.Category = 4;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Diurnal cycle with transient concentration episodes";
end

function [x,f,meta] = TF058_Chromatogram(N,baseline_slope,baseline_intercept,pkC,pkA,pkW,tail_a,tail_start,tail_k)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(baseline_slope), baseline_slope = 0.018; end
    if nargin<3 || isempty(baseline_intercept), baseline_intercept = 0.035; end
    if nargin<4 || isempty(pkC), pkC = [0.16 0.29 0.43 0.50 0.67 0.81 0.87].'; end
    if nargin<5 || isempty(pkA), pkA = [0.42 0.78 0.33 0.54 1.00 0.47 0.29].'; end
    if nargin<6 || isempty(pkW), pkW = [0.012 0.018 0.011 0.022 0.016 0.020 0.013].'; end
    if nargin<7 || isempty(tail_a), tail_a = 0.10; end
    if nargin<8 || isempty(tail_start), tail_start = 0.67; end
    if nargin<9 || isempty(tail_k), tail_k = 18; end

    x = linspace(0,1,N).';
    f = baseline_intercept + baseline_slope*x;
    for k = 1:numel(pkC)
        f = f + pkA(k)*exp(-0.5*((x - pkC(k))/pkW(k)).^2);
    end
    f = f + tail_a*(x>tail_start).*exp(-tail_k*(x-tail_start));
    meta = struct;
    meta.ID = "TF058";
    meta.Name = "Chromatogram";
    meta.Category = 4;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Stable baseline with unequal Gaussian-like peaks and weak tail";
end

%% Category 5: 59 - 70

function [x,f,meta] = TF059_ECGBeat(N,baseline_amp1,baseline_amp2,P_a,P_ctr,P_w,Q_a,Q_ctr,Q_w,R_a,R_ctr,R_w,S_a,S_ctr,S_w,ST_a,ST_lenscale,T_a,T_ctr,T_w)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(baseline_amp1), baseline_amp1 = 0.018; end
    if nargin<3 || isempty(baseline_amp2), baseline_amp2 = 0.010; end
    if nargin<4 || isempty(P_a), P_a = 0.12; end
    if nargin<5 || isempty(P_ctr), P_ctr = 0.18; end
    if nargin<6 || isempty(P_w), P_w = 0.030; end
    if nargin<7 || isempty(Q_a), Q_a = -0.16; end
    if nargin<8 || isempty(Q_ctr), Q_ctr = 0.365; end
    if nargin<9 || isempty(Q_w), Q_w = 0.010; end
    if nargin<10 || isempty(R_a), R_a = 1.05; end
    if nargin<11 || isempty(R_ctr), R_ctr = 0.392; end
    if nargin<12 || isempty(R_w), R_w = 0.0065; end
    if nargin<13 || isempty(S_a), S_a = -0.28; end
    if nargin<14 || isempty(S_ctr), S_ctr = 0.418; end
    if nargin<15 || isempty(S_w), S_w = 0.012; end
    if nargin<16 || isempty(ST_a), ST_a = 0.045; end
    if nargin<17 || isempty(ST_lenscale), ST_lenscale = struct('rise_k',90,'fall_k',55,'rise_ctr',0.455,'fall_ctr',0.58); end
    if nargin<18 || isempty(T_a), T_a = 0.34; end
    if nargin<19 || isempty(T_ctr), T_ctr = 0.68; end
    if nargin<20 || isempty(T_w), T_w = 0.060; end

    x = linspace(0,1,N).';
    baselineECG = baseline_amp1*sin(2*pi*1.25*x) + baseline_amp2*sin(2*pi*3.1*x+0.4);
    Pwave =  P_a*exp(-0.5*((x-P_ctr)/P_w).^2);
    Qwave =  Q_a*exp(-0.5*((x-Q_ctr)/Q_w).^2);
    Rwave =  R_a*exp(-0.5*((x-R_ctr)/R_w).^2);
    Swave =  S_a*exp(-0.5*((x-S_ctr)/S_w).^2);
    STseg =  ST_a*(1./(1+exp(-ST_lenscale.rise_k*(x-ST_lenscale.rise_ctr))) - 1./(1+exp(-ST_lenscale.fall_k*(x-ST_lenscale.fall_ctr))));
    Twave =  T_a*exp(-0.5*((x-T_ctr)/T_w).^2);
    f = baselineECG + Pwave + Qwave + Rwave + Swave + STseg + Twave;
    meta = struct;
    meta.ID = "TF059";
    meta.Name = "ECG Beat";
    meta.Category = 5;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Small P wave, sharp QRS complex, broad T wave, and weak baseline wander";
end

function [x,f,meta] = TF060_ArterialPulse(N,baseline,main_amp,main_shift,main_pow,main_scale,notch_a,notch_ctr,notch_w,rebound_a,rebound_ctr,rebound_w,tail_a,tail_start,tail_k)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(baseline), baseline = 0.065; end
    if nargin<3 || isempty(main_amp), main_amp = 0.92; end
    if nargin<4 || isempty(main_shift), main_shift = 0.07; end
    if nargin<5 || isempty(main_pow), main_pow = 2.15; end
    if nargin<6 || isempty(main_scale), main_scale = 8.8; end
    if nargin<7 || isempty(notch_a), notch_a = -0.115; end
    if nargin<8 || isempty(notch_ctr), notch_ctr = 0.50; end
    if nargin<9 || isempty(notch_w), notch_w = 0.012; end
    if nargin<10 || isempty(rebound_a), rebound_a = 0.060; end
    if nargin<11 || isempty(rebound_ctr), rebound_ctr = 0.545; end
    if nargin<12 || isempty(rebound_w), rebound_w = 0.021; end
    if nargin<13 || isempty(tail_a), tail_a = 0.065; end
    if nargin<14 || isempty(tail_start), tail_start = 0.53; end
    if nargin<15 || isempty(tail_k), tail_k = 4.8; end

    x = linspace(0,1,N).';
    uAP = max(x - main_shift, 0);
    mainPulse = (uAP.^main_pow) .* exp(-main_scale * uAP);
    mainPulse = mainPulse ./ max(mainPulse);
    dicroticNotch = notch_a * exp(-0.5*((x - notch_ctr)/notch_w).^2);
    dicroticRebound = rebound_a * exp(-0.5*((x - rebound_ctr)/rebound_w).^2);
    diastolicTail = tail_a * (x >= tail_start) .* exp(-tail_k * (x - tail_start));
    f = baseline + main_amp * mainPulse + dicroticNotch + dicroticRebound + diastolicTail;

    meta = struct;
    meta.ID = "TF060";
    meta.Name = "Arterial Pulse";
    meta.Category = 5;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Fast systolic rise, rounded peak, dicrotic notch, rebound, slow decay";
end

function [x,f,meta] = TF061_EEGSpindle(N,background_amp1,background_freq1,background_phase1,background_amp2,background_freq2,background_phase2,env_ctr,env_w,spindle_a,spindle_basefreq,spindle_freqmod_ctr,spindle_freqmod_coeff)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(background_amp1), background_amp1 = 0.055; end
    if nargin<3 || isempty(background_freq1), background_freq1 = 4.2; end
    if nargin<4 || isempty(background_phase1), background_phase1 = 0.3; end
    if nargin<5 || isempty(background_amp2), background_amp2 = 0.028; end
    if nargin<6 || isempty(background_freq2), background_freq2 = 7.1; end
    if nargin<7 || isempty(background_phase2), background_phase2 = -0.5; end
    if nargin<8 || isempty(env_ctr), env_ctr = 0.56; end
    if nargin<9 || isempty(env_w), env_w = 0.115; end
    if nargin<10 || isempty(spindle_a), spindle_a = 0.39; end
    if nargin<11 || isempty(spindle_basefreq), spindle_basefreq = 20; end
    if nargin<12 || isempty(spindle_freqmod_ctr), spindle_freqmod_ctr = 0.56; end
    if nargin<13 || isempty(spindle_freqmod_coeff), spindle_freqmod_coeff = 2.2; end

    x = linspace(0,1,N).';
    backgroundEEG = background_amp1*sin(2*pi*background_freq1*x + background_phase1) + ...
                    background_amp2*sin(2*pi*background_freq2*x + background_phase2);
    envSpindle = exp(-0.5*((x - env_ctr)/env_w).^2);
    phaseSpindle = 2*pi*(spindle_basefreq*x + spindle_freqmod_coeff*(x - spindle_freqmod_ctr).^2);
    spindle = spindle_a * envSpindle .* sin(phaseSpindle);
    f = backgroundEEG + spindle;

    meta = struct;
    meta.ID = "TF061";
    meta.Name = "EEG Spindle";
    meta.Category = 5;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Low-frequency background with a localized, mildly frequency-modulated spindle burst";
end

function [x,f,meta] = TF062_MassSpectrum(N,baseline_slope,baseline_amp,pkC_MS,pkA_MS,pkW_MS)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(baseline_slope), baseline_slope = 0.018; end
    if nargin<3 || isempty(baseline_amp), baseline_amp = 0.022; end
    if nargin<4 || isempty(pkC_MS), pkC_MS = [0.11 0.24 0.365 0.492 0.510 0.675 0.82 0.905]; end
    if nargin<5 || isempty(pkA_MS), pkA_MS = [0.28 0.62 0.40 1.00 0.72 0.35 0.78 0.24]; end
    if nargin<6 || isempty(pkW_MS), pkW_MS = [0.0045 0.0065 0.0035 0.0050 0.0042 0.0075 0.0055 0.0030]; end

    x = linspace(0,1,N).';
    f = baseline_amp + baseline_slope*x + 0.035*exp(-0.5*((x-0.73)/0.18).^2);
    for k = 1:numel(pkC_MS)
        f = f + pkA_MS(k)*exp(-0.5*((x-pkC_MS(k))/pkW_MS(k)).^2);
    end
    meta = struct;
    meta.ID = "TF062";
    meta.Name = "Mass Spectrum";
    meta.Category = 5;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Sparse narrow peaks of unequal height, a close doublet, and weak broad baseline";
end

function [x,f,meta] = TF063_NMRMultiplet(N,baseline_amp,baseline_slope,pkC_NMR,pkA_NMR,pkG_NMR)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(baseline_amp), baseline_amp = 0.025; end
    if nargin<3 || isempty(baseline_slope), baseline_slope = 0.010; end
    if nargin<4 || isempty(pkC_NMR), pkC_NMR = [0.16 0.31 0.455 0.486 0.515 0.545 0.73 0.865]; end
    if nargin<5 || isempty(pkA_NMR), pkA_NMR = [0.34 0.58 0.52 0.82 1.00 0.67 0.44 0.25]; end
    if nargin<6 || isempty(pkG_NMR), pkG_NMR = [0.008 0.011 0.007 0.006 0.006 0.007 0.012 0.009]; end

    x = linspace(0,1,N).';
    f = baseline_amp + baseline_slope*x;
    for k = 1:numel(pkC_NMR)
        z = (x-pkC_NMR(k))/pkG_NMR(k);
        f = f + pkA_NMR(k)./(1+z.^2);
    end
    zBroad = (x-0.505)/0.055;
    f = f + 0.075./(1+zBroad.^2);
    meta = struct;
    meta.ID = "TF063";
    meta.Name = "NMR Multiplet";
    meta.Category = 5;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Lorentzian resonances with a partially resolved central multiplet";
end

function [x,f,meta] = TF064_XRDPeaks(N,background_amp,background_decay,hump_amp,hump_ctr,hump_w,pkC,pkA,pkW)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(background_amp), background_amp = 0.10; end
    if nargin<3 || isempty(background_decay), background_decay = 2.8; end
    if nargin<4 || isempty(hump_amp), hump_amp = 0.075; end
    if nargin<5 || isempty(hump_ctr), hump_ctr = 0.29; end
    if nargin<6 || isempty(hump_w), hump_w = 0.095; end
    if nargin<7 || isempty(pkC), pkC = [0.18 0.355 0.475 0.565 0.582 0.745 0.89]; end
    if nargin<8 || isempty(pkA), pkA = [0.34 0.62 0.43 0.92 0.70 0.52 0.27]; end
    if nargin<9 || isempty(pkW), pkW = [0.010 0.008 0.012 0.007 0.0075 0.010 0.006]; end

    x = linspace(0,1,N).';
    backgroundXRD = background_amp + 0.12*exp(-background_decay*x) + hump_amp*exp(-0.5*((x-hump_ctr)/hump_w).^2);
    f = backgroundXRD;
    for k = 1:numel(pkC)
        f = f + pkA(k)*exp(-0.5*((x-pkC(k))/pkW(k)).^2);
    end
    meta = struct;
    meta.ID = "TF064";
    meta.Name = "X-ray Diffraction Peaks";
    meta.Category = 6;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Decaying background, broad hump, sharp Bragg peaks with a close doublet";
end

function [x,f,meta] = TF065_AFMForceCurve(N,baseline_slope,adh_amp,adh_ctr,adh_w,contact_start,contact_end,contact_lin,contact_pow,contact_osc_amp,contact_osc_freq,post_amp,post_slope,post_snap_amp,post_snap_rate)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(baseline_slope), baseline_slope = 0.025; end
    if nargin<3 || isempty(adh_amp), adh_amp = -0.070; end
    if nargin<4 || isempty(adh_ctr), adh_ctr = 0.305; end
    if nargin<5 || isempty(adh_w), adh_w = 0.014; end
    if nargin<6 || isempty(contact_start), contact_start = 0.33; end
    if nargin<7 || isempty(contact_end), contact_end = 0.78; end
    if nargin<8 || isempty(contact_lin), contact_lin = 0.025; end
    if nargin<9 || isempty(contact_pow), contact_pow = 1.42; end
    if nargin<10 || isempty(contact_osc_amp), contact_osc_amp = 0.020; end
    if nargin<11 || isempty(contact_osc_freq), contact_osc_freq = 9; end
    if nargin<12 || isempty(post_amp), post_amp = 0.030; end
    if nargin<13 || isempty(post_slope), post_slope = 0.015; end
    if nargin<14 || isempty(post_snap_amp), post_snap_amp = -0.115; end
    if nargin<15 || isempty(post_snap_rate), post_snap_rate = 24; end

    x = linspace(0,1,N).';
    f = 0.018 + baseline_slope*x;
    adhesionApproach = adh_amp*exp(-0.5*((x-adh_ctr)/adh_w).^2);
    f = f + adhesionApproach;

    contact = (x>=contact_start) & (x<contact_end);
    uContact = max(x-contact_start,0);
    idx = contact;
    f(idx) = 0.025 + contact_lin*x(idx) + 3.35*uContact(idx).^contact_pow + contact_osc_amp*sin(2*pi*contact_osc_freq*x(idx));

    post = (x>=contact_end);
    f(post) = post_amp + post_slope*(x(post)-contact_end) + post_snap_amp*exp(-post_snap_rate*(x(post)-contact_end));

    meta = struct;
    meta.ID = "TF065";
    meta.Name = "AFM Force Curve";
    meta.Category = 6;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Approach, adhesion dip, contact nonlinear loading, and abrupt snap-off";
end

function [x,f,meta] = TF066_BatteryDischarge(N,plateau_a,plateau_b,plateau_c,phaseDrop_amp,phaseDrop_k,phaseDrop_ctr,phaseRecov_amp,phaseRecov_k,phaseRecov_ctr,shoulder_amp,shoulder_ctr,shoulder_w,terminal_amp,terminal_k,terminal_ctr,micro_amp,micro_freq,micro_decay)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(plateau_a), plateau_a = 1.05; end
    if nargin<3 || isempty(plateau_b), plateau_b = -0.075; end
    if nargin<4 || isempty(plateau_c), plateau_c = -0.020; end
    if nargin<5 || isempty(phaseDrop_amp), phaseDrop_amp = -0.060; end
    if nargin<6 || isempty(phaseDrop_k), phaseDrop_k = 55; end
    if nargin<7 || isempty(phaseDrop_ctr), phaseDrop_ctr = 0.36; end
    if nargin<8 || isempty(phaseRecov_amp), phaseRecov_amp = 0.036; end
    if nargin<9 || isempty(phaseRecov_k), phaseRecov_k = 48; end
    if nargin<10 || isempty(phaseRecov_ctr), phaseRecov_ctr = 0.50; end
    if nargin<11 || isempty(shoulder_amp), shoulder_amp = 0.018; end
    if nargin<12 || isempty(shoulder_ctr), shoulder_ctr = 0.62; end
    if nargin<13 || isempty(shoulder_w), shoulder_w = 0.050; end
    if nargin<14 || isempty(terminal_amp), terminal_amp = -0.55; end
    if nargin<15 || isempty(terminal_k), terminal_k = 48; end
    if nargin<16 || isempty(terminal_ctr), terminal_ctr = 0.885; end
    if nargin<17 || isempty(micro_amp), micro_amp = 0.006; end
    if nargin<18 || isempty(micro_freq), micro_freq = 6; end
    if nargin<19 || isempty(micro_decay), micro_decay = 1.2; end

    x = linspace(0,1,N).';
    plateau = plateau_a + plateau_b*x + plateau_c*x.^2;
    phaseDrop = phaseDrop_amp./(1+exp(-phaseDrop_k*(x-phaseDrop_ctr)));
    phaseRecover = phaseRecov_amp./(1+exp(-phaseRecov_k*(x-phaseRecov_ctr)));
    shoulderBattery = shoulder_amp*exp(-0.5*((x-shoulder_ctr)/shoulder_w).^2);
    terminalDrop = terminal_amp./(1+exp(-terminal_k*(x-terminal_ctr)));
    microRipple = micro_amp*sin(2*pi*micro_freq*x).*exp(-micro_decay*x);
    f = plateau + phaseDrop + phaseRecover + shoulderBattery + terminalDrop + microRipple;

    meta = struct;
    meta.ID = "TF066";
    meta.Name = "Battery Discharge";
    meta.Category = 6;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Long plateau, phase-transition shoulder, and steep terminal drop with micro-ripple";
end

function [x,f,meta] = TF067_FluorescencePhotobleach(N,bleach_a_fast,bleach_k_fast,bleach_a_slow,bleach_k_slow,bleach_offset,recovery_amp,recovery_ctr,recovery_w,smallStep_amp,smallStep_k,smallStep_ctr)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(bleach_a_fast), bleach_a_fast = 0.72; end
    if nargin<3 || isempty(bleach_k_fast), bleach_k_fast = 3.8; end
    if nargin<4 || isempty(bleach_a_slow), bleach_a_slow = 0.30; end
    if nargin<5 || isempty(bleach_k_slow), bleach_k_slow = 0.62; end
    if nargin<6 || isempty(bleach_offset), bleach_offset = 0.035; end
    if nargin<7 || isempty(recovery_amp), recovery_amp = 0.070; end
    if nargin<8 || isempty(recovery_ctr), recovery_ctr = 0.56; end
    if nargin<9 || isempty(recovery_w), recovery_w = 0.045; end
    if nargin<10 || isempty(smallStep_amp), smallStep_amp = 0.030; end
    if nargin<11 || isempty(smallStep_k), smallStep_k = 75; end
    if nargin<12 || isempty(smallStep_ctr), smallStep_ctr = 0.73; end

    x = linspace(0,1,N).';
    bleach = bleach_a_fast*exp(-bleach_k_fast*x) + bleach_a_slow*exp(-bleach_k_slow*x) + bleach_offset;
    recovery = recovery_amp*exp(-0.5*((x-recovery_ctr)/recovery_w).^2);
    smallStep = smallStep_amp./(1+exp(-smallStep_k*(x-smallStep_ctr)));
    f = bleach + recovery + smallStep;

    meta = struct;
    meta.ID = "TF067";
    meta.Name = "Fluorescence Photobleaching";
    meta.Category = 6;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Fast and slow bleaching with weak recovery/rebinding transient";
end



function [x,f,meta] = TF068_RadioAstronomyLine(N,continuum_a,continuum_b,continuum_c,continuum_osc,lineWeak_a,lineWeak_ctr,lineWeak_w,lineBroad_a,lineBroad_ctr,lineBroad_w,linePair1_a,linePair1_ctr,linePair1_w,linePair2_a,linePair2_ctr,linePair2_w,absorption_a,absorption_ctr,absorption_w)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(continuum_a), continuum_a = 0.30; end
    if nargin<3 || isempty(continuum_b), continuum_b = 0.10; end
    if nargin<4 || isempty(continuum_c), continuum_c = -0.055; end
    if nargin<5 || isempty(continuum_osc), continuum_osc = 0.012; end
    if nargin<6 || isempty(lineWeak_a), lineWeak_a = 0.095; end
    if nargin<7 || isempty(lineWeak_ctr), lineWeak_ctr = 0.235; end
    if nargin<8 || isempty(lineWeak_w), lineWeak_w = 0.007; end
    if nargin<9 || isempty(lineBroad_a), lineBroad_a = 0.24; end
    if nargin<10 || isempty(lineBroad_ctr), lineBroad_ctr = 0.565; end
    if nargin<11 || isempty(lineBroad_w), lineBroad_w = 0.045; end
    if nargin<12 || isempty(linePair1_a), linePair1_a = 0.13; end
    if nargin<13 || isempty(linePair1_ctr), linePair1_ctr = 0.745; end
    if nargin<14 || isempty(linePair1_w), linePair1_w = 0.010; end
    if nargin<15 || isempty(linePair2_a), linePair2_a = 0.10; end
    if nargin<16 || isempty(linePair2_ctr), linePair2_ctr = 0.770; end
    if nargin<17 || isempty(linePair2_w), linePair2_w = 0.009; end
    if nargin<18 || isempty(absorption_a), absorption_a = -0.075; end
    if nargin<19 || isempty(absorption_ctr), absorption_ctr = 0.885; end
    if nargin<20 || isempty(absorption_w), absorption_w = 0.012; end

    x = linspace(0,1,N).';
    continuum = continuum_a + continuum_b*x + continuum_c*x.^2 + continuum_osc*sin(2*pi*1.5*x);
    lineWeak = lineWeak_a*exp(-0.5*((x-lineWeak_ctr)/lineWeak_w).^2);
    lineBroad = lineBroad_a*exp(-0.5*((x-lineBroad_ctr)/lineBroad_w).^2);
    linePair1 = linePair1_a*exp(-0.5*((x-linePair1_ctr)/linePair1_w).^2);
    linePair2 = linePair2_a*exp(-0.5*((x-linePair2_ctr)/linePair2_w).^2);
    absorption = absorption_a*exp(-0.5*((x-absorption_ctr)/absorption_w).^2);
    f = continuum + lineWeak + lineBroad + linePair1 + linePair2 + absorption;
    meta = struct;
    meta.ID = "TF068";
    meta.Name = "Radio-Astronomy Spectral Line";
    meta.Category = 6;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Continuum with narrow and broad lines, close pair, and absorption notch";
end

function [x,f,meta] = TF069_OceanThermocline(N,mixed_slope,thermo_amp,thermo_ctr,thermo_k,deep_grad_amp,inversion_a,inversion_ctr,inversion_w,fs_amp,fs_freq,fs_ctr,fs_decay)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(mixed_slope), mixed_slope = -0.025; end
    if nargin<3 || isempty(thermo_amp), thermo_amp = -0.62; end
    if nargin<4 || isempty(thermo_ctr), thermo_ctr = 0.43; end
    if nargin<5 || isempty(thermo_k), thermo_k = 42; end
    if nargin<6 || isempty(deep_grad_amp), deep_grad_amp = -0.14; end
    if nargin<7 || isempty(inversion_a), inversion_a = 0.075; end
    if nargin<8 || isempty(inversion_ctr), inversion_ctr = 0.69; end
    if nargin<9 || isempty(inversion_w), inversion_w = 0.035; end
    if nargin<10 || isempty(fs_amp), fs_amp = 0.015; end
    if nargin<11 || isempty(fs_freq), fs_freq = 10; end
    if nargin<12 || isempty(fs_ctr), fs_ctr = 0.46; end
    if nargin<13 || isempty(fs_decay), fs_decay = 0.20; end

    x = linspace(0,1,N).';
    mixedLayer = 1.00 + mixed_slope*x;
    thermocline = thermo_amp./(1+exp(-thermo_k*(x-thermo_ctr)));
    deepGradient = deep_grad_amp*max(x-0.46,0);
    inversion = inversion_a*exp(-0.5*((x-inversion_ctr)/inversion_w).^2);
    fineStructure = fs_amp*sin(2*pi*fs_freq*x).*exp(-0.5*((x-fs_ctr)/fs_decay).^2);
    f = mixedLayer + thermocline + deepGradient + inversion + fineStructure;
    meta = struct;
    meta.ID = "TF069";
    meta.Name = "Ocean Thermocline";
    meta.Category = 6;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Surface mixed layer, sharp thermocline, deep gradient and weak inversion";
end

function [x,f,meta] = TF070_WellLog(N,base_a,base_b,base_osc,step1_a,step1_ctr,step1_w,step2_a,step2_ctr,step2_w,step3_a,step3_ctr,step3_w,step4_a,step4_ctr,step4_w,thin_a,thin_ctr1,thin_ctr2,thin_w,highfreq_a,highfreq_freq,highfreq_mask_lo,highfreq_mask_hi)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(base_a), base_a = 0.48; end
    if nargin<3 || isempty(base_b), base_b = 0.10; end
    if nargin<4 || isempty(base_osc), base_osc = 0.025; end
    if nargin<5 || isempty(step1_a), step1_a = 0.30; end
    if nargin<6 || isempty(step1_ctr), step1_ctr = 0.18; end
    if nargin<7 || isempty(step1_w), step1_w = 0.004; end
    if nargin<8 || isempty(step2_a), step2_a = -0.40; end
    if nargin<9 || isempty(step2_ctr), step2_ctr = 0.39; end
    if nargin<10 || isempty(step2_w), step2_w = 0.005; end
    if nargin<11 || isempty(step3_a), step3_a = 0.26; end
    if nargin<12 || isempty(step3_ctr), step3_ctr = 0.64; end
    if nargin<13 || isempty(step3_w), step3_w = 0.0045; end
    if nargin<14 || isempty(step4_a), step4_a = -0.20; end
    if nargin<15 || isempty(step4_ctr), step4_ctr = 0.82; end
    if nargin<16 || isempty(step4_w), step4_w = 0.004; end
    if nargin<17 || isempty(thin_a), thin_a = 0.24; end
    if nargin<18 || isempty(thin_ctr1), thin_ctr1 = 0.515; end
    if nargin<19 || isempty(thin_ctr2), thin_ctr2 = 0.548; end
    if nargin<20 || isempty(thin_w), thin_w = 0.0028; end
    if nargin<21 || isempty(highfreq_a), highfreq_a = 0.020; end
    if nargin<22 || isempty(highfreq_freq), highfreq_freq = 17; end
    if nargin<23 || isempty(highfreq_mask_lo), highfreq_mask_lo = 0.18; end
    if nargin<24 || isempty(highfreq_mask_hi), highfreq_mask_hi = 0.82; end

    x = linspace(0,1,N).';
    s = @(z,c,w) 1./(1+exp(-(z-c)/w));
    f = base_a + base_b*x + base_osc*sin(2*pi*3*x);
    f = f + step1_a*s(x,step1_ctr,step1_w) + step2_a*s(x,step2_ctr,step2_w) + step3_a*s(x,step3_ctr,step3_w) + step4_a*s(x,step4_ctr,step4_w);
    thinBed = thin_a*(s(x,thin_ctr1,thin_w) - s(x,thin_ctr2,thin_w));
    f = f + thinBed + highfreq_a*sin(2*pi*highfreq_freq*x).*(x>highfreq_mask_lo & x<highfreq_mask_hi);
    meta = struct;
    meta.ID = "TF070";
    meta.Name = "Geophysical Well Log";
    meta.Category = 6;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Stratigraphic shifts, within-layer variation, and a thin bed";
end

%% Category 6 : 71 - 100 

function [x,f,meta] = TF071_PowerGridFault(N,carrier_freq,amp_sag,spike_amp1,spike_ctr1,spike_w1,spike_amp2,spike_ctr2,spike_w2,ring_amp,ring_ctr,ring_decay,ring_freq)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(carrier_freq), carrier_freq = 28; end
    if nargin<3 || isempty(amp_sag), amp_sag = 0.42; end
    if nargin<4 || isempty(spike_amp1), spike_amp1 = -0.85; end
    if nargin<5 || isempty(spike_ctr1), spike_ctr1 = 0.355; end
    if nargin<6 || isempty(spike_w1), spike_w1 = 0.0028; end
    if nargin<7 || isempty(spike_amp2), spike_amp2 = 0.48; end
    if nargin<8 || isempty(spike_ctr2), spike_ctr2 = 0.365; end
    if nargin<9 || isempty(spike_w2), spike_w2 = 0.0045; end
    if nargin<10 || isempty(ring_amp), ring_amp = 0.23; end
    if nargin<11 || isempty(ring_ctr), ring_ctr = 0.58; end
    if nargin<12 || isempty(ring_decay), ring_decay = 18; end
    if nargin<13 || isempty(ring_freq), ring_freq = 52; end

    x = linspace(0,1,N).';
    carrierPG = sin(2*pi*carrier_freq*x);
    sigmoid = @(z,c,w) 1./(1+exp(-(z-c)/w));
    sagWindow = sigmoid(x,0.35,0.003) - sigmoid(x,0.58,0.004);
    ampPG = 1 - amp_sag*sagWindow;
    faultImpulse = spike_amp1*exp(-0.5*((x-spike_ctr1)/spike_w1).^2) + spike_amp2*exp(-0.5*((x-spike_ctr2)/spike_w2).^2);
    uPG = max(x-ring_ctr,0);
    ringPG = (x>=ring_ctr).*ring_amp.*exp(-ring_decay*uPG).*sin(2*pi*ring_freq*uPG);
    f = ampPG.*carrierPG + faultImpulse + ringPG;
    meta = struct;
    meta.ID = "TF071";
    meta.Name = "Power Grid Fault";
    meta.Category = 6;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Carrier with amplitude sag, impulse fault and ringing";
end

function [x,f,meta] = TF072_GearboxDefect(N,car1_freq,car2_freq,car2_phase,mod_amp,mod_freq,mod_phase,impact_centers,impact_amp_lo,impact_amp_hi,impact_decay,impact_ring_freq)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(car1_freq), car1_freq = 46; end
    if nargin<3 || isempty(car2_freq), car2_freq = 92; end
    if nargin<4 || isempty(car2_phase), car2_phase = 0.4; end
    if nargin<5 || isempty(mod_amp), mod_amp = 0.28; end
    if nargin<6 || isempty(mod_freq), mod_freq = 5; end
    if nargin<7 || isempty(mod_phase), mod_phase = -0.3; end
    if nargin<8 || isempty(impact_centers), impact_centers = 0.12:0.105:0.96; end
    if nargin<9 || isempty(impact_amp_lo), impact_amp_lo = 0.22; end
    if nargin<10 || isempty(impact_amp_hi), impact_amp_hi = 0.16; end
    if nargin<11 || isempty(impact_decay), impact_decay = 75; end
    if nargin<12 || isempty(impact_ring_freq), impact_ring_freq = 125; end

    x = linspace(0,1,N).';
    carrierGB = 0.32*sin(2*pi*car1_freq*x) + 0.12*sin(2*pi*car2_freq*x+car2_phase);
    modGB = 1 + mod_amp*sin(2*pi*mod_freq*x+mod_phase);
    f = modGB.*carrierGB;
    for k = 1:numel(impact_centers)
        c = impact_centers(k);
        amp = impact_amp_lo + impact_amp_hi*(c>0.50);
        u = max(x-c,0);
        f = f + amp*(x>=c).*exp(-impact_decay*u).*sin(2*pi*impact_ring_freq*u);
    end
    meta = struct;
    meta.ID = "TF072";
    meta.Name = "Gearbox Defect";
    meta.Category = 6;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Modulated carrier with repeated damped impacts";
end

function [x,f,meta] = TF073_LidarMultiEcho(N,base_a,base_b,cL,aL,wL,extra_a,extra_ctr,extra_w)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(base_a), base_a = 0.018; end
    if nargin<3 || isempty(base_b), base_b = 0.012; end
    if nargin<4 || isempty(cL), cL = [0.16 0.34 0.515 0.542 0.73 0.88]; end
    if nargin<5 || isempty(aL), aL = [0.30 0.62 1.00 0.72 0.44 0.21]; end
    if nargin<6 || isempty(wL), wL = [0.010 0.014 0.009 0.008 0.017 0.006]; end
    if nargin<7 || isempty(extra_a), extra_a = 0.045; end
    if nargin<8 || isempty(extra_ctr), extra_ctr = 0.64; end
    if nargin<9 || isempty(extra_w), extra_w = 0.09; end

    x = linspace(0,1,N).';
    f = base_a + base_b*x;
    for k = 1:numel(cL)
        f = f + aL(k)*exp(-0.5*((x-cL(k))/wL(k)).^2);
    end
    f = f + extra_a*exp(-0.5*((x-extra_ctr)/extra_w).^2);
    meta = struct;
    meta.ID = "TF073";
    meta.Name = "Lidar Multi-Echo";
    meta.Category = 6;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Multiple Gaussian echoes on a linear baseline";
end

function [x,f,meta] = TF074_RadarMicroDoppler(N,phase_a,phase_b,phase_c,env_lo,env_hi,env_ctr,env_w,side_amp,side_fm,side_modf)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(phase_a), phase_a = 12; end
    if nargin<3 || isempty(phase_b), phase_b = 24; end
    if nargin<4 || isempty(phase_c), phase_c = 0.50; end
    if nargin<5 || isempty(env_lo), env_lo = 0.32; end
    if nargin<6 || isempty(env_hi), env_hi = 0.68; end
    if nargin<7 || isempty(env_ctr), env_ctr = 0.58; end
    if nargin<8 || isempty(env_w), env_w = 0.30; end
    if nargin<9 || isempty(side_amp), side_amp = 0.16; end
    if nargin<10 || isempty(side_fm), side_fm = 62; end
    if nargin<11 || isempty(side_modf), side_modf = 3; end

    x = linspace(0,1,N).';
    phaseRM = 2*pi*(phase_a*x + phase_b*x.^2 + phase_c*sin(2*pi*3*x));
    envRM = env_lo + env_hi*exp(-0.5*((x-env_ctr)/env_w).^2);
    sideRM = side_amp*sin(2*pi*(side_fm*x + side_modf*sin(2*pi*2*x)));
    f = envRM.*sin(phaseRM) + sideRM;
    meta = struct;
    meta.ID = "TF074";
    meta.Name = "Radar Micro-Doppler";
    meta.Category = 6;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Time-varying phase with envelope and sideband modulation";
end

function [x,f,meta] = TF075_MeltPoolInstability(N,thermal_a,thermal_b,thermal_c,osc_a0,osc_a1,osc_f,osc_f2,spatter_a1,spatter_a2,spatter_c1,spatter_c2,spatter_w1,spatter_w2,trans_a,trans_c1,trans_w1,trans_c2,trans_w2)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(thermal_a), thermal_a = 0.35; end
    if nargin<3 || isempty(thermal_b), thermal_b = 0.28; end
    if nargin<4 || isempty(thermal_c), thermal_c = -0.10; end
    if nargin<5 || isempty(osc_a0), osc_a0 = 0.025; end
    if nargin<6 || isempty(osc_a1), osc_a1 = 0.035; end
    if nargin<7 || isempty(osc_f), osc_f = 8; end
    if nargin<8 || isempty(osc_f2), osc_f2 = 3; end
    if nargin<9 || isempty(spatter_a1), spatter_a1 = 0.52; end
    if nargin<10 || isempty(spatter_a2), spatter_a2 = -0.20; end
    if nargin<11 || isempty(spatter_c1), spatter_c1 = 0.61; end
    if nargin<12 || isempty(spatter_c2), spatter_c2 = 0.635; end
    if nargin<13 || isempty(spatter_w1), spatter_w1 = 0.010; end
    if nargin<14 || isempty(spatter_w2), spatter_w2 = 0.016; end
    if nargin<15 || isempty(trans_a), trans_a = 0.12; end
    if nargin<16 || isempty(trans_c1), trans_c1 = 0.72; end
    if nargin<17 || isempty(trans_w1), trans_w1 = 0.012; end
    if nargin<18 || isempty(trans_c2), trans_c2 = 0.86; end
    if nargin<19 || isempty(trans_w2), trans_w2 = 0.018; end

    x = linspace(0,1,N).';
    thermalMP = thermal_a + thermal_b*x + thermal_c*x.^2;
    oscMP = (osc_a0 + osc_a1*x).*sin(2*pi*(osc_f*x + osc_f2*x.^2));
    spatterMP = spatter_a1*exp(-0.5*((x-spatter_c1)/spatter_w1).^2) + spatter_a2*exp(-0.5*((x-spatter_c2)/spatter_w2).^2);
    sigmoid = @(z,c,w) 1./(1+exp(-(z-c)/w));
    transitionMP = trans_a*(sigmoid(x,trans_c1,trans_w1) - sigmoid(x,trans_c2,trans_w2));
    f = thermalMP + oscMP + spatterMP + transitionMP;
    meta = struct;
    meta.ID = "TF075";
    meta.Name = "Melt Pool Instability";
    meta.Category = 6;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Thermal trend, oscillation, spatter peaks and transition";
end

function [x,f,meta] = TF076_FiberOTDR(N,decay_a,decay_rate,refC,refA,refW,loss_amp,loss_ctr,loss_w,osc_amp,osc_f)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(decay_a), decay_a = 1.02; end
    if nargin<3 || isempty(decay_rate), decay_rate = 1.25; end
    if nargin<4 || isempty(refC), refC = [0.17 0.43 0.69 0.865]; end
    if nargin<5 || isempty(refA), refA = [0.08 0.14 0.24 0.11]; end
    if nargin<6 || isempty(refW), refW = [0.0035 0.0045 0.0030 0.0040]; end
    if nargin<7 || isempty(loss_amp), loss_amp = -0.18; end
    if nargin<8 || isempty(loss_ctr), loss_ctr = 0.705; end
    if nargin<9 || isempty(loss_w), loss_w = 0.0025; end
    if nargin<10 || isempty(osc_amp), osc_amp = 0.010; end
    if nargin<11 || isempty(osc_f), osc_f = 4; end

    x = linspace(0,1,N).';
    f = decay_a*exp(-decay_rate*x);
    for k = 1:numel(refC)
        f = f + refA(k)*exp(-0.5*((x-refC(k))/refW(k)).^2);
    end
    sigmoid = @(z,c,w) 1./(1+exp(-(z-c)/w));
    lossStep = loss_amp*sigmoid(x,loss_ctr,loss_w);
    f = f + lossStep + osc_amp*sin(2*pi*osc_f*x);
    meta = struct;
    meta.ID = "TF076";
    meta.Name = "Fiber OTDR";
    meta.Category = 6;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Exponential decay with localized reflections and loss step";
end

function [x,f,meta] = TF077_NetworkTrafficBursts(N,base_a,base_b,base_c,broad_params,cNT,aNT,wNT)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(base_a), base_a = 0.25; end
    if nargin<3 || isempty(base_b), base_b = 0.08; end
    if nargin<4 || isempty(base_c), base_c = 0.045; end
    if nargin<5 || isempty(broad_params)
        broad_params = struct('a1',0.28,'c1',0.20,'w1',0.012,'c2',0.40,'w2',0.018,...
                              'a2',0.34,'c3',0.57,'w3',0.015,'c4',0.83,'w4',0.020);
    end
    if nargin<6 || isempty(cNT), cNT = [0.235 0.275 0.338 0.615 0.658 0.705 0.774]; end
    if nargin<7 || isempty(aNT), aNT = [0.18 0.11 0.21 0.16 0.25 0.14 0.22]; end
    if nargin<8 || isempty(wNT), wNT = [0.009 0.006 0.010 0.008 0.011 0.006 0.009]; end

    x = linspace(0,1,N).';
    baseNT = base_a + base_b*sin(2*pi*2*x) + base_c*x;
    sigmoid = @(z,c,w) 1./(1+exp(-(z-c)/w));
    broadNT = broad_params.a1*(sigmoid(x,broad_params.c1,broad_params.w1) - sigmoid(x,broad_params.c2,broad_params.w2)) ...
            + broad_params.a2*(sigmoid(x,broad_params.c3,broad_params.w3) - sigmoid(x,broad_params.c4,broad_params.w4));
    f = baseNT + broadNT;
    for k = 1:numel(cNT)
        f = f + aNT(k)*exp(-0.5*((x-cNT(k))/wNT(k)).^2);
    end
    meta = struct;
    meta.ID = "TF077";
    meta.Name = "Network Traffic Bursts";
    meta.Category = 6;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Baseline trend with broad bursts and narrow spikes";
end

function [x,f,meta] = TF078_LatencyIncident(N,base_a,base_amp,base_freq,ramp_amp,ramp_c1,ramp_w1,ramp_c2,ramp_w2,cLI,aLI,wLI,ring_amp,ring_ctr,ring_decay)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(base_a), base_a = 0.16; end
    if nargin<3 || isempty(base_amp), base_amp = 0.025; end
    if nargin<4 || isempty(base_freq), base_freq = 3; end
    if nargin<5 || isempty(ramp_amp), ramp_amp = 0.33; end
    if nargin<6 || isempty(ramp_c1), ramp_c1 = 0.36; end
    if nargin<7 || isempty(ramp_w1), ramp_w1 = 0.050; end
    if nargin<8 || isempty(ramp_c2), ramp_c2 = 0.63; end
    if nargin<9 || isempty(ramp_w2), ramp_w2 = 0.020; end
    if nargin<10 || isempty(cLI), cLI = [0.50 0.535 0.56 0.585 0.615]; end
    if nargin<11 || isempty(aLI), aLI = [0.22 0.42 0.30 0.55 0.26]; end
    if nargin<12 || isempty(wLI), wLI = [0.008 0.006 0.007 0.005 0.008]; end
    if nargin<13 || isempty(ring_amp), ring_amp = 0.22; end
    if nargin<14 || isempty(ring_ctr), ring_ctr = 0.63; end
    if nargin<15 || isempty(ring_decay), ring_decay = 10; end

    x = linspace(0,1,N).';
    baseLI = base_a + base_amp*sin(2*pi*base_freq*x);
    sigmoid = @(z,c,w) 1./(1+exp(-(z-c)/w));
    rampLI = ramp_amp*(sigmoid(x,ramp_c1,ramp_w1) - sigmoid(x,ramp_c2,ramp_w2));
    f = baseLI + rampLI;
    for k = 1:numel(cLI)
        f = f + aLI(k)*exp(-0.5*((x-cLI(k))/wLI(k)).^2);
    end
    uLI = max(x-ring_ctr,0);
    f = f + (x>=ring_ctr).*ring_amp.*exp(-ring_decay*uLI);
    meta = struct;
    meta.ID = "TF078";
    meta.Name = "Latency Incident";
    meta.Category = 6;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Ramp with multiple narrow latency spikes and post-incident ringing";
end

function [x,f,meta] = TF079_CacheThrash(N,base_a,base_amp,base_freq,win_c1,win_w1,win_c2,win_w2,switch_amp,switch_rate,edge_freq,edge_amp)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(base_a), base_a = 0.28; end
    if nargin<3 || isempty(base_amp), base_amp = 0.035; end
    if nargin<4 || isempty(base_freq), base_freq = 4; end
    if nargin<5 || isempty(win_c1), win_c1 = 0.34; end
    if nargin<6 || isempty(win_w1), win_w1 = 0.005; end
    if nargin<7 || isempty(win_c2), win_c2 = 0.73; end
    if nargin<8 || isempty(win_w2), win_w2 = 0.005; end
    if nargin<9 || isempty(switch_amp), switch_amp = 0.24; end
    if nargin<10 || isempty(switch_rate), switch_rate = 22; end
    if nargin<11 || isempty(edge_freq), edge_freq = 7; end
    if nargin<12 || isempty(edge_amp), edge_amp = 0.08; end

    x = linspace(0,1,N).';
    baseCT = base_a + base_amp*sin(2*pi*base_freq*x);
    sigmoid = @(z,c,w) 1./(1+exp(-(z-c)/w));
    windowCT = sigmoid(x,win_c1,win_w1) - sigmoid(x,win_c2,win_w2);
    switchCT = switch_amp*tanh(5*sin(2*pi*switch_rate*x));
    edgeCT = edge_amp*sin(2*pi*edge_freq*x).*windowCT;
    f = baseCT + windowCT.*switchCT + edgeCT;
    meta = struct;
    meta.ID = "TF079";
    meta.Name = "Cache Thrash";
    meta.Category = 6;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Windowed switching oscillation with edge modulation";
end

function [x,f,meta] = TF080_TrainingLossSchedule(N,decay1,decay2,offsetA,dip1_c,dip1_w,dip2_c,dip2_w,dip3_c,dip3_w,cTL,aTL,wTL)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(decay1), decay1 = 5.8; end
    if nargin<3 || isempty(decay2), decay2 = 0.65; end
    if nargin<4 || isempty(offsetA), offsetA = 0.065; end
    if nargin<5 || isempty(dip1_c), dip1_c = 0.34; end
    if nargin<6 || isempty(dip1_w), dip1_w = 0.006; end
    if nargin<7 || isempty(dip2_c), dip2_c = 0.63; end
    if nargin<8 || isempty(dip2_w), dip2_w = 0.006; end
    if nargin<9 || isempty(dip3_c), dip3_c = 0.82; end
    if nargin<10 || isempty(dip3_w), dip3_w = 0.006; end
    if nargin<11 || isempty(cTL), cTL = [0.27 0.47 0.705]; end
    if nargin<12 || isempty(aTL), aTL = [0.12 0.075 0.050]; end
    if nargin<13 || isempty(wTL), wTL = [0.010 0.008 0.006]; end

    x = linspace(0,1,N).';
    sigmoid = @(z,c,w) 1./(1+exp(-(z-c)/w));
    f = 1.35*exp(-decay1*x) + 0.24*exp(-decay2*x) + offsetA;
    f = f - 0.065*sigmoid(x,dip1_c,dip1_w) - 0.045*sigmoid(x,dip2_c,dip2_w) - 0.028*sigmoid(x,dip3_c,dip3_w);
    for k = 1:numel(cTL)
        f = f + aTL(k)*exp(-0.5*((x-cTL(k))/wTL(k)).^2);
    end
    meta = struct;
    meta.ID = "TF080";
    meta.Name = "Training Loss Schedule";
    meta.Category = 6;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Exponential decay with localized dips and small bumps";
end

function [x,f,meta] = TF081_ExoplanetTransitSpot(N,base_amp,base_freq,transit_c,transit_w,bottom_depth,limb_amp,limb_pos1,limb_pos2,spot_amp,spot_pos,spot_w)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(base_amp), base_amp = 0.012; end
    if nargin<3 || isempty(base_freq), base_freq = 1.2; end
    if nargin<4 || isempty(transit_c), transit_c = 0.51; end
    if nargin<5 || isempty(transit_w), transit_w = 0.17; end
    if nargin<6 || isempty(bottom_depth), bottom_depth = 0.20; end
    if nargin<7 || isempty(limb_amp), limb_amp = 0.035; end
    if nargin<8 || isempty(limb_pos1), limb_pos1 = 0.37; end
    if nargin<9 || isempty(limb_pos2), limb_pos2 = 0.65; end
    if nargin<10 || isempty(spot_amp), spot_amp = 0.050; end
    if nargin<11 || isempty(spot_pos), spot_pos = 0.535; end
    if nargin<12 || isempty(spot_w), spot_w = 0.016; end

    x = linspace(0,1,N).';
    sigmoid = @(z,c,w) 1./(1+exp(-(z-c)/w));
    baselineET = 1.00 + base_amp*sin(2*pi*base_freq*x);
    transitWin = sigmoid(x,transit_c,transit_w) - sigmoid(x,transit_c+transit_w*2,transit_w); % approximate end
    bottomET = -bottom_depth*transitWin;
    limbET = -limb_amp*exp(-0.5*((x-limb_pos1)/0.022).^2) - limb_amp*exp(-0.5*((x-limb_pos2)/0.022).^2);
    spotET = spot_amp*exp(-0.5*((x-spot_pos)/spot_w).^2);
    f = baselineET + bottomET + limbET + spotET;
    meta = struct;
    meta.ID = "TF081";
    meta.Name = "Exoplanet Transit with Spot Crossing";
    meta.Category = 6;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Transit baseline with limb effects and spot crossing";
end

function [x,f,meta] = TF082_PulsarProfile(N,base_level,p1_a,p1_c,p1_w,p2_a,p2_c,p2_w,p3_a,p3_c,p3_w,p4_a,p4_c,p4_w,tail_a,tail_rate,tail_c)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(base_level), base_level = 0.015; end
    if nargin<3 || isempty(p1_a), p1_a = 0.14; end
    if nargin<4 || isempty(p1_c), p1_c = 0.18; end
    if nargin<5 || isempty(p1_w), p1_w = 0.010; end
    if nargin<6 || isempty(p2_a), p2_a = 1.00; end
    if nargin<7 || isempty(p2_c), p2_c = 0.31; end
    if nargin<8 || isempty(p2_w), p2_w = 0.014; end
    if nargin<9 || isempty(p3_a), p3_a = 0.34; end
    if nargin<10 || isempty(p3_c), p3_c = 0.345; end
    if nargin<11 || isempty(p3_w), p3_w = 0.027; end
    if nargin<12 || isempty(p4_a), p4_a = 0.42; end
    if nargin<13 || isempty(p4_c), p4_c = 0.72; end
    if nargin<14 || isempty(p4_w), p4_w = 0.020; end
    if nargin<15 || isempty(tail_a), tail_a = 0.16; end
    if nargin<16 || isempty(tail_rate), tail_rate = 20; end
    if nargin<17 || isempty(tail_c), tail_c = 0.31; end

    x = linspace(0,1,N).';
    f = base_level + p1_a*exp(-0.5*((x-p1_c)/p1_w).^2) + p2_a*exp(-0.5*((x-p2_c)/p2_w).^2) + ...
        p3_a*exp(-0.5*((x-p3_c)/p3_w).^2) + p4_a*exp(-0.5*((x-p4_c)/p4_w).^2);
    u = max(x-tail_c,0);
    f = f + tail_a*(x>=tail_c).*exp(-tail_rate*u);
    meta = struct;
    meta.ID = "TF082";
    meta.Name = "Pulsar Profile";
    meta.Category = 6;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Multiple Gaussian peaks with exponential tail";
end

function [x,f,meta] = TF083_GravitationalWaveChirp(N,win_c1,win_w1,win_c2,win_w2,phase_coeffs,amp_base,amp_exp,ring_amp,ring_start,ring_rate,ring_freq,ring_phase)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(win_c1), win_c1 = 0.10; end
    if nargin<3 || isempty(win_w1), win_w1 = 0.018; end
    if nargin<4 || isempty(win_c2), win_c2 = 0.79; end
    if nargin<5 || isempty(win_w2), win_w2 = 0.010; end
    if nargin<6 || isempty(phase_coeffs), phase_coeffs = [5 4 18 38]; end
    if nargin<7 || isempty(amp_base), amp_base = 0.06; end
    if nargin<8 || isempty(amp_exp), amp_exp = 2.8; end
    if nargin<9 || isempty(ring_amp), ring_amp = 0.70; end
    if nargin<10 || isempty(ring_start), ring_start = 0.79; end
    if nargin<11 || isempty(ring_rate), ring_rate = 15; end
    if nargin<12 || isempty(ring_freq), ring_freq = 52; end
    if nargin<13 || isempty(ring_phase), ring_phase = 0.3; end

    x = linspace(0,1,N).';
    sigmoid = @(z,c,w) 1./(1+exp(-(z-c)/w));
    chirpWindow = sigmoid(x,win_c1,win_w1) - sigmoid(x,win_c2,win_w2);
    phaseGW = 2*pi*(phase_coeffs(1)*x + phase_coeffs(2)*x.^2 + phase_coeffs(3)*x.^4 + phase_coeffs(4)*x.^7);
    ampGW = amp_base + 0.62*x.^amp_exp;
    chirpGW = chirpWindow.*ampGW.*sin(phaseGW);
    u = max(x-ring_start,0);
    ringGW = (x>=ring_start).*ring_amp.*exp(-ring_rate*u).*sin(2*pi*ring_freq*u+ring_phase);
    f = chirpGW + ringGW;
    meta = struct;
    meta.ID = "TF083";
    meta.Name = "Gravitational-Wave Chirp";
    meta.Category = 6;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Chirp with ringdown";
end

function [x,f,meta] = TF084_MicrolensingPlanet(N,center_u,width_u,base_ml,planet1_a,planet1_c,planet1_w,planet2_a,planet2_c,planet2_w)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(center_u), center_u = 0.52; end
    if nargin<3 || isempty(width_u), width_u = 0.115; end
    if nargin<4 || isempty(base_ml), base_ml = 0.10; end
    if nargin<5 || isempty(planet1_a), planet1_a = 0.095; end
    if nargin<6 || isempty(planet1_c), planet1_c = 0.585; end
    if nargin<7 || isempty(planet1_w), planet1_w = 0.010; end
    if nargin<8 || isempty(planet2_a), planet2_a = -0.035; end
    if nargin<9 || isempty(planet2_c), planet2_c = 0.605; end
    if nargin<10 || isempty(planet2_w), planet2_w = 0.016; end

    x = linspace(0,1,N).';
    u = (x-center_u)/width_u;
    smoothML = base_ml + 0.82./sqrt(1 + u.^2);
    planetML = planet1_a*exp(-0.5*((x-planet1_c)/planet1_w).^2) + planet2_a*exp(-0.5*((x-planet2_c)/planet2_w).^2);
    f = smoothML + planetML;
    meta = struct;
    meta.ID = "TF084";
    meta.Name = "Microlensing with Planetary Anomaly";
    meta.Category = 6;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Smooth lensing curve with localized planetary deviation";
end

function [x,f,meta] = TF085_SolarFlare(N,precAmp1,precC1,precW1,precAmp2,precC2,precW2,precAmp3,precC3,precW3,riseAmp,riseC,riseW,decayAmp1,decayRate1,decayAmp2,decayRate2,baseLevel,postAmp,postC,postW)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(precAmp1), precAmp1 = 0.08; end
    if nargin<3 || isempty(precC1), precC1 = 0.30; end
    if nargin<4 || isempty(precW1), precW1 = 0.010; end
    if nargin<5 || isempty(precAmp2), precAmp2 = 0.12; end
    if nargin<6 || isempty(precC2), precC2 = 0.345; end
    if nargin<7 || isempty(precW2), precW2 = 0.007; end
    if nargin<8 || isempty(precAmp3), precAmp3 = 0.07; end
    if nargin<9 || isempty(precC3), precC3 = 0.385; end
    if nargin<10 || isempty(precW3), precW3 = 0.006; end
    if nargin<11 || isempty(riseAmp), riseAmp = 0.90; end
    if nargin<12 || isempty(riseC), riseC = 0.46; end
    if nargin<13 || isempty(riseW), riseW = 0.008; end
    if nargin<14 || isempty(decayAmp1), decayAmp1 = 0.58; end
    if nargin<15 || isempty(decayRate1), decayRate1 = 5.2; end
    if nargin<16 || isempty(decayAmp2), decayAmp2 = 0.32; end
    if nargin<17 || isempty(decayRate2), decayRate2 = 18; end
    if nargin<18 || isempty(baseLevel), baseLevel = 0.08; end
    if nargin<19 || isempty(postAmp), postAmp = 0.055; end
    if nargin<20 || isempty(postC), postC = 0.64; end
    if nargin<21 || isempty(postW), postW = 0.018; end

    x = linspace(0,1,N).';
    precSF = precAmp1*exp(-0.5*((x-precC1)/precW1).^2) + precAmp2*exp(-0.5*((x-precC2)/precW2).^2) + precAmp3*exp(-0.5*((x-precC3)/precW3).^2);
    riseSF = riseAmp * (1./(1+exp(-(x-riseC)/riseW)));
    u = max(x-0.49,0);
    decaySF = (x>=0.49).*(decayAmp1*exp(-decayRate1*u) + decayAmp2*exp(-decayRate2*u));
    f = baseLevel + precSF + riseSF;
    idx = x>=0.49;
    f(idx) = baseLevel + decaySF(idx);
    f = f + postAmp*exp(-0.5*((x-postC)/postW).^2);
    meta = struct;
    meta.ID = "TF085";
    meta.Name = "Solar Flare";
    meta.Category = 6;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Precursor peaks, rapid rise and multi-timescale decay";
end


function [x,f,meta] = TF086_QuasarFlare(N,wanderAmp1,wanderAmp2,wanderSlope,flareAmp,leftC,leftW,rightDecay,smallAmp1,smallC1,smallW1,smallAmp2,smallC2,smallW2)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(wanderAmp1), wanderAmp1 = 0.055; end
    if nargin<3 || isempty(wanderAmp2), wanderAmp2 = 0.035; end
    if nargin<4 || isempty(wanderSlope), wanderSlope = 0.020; end
    if nargin<5 || isempty(flareAmp), flareAmp = 0.52; end
    if nargin<6 || isempty(leftC), leftC = 0.56; end
    if nargin<7 || isempty(leftW), leftW = 0.060; end
    if nargin<8 || isempty(rightDecay), rightDecay = 0.18; end
    if nargin<9 || isempty(smallAmp1), smallAmp1 = 0.075; end
    if nargin<10 || isempty(smallC1), smallC1 = 0.20; end
    if nargin<11 || isempty(smallW1), smallW1 = 0.018; end
    if nargin<12 || isempty(smallAmp2), smallAmp2 = 0.055; end
    if nargin<13 || isempty(smallC2), smallC2 = 0.84; end
    if nargin<14 || isempty(smallW2), smallW2 = 0.014; end

    x = linspace(0,1,N).';
    wanderQ = 0.34 + wanderAmp1*sin(2*pi*1.4*x+0.2) + wanderAmp2*sin(2*pi*3.3*x-0.6) + wanderSlope*x;
    leftQ = flareAmp*exp(-0.5*((x-leftC)/leftW).^2);
    rightQ = flareAmp*exp(-(x-leftC)/rightDecay).*(x>=leftC);
    flareQ = leftQ.*(x<leftC) + rightQ;
    smallQ = smallAmp1*exp(-0.5*((x-smallC1)/smallW1).^2) + smallAmp2*exp(-0.5*((x-smallC2)/smallW2).^2);
    f = wanderQ + flareQ + smallQ;

    meta = struct;
    meta.ID = "TF086";
    meta.Name = "Quasar Flare";
    meta.Category = 6;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Wandering baseline with asymmetric flare and small spikes";
end

function [x,f,meta] = TF087_PromotionDemand(N,seasonBase,seasonSlope,seasonAmp1,seasonAmp2,promoAmp,promoC1,promoW1,promoC2,promoW2,stockAmp,stockC1,stockW1,stockC2,stockW2,carryAmp,carryC,carryRate)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(seasonBase), seasonBase = 0.34; end
    if nargin<3 || isempty(seasonSlope), seasonSlope = 0.055; end
    if nargin<4 || isempty(seasonAmp1), seasonAmp1 = 0.065; end
    if nargin<5 || isempty(seasonAmp2), seasonAmp2 = 0.025; end
    if nargin<6 || isempty(promoAmp), promoAmp = 0.36; end
    if nargin<7 || isempty(promoC1), promoC1 = 0.34; end
    if nargin<8 || isempty(promoW1), promoW1 = 0.010; end
    if nargin<9 || isempty(promoC2), promoC2 = 0.58; end
    if nargin<10 || isempty(promoW2), promoW2 = 0.016; end
    if nargin<11 || isempty(stockAmp), stockAmp = -0.25; end
    if nargin<12 || isempty(stockC1), stockC1 = 0.48; end
    if nargin<13 || isempty(stockW1), stockW1 = 0.006; end
    if nargin<14 || isempty(stockC2), stockC2 = 0.535; end
    if nargin<15 || isempty(stockW2), stockW2 = 0.006; end
    if nargin<16 || isempty(carryAmp), carryAmp = 0.15; end
    if nargin<17 || isempty(carryC), carryC = 0.58; end
    if nargin<18 || isempty(carryRate), carryRate = 8; end

    x = linspace(0,1,N).';
    seasonPD = seasonBase + seasonSlope*x + seasonAmp1*sin(2*pi*5*x-0.4) + seasonAmp2*sin(2*pi*10*x);
    sigmoid = @(z,c,w) 1./(1+exp(-(z-c)/w));
    promoPD = promoAmp*(sigmoid(x,promoC1,promoW1) - sigmoid(x,promoC2,promoW2));
    stockoutPD = stockAmp*(sigmoid(x,stockC1,stockW1) - sigmoid(x,stockC2,stockW2));
    uPD = max(x-carryC,0);
    carryPD = (x>=carryC).*carryAmp.*exp(-carryRate*uPD);
    f = seasonPD + promoPD + stockoutPD + carryPD;

    meta = struct;
    meta.ID = "TF087";
    meta.Name = "Promotion Demand";
    meta.Category = 6;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Seasonal baseline with promotion bump, stockout dip and carry";
end

function [x,f,meta] = TF088_ProductLaunch(N,adoptAmp,adoptC,adoptW,viralAmp,viralC,viralW,satAmp,satC,satW,decayAmp,decayC,decayRate,baseLevel)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(adoptAmp), adoptAmp = 0.68; end
    if nargin<3 || isempty(adoptC), adoptC = 0.37; end
    if nargin<4 || isempty(adoptW), adoptW = 0.055; end
    if nargin<5 || isempty(viralAmp), viralAmp = 0.28; end
    if nargin<6 || isempty(viralC), viralC = 0.52; end
    if nargin<7 || isempty(viralW), viralW = 0.028; end
    if nargin<8 || isempty(satAmp), satAmp = -0.12; end
    if nargin<9 || isempty(satC), satC = 0.74; end
    if nargin<10 || isempty(satW), satW = 0.045; end
    if nargin<11 || isempty(decayAmp), decayAmp = -0.10; end
    if nargin<12 || isempty(decayC), decayC = 0.83; end
    if nargin<13 || isempty(decayRate), decayRate = 1; end
    if nargin<14 || isempty(baseLevel), baseLevel = 0.08; end

    x = linspace(0,1,N).';
    sigmoid = @(z,c,w) 1./(1+exp(-(z-c)/w));
    adoptPL = adoptAmp*sigmoid(x,adoptC,adoptW);
    viralPL = viralAmp*exp(-0.5*((x-viralC)/viralW).^2);
    saturationPL = satAmp*sigmoid(x,satC,satW);
    decayPL = decayAmp*max(x-decayC,0).^decayRate;
    f = baseLevel + adoptPL + viralPL + saturationPL + decayPL;

    meta = struct;
    meta.ID = "TF088";
    meta.Name = "Product Launch";
    meta.Category = 6;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Adoption S-curve, viral spike, saturation and late decay";
end

function [x,f,meta] = TF089_AdstockCampaign(N,baseLevel,baseSlope,cAD,aAD,rAD,seasonAmp)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(baseLevel), baseLevel = 0.12; end
    if nargin<3 || isempty(baseSlope), baseSlope = 0.025; end
    if nargin<4 || isempty(cAD), cAD = [0.12 0.29 0.47 0.66 0.81]; end
    if nargin<5 || isempty(aAD), aAD = [0.32 0.26 0.42 0.30 0.22]; end
    if nargin<6 || isempty(rAD), rAD = [7.0 9.0 6.0 8.5 10.0]; end
    if nargin<7 || isempty(seasonAmp), seasonAmp = 0.025; end

    x = linspace(0,1,N).';
    f = baseLevel + baseSlope*x;
    for k = 1:numel(cAD)
        u = max(x-cAD(k),0);
        f = f + aAD(k)*(x>=cAD(k)).*exp(-rAD(k)*u);
    end
    f = f + seasonAmp*sin(2*pi*4*x);

    meta = struct;
    meta.ID = "TF089";
    meta.Name = "Adstock Campaign";
    meta.Category = 6;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Baseline trend with multiple adstock decays and small seasonality";
end

function [x,f,meta] = TF090_MarketFlashCrash(N,preBase,preSlope,preSeason,crashAmp,crashC,crashW,reboundAmp,reboundC,reboundW,afterAmp,afterC,afterW,normAmp,normC,normRate)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(preBase), preBase = 1.00; end
    if nargin<3 || isempty(preSlope), preSlope = 0.10; end
    if nargin<4 || isempty(preSeason), preSeason = 0.025; end
    if nargin<5 || isempty(crashAmp), crashAmp = -0.62; end
    if nargin<6 || isempty(crashC), crashC = 0.535; end
    if nargin<7 || isempty(crashW), crashW = 0.004; end
    if nargin<8 || isempty(reboundAmp), reboundAmp = 0.44; end
    if nargin<9 || isempty(reboundC), reboundC = 0.585; end
    if nargin<10 || isempty(reboundW), reboundW = 0.009; end
    if nargin<11 || isempty(afterAmp), afterAmp = -0.13; end
    if nargin<12 || isempty(afterC), afterC = 0.665; end
    if nargin<13 || isempty(afterW), afterW = 0.015; end
    if nargin<14 || isempty(normAmp), normAmp = 0.16; end
    if nargin<15 || isempty(normC), normC = 0.585; end
    if nargin<16 || isempty(normRate), normRate = 4.5; end

    x = linspace(0,1,N).';
    sigmoid = @(z,c,w) 1./(1+exp(-(z-c)/w));
    preMF = preBase + preSlope*x + preSeason*sin(2*pi*3*x);
    crashMF = crashAmp*sigmoid(x,crashC,crashW);
    reboundMF = reboundAmp*sigmoid(x,reboundC,reboundW);
    afterMF = afterAmp*exp(-0.5*((x-afterC)/afterW).^2);
    uMF = max(x-normC,0);
    normMF = (x>=normC).*normAmp.*(1-exp(-normRate*uMF));
    f = preMF + crashMF + reboundMF + afterMF + normMF;

    meta = struct;
    meta.ID = "TF090";
    meta.Name = "Market Flash Crash";
    meta.Category = 6;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Pre-crash trend, sharp crash, rebound and normalization";
end

function [x,f,meta] = TF091_InventoryStockout(N,baseSlope,baseIntercept,baseAmp,stockC1,stockW1,stockLevelBase,stockLevelAmp,adjAmp1,adjC1,adjW1,adjAmp2,adjC2,adjW2)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(baseSlope), baseSlope = 0.34; end
    if nargin<3 || isempty(baseIntercept), baseIntercept = 0.26; end
    if nargin<4 || isempty(baseAmp), baseAmp = 0.035; end
    if nargin<5 || isempty(stockC1), stockC1 = 0.42; end
    if nargin<6 || isempty(stockW1), stockW1 = 0.006; end
    if nargin<7 || isempty(stockLevelBase), stockLevelBase = 0.18; end
    if nargin<8 || isempty(stockLevelAmp), stockLevelAmp = 0.010; end
    if nargin<9 || isempty(adjAmp1), adjAmp1 = 0.20; end
    if nargin<10 || isempty(adjC1), adjC1 = 0.61; end
    if nargin<11 || isempty(adjW1), adjW1 = 0.005; end
    if nargin<12 || isempty(adjAmp2), adjAmp2 = -0.13; end
    if nargin<13 || isempty(adjC2), adjC2 = 0.72; end
    if nargin<14 || isempty(adjW2), adjW2 = 0.040; end

    x = linspace(0,1,N).';
    sigmoid = @(z,c,w) 1./(1+exp(-(z-c)/w));
    baseIS = baseIntercept + baseSlope*x + baseAmp*sin(2*pi*4*x);
    stockWin = sigmoid(x,stockC1,stockW1) - sigmoid(x,stockC1+0.19,stockW1); % maintain original end at ~0.61
    stockLevel = stockLevelBase + stockLevelAmp*sin(2*pi*13*x);
    f = baseIS.*(1-stockWin) + stockLevel.*stockWin;
    f = f + adjAmp1*sigmoid(x,adjC1,adjW1) + adjAmp2*sigmoid(x,adjC2,adjW2);
    meta = struct;
    meta.ID = "TF091";
    meta.Name = "Inventory Stockout";
    meta.Category = 6;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Baseline with stockout window and level adjustments";
end

function [x,f,meta] = TF092_PercussiveAttackDecay(N,t0,attackScale,attackRate,decayMix,decayRate1,decayRate2,ringAmp,ringRate,ringFreq)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(t0), t0 = 0.18; end
    if nargin<3 || isempty(attackScale), attackScale = 1.10; end
    if nargin<4 || isempty(attackRate), attackRate = 180; end
    if nargin<5 || isempty(decayMix), decayMix = [0.68 0.32]; end
    if nargin<6 || isempty(decayRate1), decayRate1 = 7; end
    if nargin<7 || isempty(decayRate2), decayRate2 = 24; end
    if nargin<8 || isempty(ringAmp), ringAmp = 0.18; end
    if nargin<9 || isempty(ringRate), ringRate = 12; end
    if nargin<10 || isempty(ringFreq), ringFreq = 58; end

    x = linspace(0,1,N).';
    validateattributes(decayMix,{'numeric'},{'numel',2});
    u = max(x-t0,0);
    attack = attackScale*(1-exp(-attackRate*u)).*(x>=t0);
    decay = attack.*(decayMix(1)*exp(-decayRate1*u) + decayMix(2)*exp(-decayRate2*u));
    ring = (x>=t0).*ringAmp.*exp(-ringRate*u).*sin(2*pi*ringFreq*u);
    f = decay + ring;
    meta = struct;
    meta.ID = "TF092";
    meta.Name = "Percussive Attack-Decay";
    meta.Category = 6;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Fast attack, multi-timescale decay with high-frequency ring";
end

function [x,f,meta] = TF093_VibratoTone(N,envC1,envW1,envC2,envW2,phaseBase,phaseVibFreq,phaseVibAmp,ampBase,ampModFreq,ampModAmp)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(envC1), envC1 = 0.12; end
    if nargin<3 || isempty(envW1), envW1 = 0.025; end
    if nargin<4 || isempty(envC2), envC2 = 0.88; end
    if nargin<5 || isempty(envW2), envW2 = 0.035; end
    if nargin<6 || isempty(phaseBase), phaseBase = 30; end
    if nargin<7 || isempty(phaseVibFreq), phaseVibFreq = 5.5; end
    if nargin<8 || isempty(phaseVibAmp), phaseVibAmp = 0.75; end
    if nargin<9 || isempty(ampBase), ampBase = 0.72; end
    if nargin<10 || isempty(ampModFreq), ampModFreq = 2.2; end
    if nargin<11 || isempty(ampModAmp), ampModAmp = 0.14; end

    x = linspace(0,1,N).';
    sigmoid = @(z,c,w) 1./(1+exp(-(z-c)/w));
    env = sigmoid(x,envC1,envW1) - sigmoid(x,envC2,envW2);
    phase = 2*pi*(phaseBase*x + phaseVibAmp*sin(2*pi*phaseVibFreq*x));
    amp = ampBase + ampModAmp*sin(2*pi*ampModFreq*x);
    f = env.*amp.*sin(phase);
    meta = struct;
    meta.ID = "TF093";
    meta.Name = "Vibrato Tone";
    meta.Category = 6;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Tonal vibrato with envelope";
end

function [x,f,meta] = TF094_ChordBeating(N,envC1,envW1,envC2,envW2,a1,a2,a3,f1,f2,f3,phi2,phi3)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(envC1), envC1 = 0.10; end
    if nargin<3 || isempty(envW1), envW1 = 0.030; end
    if nargin<4 || isempty(envC2), envC2 = 0.90; end
    if nargin<5 || isempty(envW2), envW2 = 0.040; end
    if nargin<6 || isempty(a1), a1 = 0.42; end
    if nargin<7 || isempty(a2), a2 = 0.39; end
    if nargin<8 || isempty(a3), a3 = 0.23; end
    if nargin<9 || isempty(f1), f1 = 27; end
    if nargin<10 || isempty(f2), f2 = 29; end
    if nargin<11 || isempty(f3), f3 = 41; end
    if nargin<12 || isempty(phi2), phi2 = 0.2; end
    if nargin<13 || isempty(phi3), phi3 = -0.4; end

    x = linspace(0,1,N).';
    sigmoid = @(z,c,w) 1./(1+exp(-(z-c)/w));
    env = sigmoid(x,envC1,envW1) - sigmoid(x,envC2,envW2);
    f = env.*(a1*sin(2*pi*f1*x) + a2*sin(2*pi*f2*x+phi2) + a3*sin(2*pi*f3*x+phi3));
    meta = struct;
    meta.ID = "TF094";
    meta.Name = "Chord Beating";
    meta.Category = 6;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Beating chords under an envelope";
end

function [x,f,meta] = TF095_SpeechFormantTransition(N,envC1,envW1,envC2,envW2,ph1_coef,ph2_coef,ph3_coef,ampScale,ampCenter,ampWidth)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(envC1), envC1 = 0.07; end
    if nargin<3 || isempty(envW1), envW1 = 0.025; end
    if nargin<4 || isempty(envC2), envC2 = 0.93; end
    if nargin<5 || isempty(envW2), envW2 = 0.030; end
    if nargin<6 || isempty(ph1_coef), ph1_coef = [8 7]; end    % linear and quadratic coefficients
    if nargin<7 || isempty(ph2_coef), ph2_coef = [22 -5]; end
    if nargin<8 || isempty(ph3_coef), ph3_coef = [38 4]; end
    if nargin<9 || isempty(ampScale), ampScale = [0.42 0.27 0.14]; end
    if nargin<10 || isempty(ampCenter), ampCenter = 0.58; end
    if nargin<11 || isempty(ampWidth), ampWidth = 0.22; end

    x = linspace(0,1,N).';
    sigmoid = @(z,c,w) 1./(1+exp(-(z-c)/w));
    env = sigmoid(x,envC1,envW1) - sigmoid(x,envC2,envW2);
    ph1 = 2*pi*(ph1_coef(1)*x + ph1_coef(2)*x.^2);
    ph2 = 2*pi*(ph2_coef(1)*x + ph2_coef(2)*x.^2);
    ph3 = 2*pi*(ph3_coef(1)*x + ph3_coef(2)*x.^2);
    f = env.*(ampScale(1)*sin(ph1) + ampScale(2)*sin(ph2+0.3) + ampScale(3)*sin(ph3-0.5));
    f = f.*(0.78 + 0.22*exp(-0.5*((x-ampCenter)/ampWidth).^2));
    meta = struct;
    meta.ID = "TF095";
    meta.Name = "Speech Formant Transition";
    meta.Category = 6;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Formant transitions with amplitude shaping";
end

function [x,f,meta] = TF096_GenericAudioIntro(N,ambFreq,ambAmp,bassC,bassW,bassAmp,bassFreq,harmC,harmW,harmAmp,harmFreq,beatCenters,beatAmp,beatDecay,cresAmp)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(ambFreq), ambFreq = 4; end
    if nargin<3 || isempty(ambAmp), ambAmp = 0.04; end
    if nargin<4 || isempty(bassC), bassC = 0.18; end
    if nargin<5 || isempty(bassW), bassW = 0.020; end
    if nargin<6 || isempty(bassAmp), bassAmp = 0.14; end
    if nargin<7 || isempty(bassFreq), bassFreq = 9; end
    if nargin<8 || isempty(harmC), harmC = 0.38; end
    if nargin<9 || isempty(harmW), harmW = 0.025; end
    if nargin<10 || isempty(harmAmp), harmAmp = 0.12; end
    if nargin<11 || isempty(harmFreq), harmFreq = 23; end
    if nargin<12 || isempty(beatCenters), beatCenters = 0.42:0.085:0.96; end
    if nargin<13 || isempty(beatAmp), beatAmp = 0.20; end
    if nargin<14 || isempty(beatDecay), beatDecay = 70; end
    if nargin<15 || isempty(cresAmp), cresAmp = 0.10; end

    x = linspace(0,1,N).';
    sigmoid = @(z,c,w) 1./(1+exp(-(z-c)/w));
    amb = ambAmp*sin(2*pi*ambFreq*x);
    bassEnv = sigmoid(x,bassC,bassW);
    bass = bassAmp*bassEnv.*sin(2*pi*bassFreq*x);
    harmEnv = sigmoid(x,harmC,harmW);
    harm = harmAmp*harmEnv.*sin(2*pi*harmFreq*x+0.4);
    rhythm = zeros(size(x));
    for k = 1:numel(beatCenters)
        c = beatCenters(k);
        u = max(x-c,0);
        rhythm = rhythm + beatAmp*(x>=c).*exp(-beatDecay*u).*sin(2*pi*beatDecay*u);
    end
    cres = cresAmp*x.*sin(2*pi*(14*x + 5*x.^2));
    f = amb + bass + harm + rhythm + cres;
    meta = struct;
    meta.ID = "TF096";
    meta.Name = "Generic Audio Intro";
    meta.Category = 6;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Layered audio intro with beats and crescendos";
end

function [x,f,meta] = TF097_MilankovitchCycles(N,tKyrScale,eccAmp,eccFreq,oblAmp,oblFreq,precBaseAmp,precModAmp,terminationC1,terminationW1,terminationC2,terminationW2)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(tKyrScale), tKyrScale = 500; end
    if nargin<3 || isempty(eccAmp), eccAmp = 0.25; end
    if nargin<4 || isempty(eccFreq), eccFreq = 100; end
    if nargin<5 || isempty(oblAmp), oblAmp = 0.16; end
    if nargin<6 || isempty(oblFreq), oblFreq = 41; end
    if nargin<7 || isempty(precBaseAmp), precBaseAmp = 0.10; end
    if nargin<8 || isempty(precModAmp), precModAmp = 0.55; end
    if nargin<9 || isempty(terminationC1), terminationC1 = 0.62; end
    if nargin<10 || isempty(terminationW1), terminationW1 = 0.008; end
    if nargin<11 || isempty(terminationC2), terminationC2 = 0.71; end
    if nargin<12 || isempty(terminationW2), terminationW2 = 0.025; end

    x = linspace(0,1,N).';
    sigmoid = @(z,c,w) 1./(1+exp(-(z-c)/w));
    tKyr = tKyrScale*x;
    ecc = eccAmp*sin(2*pi*tKyr/eccFreq + 0.2);
    obl = oblAmp*sin(2*pi*tKyr/oblFreq - 0.6);
    precAmp = precBaseAmp*(1 + precModAmp*sin(2*pi*tKyr/100 + 0.7));
    prec = precAmp.*sin(2*pi*tKyr/23 + 0.4);
    termination = 0.18*(sigmoid(x,terminationC1,terminationW1) - sigmoid(x,terminationC2,terminationW2));
    f = ecc + obl + prec + termination;
    meta = struct;
    meta.ID = "TF097";
    meta.Name = "Milankovitch Cycles";
    meta.Category = 6;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Climate cycles from orbital parameters with termination";
end

function [x,f,meta] = TF098_TurbiditeSequence(N,baselineSlope,baselineIntercept,baselineOscAmp,c,c_a,tau)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(baselineSlope), baselineSlope = 0.12; end
    if nargin<3 || isempty(baselineIntercept), baselineIntercept = 0.30; end
    if nargin<4 || isempty(baselineOscAmp), baselineOscAmp = 0.035; end
    if nargin<5 || isempty(c), c = [0.15 0.31 0.48 0.64 0.79 0.90]; end
    if nargin<6 || isempty(c_a), c_a = [0.28 0.42 0.22 0.50 0.35 0.20]; end
    if nargin<7 || isempty(tau), tau = [0.045 0.065 0.030 0.075 0.050 0.028]; end

    x = linspace(0,1,N).';
    f = baselineIntercept + baselineSlope*x + baselineOscAmp*sin(2*pi*3*x);
    for k = 1:numel(c)
        u = max(x-c(k),0);
        event = c_a(k)*(x>=c(k)).*exp(-u/tau(k));
        f = f + event;
    end
    meta = struct;
    meta.ID = "TF098";
    meta.Name = "Turbidite Sequence";
    meta.Category = 6;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Baseline trend with episodic turbidite events";
end

function [x,f,meta] = TF099_CavefishNeuromast(N,baseAmp,baseOscFreq,onC,onW,onAmp,susC,susW,adaptAmp,adaptRate,secAmp,off1Amp,off1W,off2Amp,off2W)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(baseAmp), baseAmp = 0.10; end
    if nargin<3 || isempty(baseOscFreq), baseOscFreq = 4; end
    if nargin<4 || isempty(onC), onC = 0.30; end
    if nargin<5 || isempty(onW), onW = 0.012; end
    if nargin<6 || isempty(onAmp), onAmp = 0.62; end
    if nargin<7 || isempty(susC), susC = 0.31; end
    if nargin<8 || isempty(susW), susW = 0.010; end
    if nargin<9 || isempty(adaptAmp), adaptAmp = -0.12; end
    if nargin<10 || isempty(adaptRate), adaptRate = 6; end
    if nargin<11 || isempty(secAmp), secAmp = 0.16; end
    if nargin<12 || isempty(off1Amp), off1Amp = -0.18; end
    if nargin<13 || isempty(off1W), off1W = 0.016; end
    if nargin<14 || isempty(off2Amp), off2Amp = 0.10; end
    if nargin<15 || isempty(off2W), off2W = 0.025; end

    x = linspace(0,1,N).';
    sigmoid = @(z,c,w) 1./(1+exp(-(z-c)/w));
    base = baseAmp + 0.018*sin(2*pi*baseOscFreq*x);
    on = onAmp*exp(-0.5*((x-onC)/onW).^2);
    sustained = 0.30*(sigmoid(x,susC,susW) - sigmoid(x,0.69,0.018));
    adapt = adaptAmp*(1-exp(-adaptRate*max(x-0.33,0))).*(x>=0.33 & x<0.69);
    secondary = secAmp*exp(-0.5*((x-0.52)/0.025).^2);
    off = off1Amp*exp(-0.5*((x-0.71)/off1W).^2) + off2Amp*exp(-0.5*((x-0.755)/off2W).^2);
    f = base + on + sustained + adapt + secondary + off;
    meta = struct;
    meta.ID = "TF099";
    meta.Name = "Cavefish Neuromast";
    meta.Category = 6;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "On response, sustained plateau, adaptation and off features";
end

function [x,f,meta] = TF100_NeuralBurstAdaptation(N,slowBase,slowFreq,c,a_base,widthBase,oscBase,oscRate,sigC,sigW)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(slowBase), slowBase = 0.08; end
    if nargin<3 || isempty(slowFreq), slowFreq = 1.8; end
    if nargin<4 || isempty(c), c = [0.12 0.24 0.355 0.465 0.57 0.67 0.765 0.855 0.935]; end
    if nargin<5 || isempty(a_base), a_base = [0.70 0.64 0.58 0.54 0.49 0.45 0.42 0.39 0.36]; end
    if nargin<6 || isempty(widthBase), widthBase = 0.010; end
    if nargin<7 || isempty(oscBase), oscBase = 0.60; end
    if nargin<8 || isempty(oscRate), oscRate = 72; end
    if nargin<9 || isempty(sigC), sigC = 0.52; end
    if nargin<10 || isempty(sigW), sigW = 0.12; end

    x = linspace(0,1,N).';
    sigmoid = @(z,c,w) 1./(1+exp(-(z-c)/w));
    slow = slowBase + 0.035*sin(2*pi*slowFreq*x);
    f = slow;
    for k = 1:numel(c)
        width = widthBase + 0.0025*k;
        env = exp(-0.5*((x-c(k))/width).^2);
        localOsc = oscBase*sin(2*pi*(oscRate*x + 0.8*k));
        f = f + a_base(k)*env.*(0.75+0.25*localOsc);
    end
    f = f - 0.10*sigmoid(x,sigC,sigW);
    meta = struct;
    meta.ID = "TF100";
    meta.Name = "Neural Burst Adaptation";
    meta.Category = 6;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Bursting events with adaptation and baseline oscillation";
end

%% Category 7: 101 - 125

function [x,f,meta] = TF101_QuantumRamseyDrift(N,ampDecay,phaseA,phaseB,phaseC,jumpC,jumpW,vis0,visSlope)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(ampDecay), ampDecay = 0.92; end
    if nargin<3 || isempty(phaseA), phaseA = 10; end
    if nargin<4 || isempty(phaseB), phaseB = 1.8; end
    if nargin<5 || isempty(phaseC), phaseC = 0.10; end
    if nargin<6 || isempty(jumpC), jumpC = 0.64; end
    if nargin<7 || isempty(jumpW), jumpW = 0.004; end
    if nargin<8 || isempty(vis0), vis0 = 0.92; end
    if nargin<9 || isempty(visSlope), visSlope = -0.28; end

    x = linspace(0,1,N).';
    S = @(z,c,w) 1./(1+exp(-(z-c)/w));
    phaseQR = 2*pi*(phaseA*x + phaseB*x.^2 + phaseC*sin(2*pi*2*x));
    visQR = vis0 + visSlope*x;
    jumpQR = 0.55*S(x,jumpC,jumpW);
    f = visQR.*cos(phaseQR + jumpQR);
    meta = struct;
    meta.ID = "TF101";
    meta.Name = "Quantum Ramsey Drift";
    meta.Category = 6;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Drifting phase with visibility decay and phase jump";
end

function [x,f,meta] = TF102_QuantumLeakageBurst(N,base,oscFreq,burstCs,burstAmp,burstW,sigA,sigB)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(base), base = 0.08; end
    if nargin<3 || isempty(oscFreq), oscFreq = 4; end
    if nargin<4 || isempty(burstCs), burstCs = [0.24 0.47 0.71]; end
    if nargin<5 || isempty(burstAmp), burstAmp = 0.20; end
    if nargin<6 || isempty(burstW), burstW = 0.020; end
    if nargin<7 || isempty(sigA), sigA = 0.54; end
    if nargin<8 || isempty(sigB), sigB = 0.64; end

    x = linspace(0,1,N).';
    S = @(z,c,w) 1./(1+exp(-(z-c)/w));
    f = base + 0.02*sin(2*pi*oscFreq*x);
    for c = burstCs
        f = f + burstAmp*exp(-0.5*((x-c)/burstW).^2);
    end
    f = f + 0.10*(S(x,sigA,0.004)-S(x,sigB,0.006));
    meta = struct;
    meta.ID = "TF102";
    meta.Name = "Quantum Leakage Burst";
    meta.Category = 6;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Baseline oscillation with localized leakage bursts";
end

function [x,f,meta] = TF103_FusionELMSawtooth(N,base,linSlope,period,phaseAmp,spikeCs,spikeAmp,spikeW)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(base), base = 0.30; end
    if nargin<3 || isempty(linSlope), linSlope = 0.20; end
    if nargin<4 || isempty(period), period = 0.105; end
    if nargin<5 || isempty(phaseAmp), phaseAmp = 0.18; end
    if nargin<6 || isempty(spikeCs), spikeCs = 0.18:0.12:0.90; end
    if nargin<7 || isempty(spikeAmp), spikeAmp = 0.28; end
    if nargin<8 || isempty(spikeW), spikeW = 0.005; end

    x = linspace(0,1,N).';
    f = base + linSlope*x;
    phase = mod(x,period)/period;
    f = f + phaseAmp*phase;
    for c = spikeCs
        f = f + spikeAmp*exp(-0.5*((x-c)/spikeW).^2);
    end
    meta = struct;
    meta.ID = "TF103";
    meta.Name = "Fusion ELM Sawtooth";
    meta.Category = 6;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Linear ramp with sawtooth phase and narrow spikes";
end

function [x,f,meta] = TF104_TokamakDisruption(N,growAmp,growFreq,growQuad,lockAmp,lockFreq,lockC,lockW,collapseAmp,collapseC,collapseW,base)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(growAmp), growAmp = 0.04; end
    if nargin<3 || isempty(growFreq), growFreq = 8; end
    if nargin<4 || isempty(growQuad), growQuad = 10; end
    if nargin<5 || isempty(lockAmp), lockAmp = 0.16; end
    if nargin<6 || isempty(lockFreq), lockFreq = 2.5; end
    if nargin<7 || isempty(lockC), lockC = 0.58; end
    if nargin<8 || isempty(lockW), lockW = 0.02; end
    if nargin<9 || isempty(collapseAmp), collapseAmp = -0.95; end
    if nargin<10 || isempty(collapseC), collapseC = 0.79; end
    if nargin<11 || isempty(collapseW), collapseW = 0.006; end
    if nargin<12 || isempty(base), base = 0.55; end

    x = linspace(0,1,N).';
    S = @(z,c,w) 1./(1+exp(-(z-c)/w));
    growTD = (growAmp + 0.30*x).*sin(2*pi*(growFreq*x + growQuad*x.^2));
    lockTD = lockAmp*sin(2*pi*lockFreq*x).*S(x,lockC,lockW);
    collapseTD = collapseAmp*S(x,collapseC,collapseW);
    f = base + growTD + lockTD + collapseTD;
    meta = struct;
    meta.ID = "TF104";
    meta.Name = "Tokamak Disruption";
    meta.Category = 6;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Growth, mode locking and abrupt collapse";
end

function [x,f,meta] = TF105_CalciumTransientTrain(N,base,linTrend,cCT,aCT,riseRate,decayRate)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(base), base = 0.05; end
    if nargin<3 || isempty(linTrend), linTrend = 0.01; end
    if nargin<4 || isempty(cCT), cCT = [0.16 0.29 0.43 0.455 0.67 0.82]; end
    if nargin<5 || isempty(aCT), aCT = [0.28 0.52 0.72 0.45 0.35 0.18]; end
    if nargin<6 || isempty(riseRate), riseRate = 120; end
    if nargin<7 || isempty(decayRate), decayRate = 10; end

    x = linspace(0,1,N).';
    f = base + linTrend*x;
    for k = 1:numel(cCT)
        u = max(x-cCT(k),0);
        f = f + aCT(k)*(x>=cCT(k)).*(1-exp(-riseRate*u)).*exp(-decayRate*u);
    end
    meta = struct;
    meta.ID = "TF105";
    meta.Name = "Calcium Transient Train";
    meta.Category = 6;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Series of calcium transients with rise and decay";
end

function [x,f,meta] = TF106_NanoporeCurrent(N,levels,edges,transAmp1,transC1,transW1,transAmp2,transC2,transW2)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(levels), levels = [0.72 0.50 0.64 0.39 0.58 0.46]; end
    if nargin<3 || isempty(edges), edges = [0 0.16 0.31 0.50 0.67 0.82 1]; end
    if nargin<4 || isempty(transAmp1), transAmp1 = 0.05; end
    if nargin<5 || isempty(transC1), transC1 = 0.545; end
    if nargin<6 || isempty(transW1), transW1 = 0.008; end
    if nargin<7 || isempty(transAmp2), transAmp2 = -0.10; end
    if nargin<8 || isempty(transC2), transC2 = 0.735; end
    if nargin<9 || isempty(transW2), transW2 = 0.004; end

    x = linspace(0,1,N).';
    f = zeros(size(x));
    for k = 1:numel(levels)
        idx = x>=edges(k) & x<edges(k+1);
        f(idx) = levels(k);
    end
    f(x>=edges(end-1)) = levels(end);
    f = f + transAmp1*exp(-0.5*((x-transC1)/transW1).^2) + transAmp2*exp(-0.5*((x-transC2)/transW2).^2);
    meta = struct;
    meta.ID = "TF106";
    meta.Name = "Nanopore Current";
    meta.Category = 6;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Step-like current with brief transients";
end

function [x,f,meta] = TF107_CopyNumberGenome(N,base,oscAmp,oscFreq,steps)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(base), base = 0.48; end
    if nargin<3 || isempty(oscAmp), oscAmp = 0.025; end
    if nargin<4 || isempty(oscFreq), oscFreq = 5; end
    if nargin<5 || isempty(steps)
        steps = [0.18 0.39 0.52 0.66 0.74 0.79];
    end

    x = linspace(0,1,N).';
    S = @(z,c,w) 1./(1+exp(-(z-c)/w));
    f = base + oscAmp*sin(2*pi*oscFreq*x);
    f = f + 0.20*(S(x,steps(1),0.004)-S(x,steps(2),0.004)) - 0.15*(S(x,steps(3),0.004)-S(x,steps(4),0.004)) + 0.30*(S(x,steps(5),0.003)-S(x,steps(6),0.003));
    meta = struct;
    meta.ID = "TF107";
    meta.Name = "Copy Number Genome";
    meta.Category = 6;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Step-like copy number changes with baseline oscillation";
end

function [x,f,meta] = TF108_SpatialTranscriptScan(N)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    S = @(z,c,w) 1./(1+exp(-(z-c)/w));
    f = 0.18 + 0.20*x + 0.04*sin(2*pi*2*x);
    f = f + 0.38*(S(x,0.31,0.010)-S(x,0.55,0.012)) + 0.24*exp(-0.5*((x-0.72)/0.030).^2) + 0.08*exp(-0.5*((x-0.80)/0.012).^2);
    meta = struct;
    meta.ID = "TF108";
    meta.Name = "Spatial Transcript Scan";
    meta.Category = 6;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Gradual trend with localized increases and bumps";
end

function [x,f,meta] = TF109_SemiconductorMetrology(N,base,slope,amp1,freq1,amp2,freq2,stepC,stepW,defC,defW,defAmp)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(base), base = 0.62; end
    if nargin<3 || isempty(slope), slope = 0.11; end
    if nargin<4 || isempty(amp1), amp1 = 0.035; end
    if nargin<5 || isempty(freq1), freq1 = 9; end
    if nargin<6 || isempty(amp2), amp2 = 0.018; end
    if nargin<7 || isempty(freq2), freq2 = 31; end
    if nargin<8 || isempty(stepC), stepC = 0.58; end
    if nargin<9 || isempty(stepW), stepW = 0.004; end
    if nargin<10 || isempty(defC), defC = 0.76; end
    if nargin<11 || isempty(defW), defW = 0.010; end
    if nargin<12 || isempty(defAmp), defAmp = 0.12; end

    x = linspace(0,1,N).';
    S = @(z,c,w) 1./(1+exp(-(z-c)/w));
    f = base + slope*x + amp1*sin(2*pi*freq1*x) + amp2*sin(2*pi*freq2*x);
    f = f - 0.08*S(x,stepC,stepW) + defAmp*exp(-0.5*((x-defC)/defW).^2);
    meta = struct;
    meta.ID = "TF109";
    meta.Name = "Semiconductor Metrology";
    meta.Category = 6;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Trend with multi-scale oscillations and localized defect";
end

function [x,f,meta] = TF110_LithographyEdge(N,base,amp1,freq1,amp2,freq2,pos1,w1,pos2,w2)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(base), base = 0.50; end
    if nargin<3 || isempty(amp1), amp1 = 0.025; end
    if nargin<4 || isempty(freq1), freq1 = 7; end
    if nargin<5 || isempty(amp2), amp2 = 0.012; end
    if nargin<6 || isempty(freq2), freq2 = 43; end
    if nargin<7 || isempty(pos1), pos1 = 0.39; end
    if nargin<8 || isempty(w1), w1 = 0.010; end
    if nargin<9 || isempty(pos2), pos2 = 0.69; end
    if nargin<10 || isempty(w2), w2 = 0.008; end

    x = linspace(0,1,N).';
    f = base + amp1*sin(2*pi*freq1*x) + amp2*sin(2*pi*freq2*x);
    f = f + 0.14*exp(-0.5*((x-pos1)/w1).^2) - 0.11*exp(-0.5*((x-pos2)/w2).^2);
    meta = struct;
    meta.ID = "TF110";
    meta.Name = "Lithography Edge";
    meta.Category = 6;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Edge oscillations with positive and negative localized features";
end

function [x,f,meta] = TF111_ParticlePileup(N,cPP,aPP,riseRate,decayRate)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(cPP), cPP = [0.14 0.30 0.49 0.515 0.72 0.88]; end
    if nargin<3 || isempty(aPP), aPP = [0.35 0.58 0.85 0.70 0.50 0.27]; end
    if nargin<4 || isempty(riseRate), riseRate = 140; end
    if nargin<5 || isempty(decayRate), decayRate = 18; end

    x = linspace(0,1,N).';
    f = zeros(size(x));
    for k = 1:numel(cPP)
        u = max(x-cPP(k),0);
        f = f + aPP(k)*(x>=cPP(k)).*(1-exp(-riseRate*u)).*exp(-decayRate*u);
    end
    meta = struct;
    meta.ID = "TF111";
    meta.Name = "Particle Pileup";
    meta.Category = 6;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Accumulating events with fast rise and decay";
end

function [x,f,meta] = TF112_CryogenicPulse(N,mainC,mainRise,mainDecay,precC,precW,precAmp,secC,secW,secAmp)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(mainC), mainC = 0.28; end
    if nargin<3 || isempty(mainRise), mainRise = 170; end
    if nargin<4 || isempty(mainDecay), mainDecay = 7; end
    if nargin<5 || isempty(precC), precC = 0.245; end
    if nargin<6 || isempty(precW), precW = 0.010; end
    if nargin<7 || isempty(precAmp), precAmp = 0.08; end
    if nargin<8 || isempty(secC), secC = 0.62; end
    if nargin<9 || isempty(secW), secW = 0.020; end
    if nargin<10 || isempty(secAmp), secAmp = 0.18; end

    x = linspace(0,1,N).';
    uCP = max(x-mainC,0);
    mainCP = 0.95*(x>=mainC).*(1-exp(-mainRise*uCP)).*exp(-mainDecay*uCP);
    precCP = precAmp*exp(-0.5*((x-precC)/precW).^2);
    secCP = secAmp*exp(-0.5*((x-secC)/secW).^2);
    f = mainCP + precCP + secCP;
    meta = struct;
    meta.ID = "TF112";
    meta.Name = "Cryogenic Pulse";
    meta.Category = 6;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Main pulse with precursor and secondary bumps";
end

function [x,f,meta] = TF113_SpaceWeatherStorm(N,base,oscAmp,oscFreq,step1C,step1W,step2C,step2W,riseC,riseRate,dipCs)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(base), base = 0.10; end
    if nargin<3 || isempty(oscAmp), oscAmp = 0.025; end
    if nargin<4 || isempty(oscFreq), oscFreq = 3; end
    if nargin<5 || isempty(step1C), step1C = 0.30; end
    if nargin<6 || isempty(step1W), step1W = 0.006; end
    if nargin<7 || isempty(step2C), step2C = 0.38; end
    if nargin<8 || isempty(step2W), step2W = 0.018; end
    if nargin<9 || isempty(riseC), riseC = 0.47; end
    if nargin<10 || isempty(riseRate), riseRate = 3.5; end
    if nargin<11 || isempty(dipCs), dipCs = [0.52 0.61 0.69]; end

    x = linspace(0,1,N).';
    S = @(z,c,w) 1./(1+exp(-(z-c)/w));
    f = base + oscAmp*sin(2*pi*oscFreq*x);
    f = f + 0.20*S(x,step1C,step1W) - 0.75*S(x,step2C,step2W);
    u = max(x-riseC,0);
    f = f + (x>=riseC).*0.55.*(1-exp(-riseRate*u));
    for c = dipCs
        f = f - 0.10*exp(-0.5*((x-c)/0.012).^2);
    end
    meta = struct;
    meta.ID = "TF113";
    meta.Name = "Space Weather Storm";
    meta.Category = 6;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Step-like storm with localized dips";
end

function [x,f,meta] = TF114_GNSSMultipathSlip(N,osc1Amp,osc1Freq,osc2Amp,osc2Freq,stepC,stepW,decayRate,decayAmp)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(osc1Amp), osc1Amp = 0.12; end
    if nargin<3 || isempty(osc1Freq), osc1Freq = 5; end
    if nargin<4 || isempty(osc2Amp), osc2Amp = 0.035; end
    if nargin<5 || isempty(osc2Freq), osc2Freq = 17; end
    if nargin<6 || isempty(stepC), stepC = 0.57; end
    if nargin<7 || isempty(stepW), stepW = 0.003; end
    if nargin<8 || isempty(decayRate), decayRate = 5; end
    if nargin<9 || isempty(decayAmp), decayAmp = 0.25; end

    x = linspace(0,1,N).';
    S = @(z,c,w) 1./(1+exp(-(z-c)/w));
    f = osc1Amp*sin(2*pi*osc1Freq*x) + osc2Amp*sin(2*pi*osc2Freq*x+0.4);
    f = f + 0.42*S(x,stepC,stepW);
    u = max(x-stepC,0);
    f = f - (x>=stepC).*decayAmp.*(1-exp(-decayRate*u));
    meta = struct;
    meta.ID = "TF114";
    meta.Name = "GNSS Multipath Slip";
    meta.Category = 6;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Rising step with subsequent decay";
end

function [x,f,meta] = TF115_HyperspectralMineral(N,baseSlope,bands,amps,width)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(baseSlope), baseSlope = [0.78 0.08]; end % [base slope]
    if nargin<3 || isempty(bands), bands = [0.22 0.46 0.59 0.625 0.81]; end
    if nargin<4 || isempty(amps), amps = [0.12 0.25 0.18 0.14 0.08]; end
    if nargin<5 || isempty(width), width = [0.030 0.040 0.018 0.016 0.024]; end

    x = linspace(0,1,N).';
    f = baseSlope(1) + baseSlope(2)*x;
    for k = 1:numel(bands)
        f = f - amps(k)*exp(-0.5*((x-bands(k))/width(k)).^2);
    end
    meta = struct;
    meta.ID = "TF115";
    meta.Name = "Hyperspectral Mineral";
    meta.Category = 6;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Baseline with absorption-like bands";
end

function [x,f,meta] = TF116_SideChannelPower(N,base,lfAmp,burstAmp,burstDecay,ringFreq,ringAmp)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(base), base = 0.10; end
    if nargin<3 || isempty(lfAmp), lfAmp = 0.018; end
    if nargin<4 || isempty(burstAmp), burstAmp = 0.24; end
    if nargin<5 || isempty(burstDecay), burstDecay = 60; end
    if nargin<6 || isempty(ringFreq), ringFreq = 75; end
    if nargin<7 || isempty(ringAmp), ringAmp = 0.055; end

    x = linspace(0,1,N).';
    f = base + lfAmp*sin(2*pi*3*x);
    for c = 0.10:0.11:0.90
        u = max(x-c,0);
        f = f + burstAmp*(x>=c).*exp(-burstDecay*u).*sin(2*pi*ringFreq*u);
    end
    f = f + ringAmp*exp(-0.5*((x-0.54)/0.010).^2);
    meta = struct;
    meta.ID = "TF116";
    meta.Name = "Side Channel Power";
    meta.Category = 6;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Repeated bursts with high-frequency ringing";
end

function [x,f,meta] = TF117_SecurityBeacon(N,base,lfAmp,pulseCs,pulseAmp,pulseW,hiFreq,hiAmp)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(base), base = 0.20; end
    if nargin<3 || isempty(lfAmp), lfAmp = 0.05; end
    if nargin<4 || isempty(pulseCs), pulseCs = [0.18 0.42 0.67 0.83]; end
    if nargin<5 || isempty(pulseAmp), pulseAmp = 0.18; end
    if nargin<6 || isempty(pulseW), pulseW = 0.020; end
    if nargin<7 || isempty(hiFreq), hiFreq = 18; end
    if nargin<8 || isempty(hiAmp), hiAmp = 0.045; end

    x = linspace(0,1,N).';
    f = base + lfAmp*sin(2*pi*2*x);
    for c = pulseCs
        f = f + pulseAmp*exp(-0.5*((x-c)/pulseW).^2);
    end
    f = f + hiAmp*sin(2*pi*hiFreq*x);
    meta = struct;
    meta.ID = "TF117";
    meta.Name = "Security Beacon";
    meta.Category = 6;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Periodic beacon with localized pulses";
end

function [x,f,meta] = TF118_GPUThermalThrottle(N,base,stepC1,stepW1,stepAmp,stepC2,stepW2,oscAmp,oscFreq,oscWindowW)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(base), base = 0.20; end
    if nargin<3 || isempty(stepC1), stepC1 = 0.28; end
    if nargin<4 || isempty(stepW1), stepW1 = 0.060; end
    if nargin<5 || isempty(stepAmp), stepAmp = 0.55; end
    if nargin<6 || isempty(stepC2), stepC2 = 0.64; end
    if nargin<7 || isempty(stepW2), stepW2 = 0.008; end
    if nargin<8 || isempty(oscAmp), oscAmp = 0.06; end
    if nargin<9 || isempty(oscFreq), oscFreq = 8; end
    if nargin<10 || isempty(oscWindowW), oscWindowW = 0.010; end

    x = linspace(0,1,N).';
    S = @(z,c,w) 1./(1+exp(-(z-c)/w));
    f = base + stepAmp*S(x,stepC1,stepW1);
    f = f - 0.22*S(x,stepC2,stepW2) + oscAmp*sin(2*pi*oscFreq*x).*S(x,stepC2,oscWindowW);
    meta = struct;
    meta.ID = "TF118";
    meta.Name = "GPU Thermal Throttle";
    meta.Category = 6;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Thermal step with throttling oscillation";
end

function [x,f,meta] = TF119_MoELoadImbalance(N,base,lfAmp,step1Amp,step1C,step1W,step2C,step2W,hiAmp,hiFreq,hiW)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(base), base = 0.42; end
    if nargin<3 || isempty(lfAmp), lfAmp = 0.025; end
    if nargin<4 || isempty(step1Amp), step1Amp = 0.28; end
    if nargin<5 || isempty(step1C), step1C = 0.38; end
    if nargin<6 || isempty(step1W), step1W = 0.012; end
    if nargin<7 || isempty(step2C), step2C = 0.70; end
    if nargin<8 || isempty(step2W), step2W = 0.018; end
    if nargin<9 || isempty(hiAmp), hiAmp = 0.08; end
    if nargin<10 || isempty(hiFreq), hiFreq = 12; end
    if nargin<11 || isempty(hiW), hiW = 0.015; end

    x = linspace(0,1,N).';
    S = @(z,c,w) 1./(1+exp(-(z-c)/w));
    f = base + lfAmp*sin(2*pi*4*x);
    f = f + step1Amp*(S(x,step1C,step1W)-S(x,step2C,step2W)) + hiAmp*sin(2*pi*hiFreq*x).*(S(x,step1C,hiW)-S(x,step2C,hiW));
    meta = struct;
    meta.ID = "TF119";
    meta.Name = "MoE Load Imbalance";
    meta.Category = 6;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Imbalance step with modulated oscillation";
end

function [x,f,meta] = TF120_InferenceQueueCollapse(N,base,slope,stepAmp,stepC1,stepW1,stepAmp2,stepC2,stepW2,burstAmp,burstDecay,burstFreq)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(base), base = 0.12; end
    if nargin<3 || isempty(slope), slope = 0.22; end
    if nargin<4 || isempty(stepAmp), stepAmp = 0.55; end
    if nargin<5 || isempty(stepC1), stepC1 = 0.50; end
    if nargin<6 || isempty(stepW1), stepW1 = 0.018; end
    if nargin<7 || isempty(stepAmp2), stepAmp2 = 0.35; end
    if nargin<8 || isempty(stepC2), stepC2 = 0.72; end
    if nargin<9 || isempty(stepW2), stepW2 = 0.025; end
    if nargin<10 || isempty(burstAmp), burstAmp = 0.12; end
    if nargin<11 || isempty(burstDecay), burstDecay = 5; end
    if nargin<12 || isempty(burstFreq), burstFreq = 13; end

    x = linspace(0,1,N).';
    S = @(z,c,w) 1./(1+exp(-(z-c)/w));
    f = base + slope*x;
    f = f + stepAmp*S(x,stepC1,stepW1) - stepAmp2*S(x,stepC2,stepW2);
    u = max(x-stepC1,0);
    f = f + (x>=stepC1).*burstAmp.*exp(-burstDecay*u).*sin(2*pi*burstFreq*u);
    meta = struct;
    meta.ID = "TF120";
    meta.Name = "Inference Queue Collapse";
    meta.Category = 6;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Queue buildup with oscillatory decay";
end

function [x,f,meta] = TF121_CuspChirpStep(N,cuspAmp,chirpAmp,chirpA,chirpB,stepAmp,stepC,stepW,trendAmp)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(cuspAmp), cuspAmp = 0.45; end
    if nargin<3 || isempty(chirpAmp), chirpAmp = 0.22; end
    if nargin<4 || isempty(chirpA), chirpA = 8; end
    if nargin<5 || isempty(chirpB), chirpB = 18; end
    if nargin<6 || isempty(stepAmp), stepAmp = 0.28; end
    if nargin<7 || isempty(stepC), stepC = 0.68; end
    if nargin<8 || isempty(stepW), stepW = 0.004; end
    if nargin<9 || isempty(trendAmp), trendAmp = 0.10; end

    x = linspace(0,1,N).';
    S = @(z,c,w) 1./(1+exp(-(z-c)/w));
    cusp = cuspAmp*sqrt(abs(x-0.30));
    chirp = chirpAmp*sin(2*pi*(chirpA*x + chirpB*x.^2));
    step = stepAmp*S(x,stepC,stepW);
    trend = trendAmp*x;
    f = cusp + chirp + step + trend;
    meta = struct;
    meta.ID = "TF121";
    meta.Name = "Cusp Chirp Step";
    meta.Category = 6;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Cusp-like baseline with chirp and step";
end

function [x,f,meta] = TF122_PeakForest(N,base,centers,amps,widths)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(base), base = 0.02; end
    if nargin<3 || isempty(centers), centers = [0.08 0.15 0.24 0.31 0.405 0.47 0.505 0.59 0.69 0.77 0.86 0.93]; end
    if nargin<4 || isempty(amps), amps = [0.22 -0.18 0.30 0.50 -0.25 0.70 0.42 -0.35 0.55 0.24 -0.20 0.38]; end
    if nargin<5 || isempty(widths), widths = [0.030 0.015 0.020 0.010 0.012 0.008 0.006 0.016 0.004 0.010 0.006 0.003]; end

    x = linspace(0,1,N).';
    f = base*ones(size(x));
    for k = 1:numel(centers)
        f = f + amps(k)*exp(-0.5*((x-centers(k))/widths(k)).^2);
    end
    meta = struct;
    meta.ID = "TF122";
    meta.Name = "Peak Forest";
    meta.Category = 6;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Dense collection of peaks and troughs";
end

function [x,f,meta] = TF123_HiddenNeedle(N,broadAmp,broadC,broadW,needleAmp,needleC,needleW,shoulderAmp,shoulderC,shoulderW)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(broadAmp), broadAmp = 0.80; end
    if nargin<3 || isempty(broadC), broadC = 0.52; end
    if nargin<4 || isempty(broadW), broadW = 0.20; end
    if nargin<5 || isempty(needleAmp), needleAmp = 0.085; end
    if nargin<6 || isempty(needleC), needleC = 0.565; end
    if nargin<7 || isempty(needleW), needleW = 0.0035; end
    if nargin<8 || isempty(shoulderAmp), shoulderAmp = -0.04; end
    if nargin<9 || isempty(shoulderC), shoulderC = 0.61; end
    if nargin<10 || isempty(shoulderW), shoulderW = 0.016; end

    x = linspace(0,1,N).';
    broad = broadAmp*exp(-0.5*((x-broadC)/broadW).^2);
    needle = needleAmp*exp(-0.5*((x-needleC)/needleW).^2);
    shoulder = shoulderAmp*exp(-0.5*((x-shoulderC)/shoulderW).^2);
    f = broad + needle + shoulder;
    meta = struct;
    meta.ID = "TF123";
    meta.Name = "Hidden Needle";
    meta.Category = 6;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Broad feature with a narrow hidden spike";
end

function [x,f,meta] = TF124_NestedWavePackets(N,p1Amp,p1C,p1W,p1Freq,p2Amp,p2C,p2W,p2Freq,p3Amp,p3C,p3W,p3Freq)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(p1Amp), p1Amp = 0.30; end
    if nargin<3 || isempty(p1C), p1C = 0.50; end
    if nargin<4 || isempty(p1W), p1W = 0.22; end
    if nargin<5 || isempty(p1Freq), p1Freq = 8; end
    if nargin<6 || isempty(p2Amp), p2Amp = 0.24; end
    if nargin<7 || isempty(p2C), p2C = 0.56; end
    if nargin<8 || isempty(p2W), p2W = 0.080; end
    if nargin<9 || isempty(p2Freq), p2Freq = 28; end
    if nargin<10 || isempty(p3Amp), p3Amp = 0.17; end
    if nargin<11 || isempty(p3C), p3C = 0.59; end
    if nargin<12 || isempty(p3W), p3W = 0.022; end
    if nargin<13 || isempty(p3Freq), p3Freq = 85; end

    x = linspace(0,1,N).';
    p1 = p1Amp*exp(-0.5*((x-p1C)/p1W).^2).*sin(2*pi*p1Freq*x);
    p2 = p2Amp*exp(-0.5*((x-p2C)/p2W).^2).*sin(2*pi*p2Freq*x);
    p3 = p3Amp*exp(-0.5*((x-p3C)/p3W).^2).*sin(2*pi*p3Freq*x);
    f = p1 + p2 + p3;
    meta = struct;
    meta.ID = "TF124";
    meta.Name = "Nested Wave Packets";
    meta.Category = 6;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Multiple nested oscillatory packets at different scales";
end

function [x,f,meta] = TF125_CancellationTrap(N,g1Amp,g1C,g1W,g2Amp,g2C,g2W,residAmp1,residFreq,residAmp2,residC,residW)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(g1Amp), g1Amp = 0.85; end
    if nargin<3 || isempty(g1C), g1C = 0.48; end
    if nargin<4 || isempty(g1W), g1W = 0.19; end
    if nargin<5 || isempty(g2Amp), g2Amp = 0.82; end
    if nargin<6 || isempty(g2C), g2C = 0.50; end
    if nargin<7 || isempty(g2W), g2W = 0.20; end
    if nargin<8 || isempty(residAmp1), residAmp1 = 0.08; end
    if nargin<9 || isempty(residFreq), residFreq = 7; end
    if nargin<10 || isempty(residAmp2), residAmp2 = 0.04; end
    if nargin<11 || isempty(residC), residC = 0.62; end
    if nargin<12 || isempty(residW), residW = 0.010; end

    x = linspace(0,1,N).';
    g1 = g1Amp*exp(-0.5*((x-g1C)/g1W).^2);
    g2 = g2Amp*exp(-0.5*((x-g2C)/g2W).^2);
    resid = residAmp1*sin(2*pi*residFreq*x) + residAmp2*exp(-0.5*((x-residC)/residW).^2);
    f = g1 - g2 + resid;
    meta = struct;
    meta.ID = "TF125";
    meta.Name = "Cancellation Trap";
    meta.Category = 6;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Two similar Gaussians that largely cancel plus residuals";
end

%% Category 8 : 126 - 155

function [x,f,meta] = TF126_MultiScaleSteps(N,levels,baseAmp)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(levels), levels = 5; end
    if nargin<3 || isempty(baseAmp), baseAmp = 0.5; end

    x = linspace(0,1,N).';
    f = baseAmp*zeros(size(x));
    rng(0);
    for k = 1:levels
        c = rand*(1-1/levels) + (k-1)/levels;
        w = 0.02/(2^(k-1));
        a = baseAmp/(2^(k-1));
        f = f + a./(1+exp(-(x-c)/w));
    end
    meta = struct;
    meta.ID = "TF126";
    meta.Name = "Multi-Scale Steps";
    meta.Category = 8;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Superposition of logistic steps at multiple scales";
end

function [x,f,meta] = TF127_NoiseBursts(N,baseFreq,burstCenters,burstAmp,burstW)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(baseFreq), baseFreq = 5; end
    if nargin<3 || isempty(burstCenters), burstCenters = [0.2 0.5 0.75]; end
    if nargin<4 || isempty(burstAmp), burstAmp = [0.6 0.8 0.5]; end
    if nargin<5 || isempty(burstW), burstW = 0.02; end

    x = linspace(0,1,N).';
    f = 0.05*sin(2*pi*baseFreq*x);
    for k = 1:numel(burstCenters)
        env = exp(-0.5*((x-burstCenters(k))/burstW).^2);
        f = f + burstAmp(k)*env.*randn(size(x));
    end
    meta = struct;
    meta.ID = "TF127";
    meta.Name = "Noise Bursts";
    meta.Category = 8;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Low-frequency sine with localized noisy bursts";
end

function [x,f,meta] = TF128_AlternatingPlateaus(N,plateauCenters,plateauHeights,plateauW)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(plateauCenters), plateauCenters = linspace(0.1,0.9,6); end
    if nargin<3 || isempty(plateauHeights), plateauHeights = repmat([0.3 -0.25],1,3); end
    if nargin<4 || isempty(plateauW), plateauW = 0.03; end

    x = linspace(0,1,N).';
    f = zeros(size(x));
    for k = 1:numel(plateauCenters)
        f = f + plateauHeights(k)*tanh((x-plateauCenters(k))/plateauW);
    end
    meta = struct;
    meta.ID = "TF128";
    meta.Name = "Alternating Plateaus";
    meta.Category = 8;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Sequence of alternating signed plateau transitions";
end

function [x,f,meta] = TF129_FractalLikeOsc(N,baseAmp,depth)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(baseAmp), baseAmp = 0.4; end
    if nargin<3 || isempty(depth), depth = 6; end

    x = linspace(0,1,N).';
    f = zeros(size(x));
    for k = 1:depth
        freq = 2^(k-1)*5;
        amp = baseAmp/(2^(k-1));
        phase = rand*2*pi;
        f = f + amp*sin(2*pi*freq*x + phase);
    end
    meta = struct;
    meta.ID = "TF129";
    meta.Name = "Fractal-Like Oscillation";
    meta.Category = 8;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Superposition of harmonics with geometrically decaying amplitude";
end

function [x,f,meta] = TF130_ShadowedPeaks(N,peakCenters,peakAmps,peakW,shadowAmp,shadowShift)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(peakCenters), peakCenters = [0.25 0.5 0.75]; end
    if nargin<3 || isempty(peakAmps), peakAmps = [0.6 0.9 0.5]; end
    if nargin<4 || isempty(peakW), peakW = 0.02; end
    if nargin<5 || isempty(shadowAmp), shadowAmp = -0.25; end
    if nargin<6 || isempty(shadowShift), shadowShift = 0.01; end

    x = linspace(0,1,N).';
    f = zeros(size(x));
    for k = 1:numel(peakCenters)
        p = peakAmps(k)*exp(-0.5*((x-peakCenters(k))/peakW).^2);
        s = shadowAmp*exp(-0.5*((x-(peakCenters(k)+shadowShift))/peakW*2).^2);
        f = f + p + s;
    end
    meta = struct;
    meta.ID = "TF130";
    meta.Name = "Shadowed Peaks";
    meta.Category = 8;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Peaks with slight negative shadows offset to one side";
end

function [x,f,meta] = TF131_EEGSeizureOnset(N,backgroundFreqs,backgroundAmps,seizureEnvCtr,seizureEnvW,seizureAmp,seizurePhaseCoeff,spikeCtr,spikeAmp,postSuppressionCtr,postSuppressionW,postSuppressionAmp)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(backgroundFreqs), backgroundFreqs = [5 9]; end
    if nargin<3 || isempty(backgroundAmps), backgroundAmps = [0.035 0.018]; end
    if nargin<4 || isempty(seizureEnvCtr), seizureEnvCtr = 0.62; end
    if nargin<5 || isempty(seizureEnvW), seizureEnvW = 0.05; end
    if nargin<6 || isempty(seizureAmp), seizureAmp = 0.38; end
    if nargin<7 || isempty(seizurePhaseCoeff), seizurePhaseCoeff = [12 12]; end % linear and quadratic coeffs for phase: a*x + b*x.^2
    if nargin<8 || isempty(spikeCtr), spikeCtr = 0.36; end
    if nargin<9 || isempty(spikeAmp), spikeAmp = 0.18; end
    if nargin<10 || isempty(postSuppressionCtr), postSuppressionCtr = 0.82; end
    if nargin<11 || isempty(postSuppressionW), postSuppressionW = 0.03; end
    if nargin<12 || isempty(postSuppressionAmp), postSuppressionAmp = 0.06; end

    x = linspace(0,1,N).';
    backgroundES = backgroundAmps(1)*sin(2*pi*backgroundFreqs(1)*x) + backgroundAmps(2)*sin(2*pi*backgroundFreqs(2)*x+0.6);
    envES = S(x,seizureEnvCtr,seizureEnvW) - S(x,postSuppressionCtr,postSuppressionW);
    phaseES = 2*pi*(seizurePhaseCoeff(1)*x + seizurePhaseCoeff(2)*x.^2);
    f = backgroundES + seizureAmp*envES.*sin(phaseES) + spikeAmp*exp(-0.5*((x-spikeCtr)/0.008).^2) - postSuppressionAmp*S(x,postSuppressionCtr,postSuppressionW);
    meta = struct;
    meta.ID = "TF131";
    meta.Name = "EEG Seizure Onset";
    meta.Category = 9;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Low-frequency background with localized high‑frequency seizure onset and transient spike";
end

function [x,f,meta] = TF132_MRFreeInductionDecay(N,a1,a2,a3,a4,decay,f1,f2,f3,f4,phases)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(a1), a1 = 0.55; end
    if nargin<3 || isempty(a2), a2 = 0.34; end
    if nargin<4 || isempty(a3), a3 = 0.18; end
    if nargin<5 || isempty(a4), a4 = 0.06; end
    if nargin<6 || isempty(decay), decay = [3.5 7 1.2 0.55]; end
    if nargin<7 || isempty(f1), f1 = [18 31 8 43]; end
    if nargin<8 || isempty(phases), phases = [0 0.3 -0.5 0.8]; end

    x = linspace(0,1,N).';
    f = a1*exp(-decay(1)*x).*cos(2*pi*f1(1)*x + phases(1)) + a2*exp(-decay(2)*x).*cos(2*pi*f1(2)*x + phases(2)) + a3*exp(-decay(3)*x).*cos(2*pi*f1(3)*x + phases(3)) + a4*exp(-decay(4)*x).*cos(2*pi*f1(4)*x + phases(4));
    meta = struct;
    meta.ID = "TF132";
    meta.Name = "MR Free Induction Decay";
    meta.Category = 9;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Sum of damped cosines with different decay rates and frequencies";
end

function [x,f,meta] = TF133_ATACChromatinAccessibility(N,baseline,lfFreq,lfAmp,broadA,ampA,widA,sharpA,ampS,sharpW)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(baseline), baseline = 0.06; end
    if nargin<3 || isempty(lfFreq), lfFreq = 4; end
    if nargin<4 || isempty(lfAmp), lfAmp = 0.018; end
    if nargin<5 || isempty(broadA), broadA = [0.20 0.52 0.77]; end
    if nargin<6 || isempty(ampA), ampA = [0.22 0.30 0.18]; end
    if nargin<7 || isempty(widA), widA = [0.070 0.085 0.060]; end
    if nargin<8 || isempty(sharpA), sharpA = [0.18 0.235 0.49 0.54 0.705 0.79]; end
    if nargin<9 || isempty(ampS), ampS = [0.16 0.12 0.20 0.10 0.08 0.15]; end
    if nargin<10 || isempty(sharpW), sharpW = 0.007; end

    x = linspace(0,1,N).';
    f = baseline + lfAmp*sin(2*pi*lfFreq*x);
    for k = 1:numel(broadA)
        f = f + ampA(k)*exp(-0.5*((x-broadA(k))/widA(k)).^2);
    end
    for k = 1:numel(sharpA)
        f = f + ampS(k)*exp(-0.5*((x-sharpA(k))/sharpW).^2);
    end
    meta = struct;
    meta.ID = "TF133";
    meta.Name = "ATAC Chromatin Accessibility";
    meta.Category = 9;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Broad accessibility humps with sharp narrow peaks";
end

function [x,f,meta] = TF134_WindTurbineGustControl(N,baseline,gustFreq,gustAmp,gustOnset,gustDecay,gustOscFreq,localBumpCtr,localBumpAmp,localBumpW)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(baseline), baseline = 0.25; end
    if nargin<3 || isempty(gustFreq), gustFreq = 6; end
    if nargin<4 || isempty(gustAmp), gustAmp = 0.08; end
    if nargin<5 || isempty(gustOnset), gustOnset = 0.50; end
    if nargin<6 || isempty(gustDecay), gustDecay = 9; end
    if nargin<7 || isempty(gustOscFreq), gustOscFreq = 15; end
    if nargin<8 || isempty(localBumpCtr), localBumpCtr = 0.49; end
    if nargin<9 || isempty(localBumpAmp), localBumpAmp = 0.48; end
    if nargin<10 || isempty(localBumpW), localBumpW = 0.035; end

    x = linspace(0,1,N).';
    uWT = max(x-gustOnset,0);
    f = baseline + gustAmp*sin(2*pi*gustFreq*x) + 0.03*sin(2*pi*18*x) + localBumpAmp*exp(-0.5*((x-localBumpCtr)/localBumpW).^2) + (x>=gustOnset).*0.20.*exp(-gustDecay*uWT).*sin(2*pi*gustOscFreq*uWT) + 0.12*S(x,0.56,0.020);
    meta = struct;
    meta.ID = "TF134";
    meta.Name = "Wind Turbine Gust Control";
    meta.Category = 9;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Baseline with traveling gust-induced decaying oscillation and local bump";
end

function [x,f,meta] = TF135_EVFastCharge(N,baseline,firstStepCtr,firstStepAmp,firstStepW,secondStepCtr,secondStepW,negStepCtr,negStepW,highFreqAmp,highFreqFreq,lateStepCtr,lateStepW)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(baseline), baseline = 0.18; end
    if nargin<3 || isempty(firstStepCtr), firstStepCtr = 0.20; end
    if nargin<4 || isempty(firstStepAmp), firstStepAmp = 0.55; end
    if nargin<5 || isempty(firstStepW), firstStepW = 0.10; end
    if nargin<6 || isempty(secondStepCtr), secondStepCtr = 0.58; end
    if nargin<7 || isempty(secondStepW), secondStepW = 0.035; end
    if nargin<8 || isempty(negStepCtr), negStepCtr = 0.72; end
    if nargin<9 || isempty(negStepW), negStepW = 0.010; end
    if nargin<10 || isempty(highFreqAmp), highFreqAmp = 0.015; end
    if nargin<11 || isempty(highFreqFreq), highFreqFreq = 18; end
    if nargin<12 || isempty(lateStepCtr), lateStepCtr = 0.88; end
    if nargin<13 || isempty(lateStepW), lateStepW = 0.025; end

    x = linspace(0,1,N).';
    f = baseline + firstStepAmp*S(x,firstStepCtr,firstStepW) + 0.22*S(x,secondStepCtr,secondStepW) - 0.12*S(x,negStepCtr,negStepW) + highFreqAmp*sin(2*pi*highFreqFreq*x).*S(x,firstStepCtr,0.03) + 0.07*S(x,lateStepCtr,lateStepW);
    meta = struct;
    meta.ID = "TF135";
    meta.Name = "EV Fast Charge";
    meta.Category = 9;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Step-like charge events with small riding high-frequency component";
end

function [x,f,meta] = TF136_GridInverterOscillation(N,baseline,trendAmp,onset,onsetW,onsetAmp,onsetDecay,onsetFreq,negStepCtr,negStepW)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(baseline), baseline = 0.30; end
    if nargin<3 || isempty(trendAmp), trendAmp = 0.02; end
    if nargin<4 || isempty(onset), onset = 0.30; end
    if nargin<5 || isempty(onsetW), onsetW = 0.006; end
    if nargin<6 || isempty(onsetAmp), onsetAmp = 0.34; end
    if nargin<7 || isempty(onsetDecay), onsetDecay = 5; end
    if nargin<8 || isempty(onsetFreq), onsetFreq = 10; end
    if nargin<9 || isempty(negStepCtr), negStepCtr = 0.64; end
    if nargin<10 || isempty(negStepW), negStepW = 0.010; end

    x = linspace(0,1,N).';
    uGI = max(x-onset,0);
    f = baseline + trendAmp*x + 0.16*S(x,onset,onsetW) + (x>=onset).*onsetAmp.*exp(-onsetDecay*uGI).*sin(2*pi*(onsetFreq*uGI+4*uGI.^2)) - 0.10*S(x,negStepCtr,negStepW);
    meta = struct;
    meta.ID = "TF136";
    meta.Name = "Grid Inverter Oscillation";
    meta.Category = 9;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Onset-triggered decaying nonlinear chirp with baseline step features";
end

function [x,f,meta] = TF137_SatelliteReactionWheel(N,a1,a2,phaseShift1,phaseShift2,localizedCtr,localizedW,localizedAmp,negSpikeCtr,negSpikeW,negSpikeAmp)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(a1), a1 = 0.22; end
    if nargin<3 || isempty(a2), a2 = 0.14; end
    if nargin<4 || isempty(phaseShift1), phaseShift1 = 0; end
    if nargin<5 || isempty(phaseShift2), phaseShift2 = 0.5; end
    if nargin<6 || isempty(localizedCtr), localizedCtr = 0.58; end
    if nargin<7 || isempty(localizedW), localizedW = 0.065; end
    if nargin<8 || isempty(localizedAmp), localizedAmp = 0.20; end
    if nargin<9 || isempty(negSpikeCtr), negSpikeCtr = 0.82; end
    if nargin<10 || isempty(negSpikeW), negSpikeW = 0.008; end
    if nargin<11 || isempty(negSpikeAmp), negSpikeAmp = 0.32; end

    x = linspace(0,1,N).';
    phase1SR = 2*pi*(18*x + 3*x.^2);
    phase2SR = 2*pi*(31*x - 2*x.^2);
    f = a1*sin(phase1SR) + a2*sin(phase2SR+phaseShift2) + localizedAmp*exp(-0.5*((x-localizedCtr)/localizedW).^2).*sin(2*pi*54*x) - negSpikeAmp*exp(-0.5*((x-negSpikeCtr)/negSpikeW).^2);
    meta = struct;
    meta.ID = "TF137";
    meta.Name = "Satellite Reaction Wheel";
    meta.Category = 9;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Multi-component oscillations with localized destructive transient";
end

function [x,f,meta] = TF138_MicrofluidicDropletTrain(N,baseline,cMD,aMD,wMD)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(baseline), baseline = 0.03; end
    if nargin<3 || isempty(cMD), cMD = [0.10 0.20 0.30 0.405 0.435 0.58 0.70 0.82 0.92]; end
    if nargin<4 || isempty(aMD), aMD = [0.45 0.50 0.47 0.44 0.39 0.76 0.12 0.49 0.46]; end
    if nargin<5 || isempty(wMD), wMD = [0.015 0.014 0.016 0.013 0.013 0.030 0.012 0.015 0.014]; end

    x = linspace(0,1,N).';
    f = baseline*ones(size(x));
    for k = 1:numel(cMD)
        f = f + aMD(k)*exp(-0.5*((x-cMD(k))/wMD(k)).^2);
    end
    meta = struct;
    meta.ID = "TF138";
    meta.Name = "Microfluidic Droplet Train";
    meta.Category = 9;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Train of Gaussian droplets on small baseline";
end

function [x,f,meta] = TF139_TerahertzLayerEcho(N,cTHz,aTHz,wTHz,echoOnset,echoAmp,echoFreq,echoDecay)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(cTHz), cTHz = [0.15 0.34 0.50 0.525 0.72 0.88]; end
    if nargin<3 || isempty(aTHz), aTHz = [0.60 0.42 0.50 0.40 0.28 0.11]; end
    if nargin<4 || isempty(wTHz), wTHz = [0.012 0.014 0.010 0.010 0.016 0.012]; end
    if nargin<5 || isempty(echoOnset), echoOnset = 0.72; end
    if nargin<6 || isempty(echoAmp), echoAmp = 0.07; end
    if nargin<7 || isempty(echoFreq), echoFreq = 35; end
    if nargin<8 || isempty(echoDecay), echoDecay = 9; end

    x = linspace(0,1,N).';
    f = zeros(size(x));
    for k = 1:numel(cTHz)
        z = (x-cTHz(k))/wTHz(k);
        f = f + aTHz(k).*z.*exp(-0.5*z.^2);
    end
    uTHz = max(x-echoOnset,0);
    f = f + (x>=echoOnset).*echoAmp.*exp(-echoDecay*uTHz).*sin(2*pi*echoFreq*uTHz);

    meta = struct;
    meta.ID = "TF139";
    meta.Name = "Terahertz Layer Echo";
    meta.Category = 9;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Layered dispersive responses with a trailing high‑frequency echo";
end

function [x,f,meta] = TF140_BridgeStrainEvent(N,baseline,trendAmp,trendSlope,bumpCenters,bumpAmp,bumpW,eventOnset,eventStep,eventOscAmp,eventOscFreq,eventDecay)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(baseline), baseline = 0.18; end
    if nargin<3 || isempty(trendAmp), trendAmp = 0.16; end
    if nargin<4 || isempty(trendSlope), trendSlope = 0.16; end
    if nargin<5 || isempty(bumpCenters), bumpCenters = [0.18 0.34 0.52 0.76]; end
    if nargin<6 || isempty(bumpAmp), bumpAmp = 0.16; end
    if nargin<7 || isempty(bumpW), bumpW = 0.025; end
    if nargin<8 || isempty(eventOnset), eventOnset = 0.62; end
    if nargin<9 || isempty(eventStep), eventStep = 0.10; end
    if nargin<10 || isempty(eventOscAmp), eventOscAmp = 0.10; end
    if nargin<11 || isempty(eventOscFreq), eventOscFreq = 28; end
    if nargin<12 || isempty(eventDecay), eventDecay = 12; end

    x = linspace(0,1,N).';
    f = baseline + trendAmp*x + 0.05*sin(2*pi*1.5*x);
    for c = bumpCenters
        f = f + bumpAmp*exp(-0.5*((x-c)/bumpW).^2);
    end
    u = max(x-eventOnset,0);
    f = f + eventStep*S(x,eventOnset,0.004) + (x>=eventOnset).*eventOscAmp.*exp(-eventDecay*u).*sin(2*pi*eventOscFreq*u);

    meta = struct;
    meta.ID = "TF140";
    meta.Name = "Bridge Strain Event";
    meta.Category = 9;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Baseline trend with localized bumps and a decaying post-event oscillation";
end

function [x,f,meta] = TF141_MishMashAlpha(N,linAmp,sleepAmp,sleepCtr,sleepW,sqrtCtr,expCtr,expW,sinCoeffs)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(linAmp), linAmp = 0.18; end
    if nargin<3 || isempty(sleepAmp), sleepAmp = 0.25; end
    if nargin<4 || isempty(sleepCtr), sleepCtr = 0.68; end
    if nargin<5 || isempty(sleepW), sleepW = 0.004; end
    if nargin<6 || isempty(sqrtCtr), sqrtCtr = 0.27; end
    if nargin<7 || isempty(expCtr), expCtr = 0.48; end
    if nargin<8 || isempty(expW), expW = 0.012; end
    if nargin<9 || isempty(sinCoeffs), sinCoeffs = [7 18 0.18]; end

    x = linspace(0,1,N).';
    f = linAmp*x + sleepAmp*S(x,sleepCtr,sleepW) + 0.32*sqrt(abs(x-sqrtCtr)) + 0.22*exp(-0.5*((x-expCtr)/expW).^2) + 0.18*sin(2*pi*(sinCoeffs(1)*x+sinCoeffs(2)*x.^2));
    meta = struct;
    meta.ID = "TF141";
    meta.Name = "MishMash Alpha";
    meta.Category = 9;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Combination of trends, localized pulse and chirped oscillation";
end

function [x,f,meta] = TF142_MishMashBeta(N,sin1Amp,cos1Amp,sqrtAmp,sqrtOffset,sinFreqOffset,stepCtr1,stepW1,negSpikeCtr,negSpikeW,tailCtr,tailW)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(sin1Amp), sin1Amp = 0.22; end
    if nargin<3 || isempty(cos1Amp), cos1Amp = 0.10; end
    if nargin<4 || isempty(sqrtAmp), sqrtAmp = 0.14; end
    if nargin<5 || isempty(sqrtOffset), sqrtOffset = 0.02; end
    if nargin<6 || isempty(sinFreqOffset), sinFreqOffset = 1.15; end
    if nargin<7 || isempty(stepCtr1), stepCtr1 = 0.38; end
    if nargin<8 || isempty(stepW1), stepW1 = 0.008; end
    if nargin<9 || isempty(negSpikeCtr), negSpikeCtr = 0.73; end
    if nargin<10 || isempty(negSpikeW), negSpikeW = 0.005; end
    if nargin<11 || isempty(tailCtr), tailCtr = 0.82; end
    if nargin<12 || isempty(tailW), tailW = 0.025; end

    x = linspace(0,1,N).';
    u = max(x,sqrtOffset);
    f = sin1Amp*sin(2*pi*3*x) + cos1Amp*cos(2*pi*5*x) + sqrtAmp*sqrt(u.*(1-u)).*sin(2*pi*sinFreqOffset./(u+0.05)) + 0.20*(S(x,stepCtr1,stepW1)-S(x,0.60,0.008)) - 0.30*exp(-0.5*((x-negSpikeCtr)/negSpikeW).^2) + 0.09*exp(-0.5*((x-tailCtr)/tailW).^2);
    meta = struct;
    meta.ID = "TF142";
    meta.Name = "MishMash Beta";
    meta.Category = 9;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Dense mixture of oscillations, nonlinear amplitude modulation and localized features";
end

function [x,f,meta] = TF143_DoubletOnCliff(N,cliffAmp,cliffCtr,cliffW,peak1Amp,peak1Ctr,peak1W,peak2Amp,peak2Ctr,peak2W)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(cliffAmp), cliffAmp = 0.75; end
    if nargin<3 || isempty(cliffCtr), cliffCtr = 0.53; end
    if nargin<4 || isempty(cliffW), cliffW = 0.015; end
    if nargin<5 || isempty(peak1Amp), peak1Amp = 0.28; end
    if nargin<6 || isempty(peak1Ctr), peak1Ctr = 0.505; end
    if nargin<7 || isempty(peak1W), peak1W = 0.008; end
    if nargin<8 || isempty(peak2Amp), peak2Amp = 0.24; end
    if nargin<9 || isempty(peak2Ctr), peak2Ctr = 0.548; end
    if nargin<10 || isempty(peak2W), peak2W = 0.008; end

    x = linspace(0,1,N).';
    f = cliffAmp*S(x,cliffCtr,cliffW) + peak1Amp*exp(-0.5*((x-peak1Ctr)/peak1W).^2) + peak2Amp*exp(-0.5*((x-peak2Ctr)/peak2W).^2);
    meta = struct;
    meta.ID = "TF143";
    meta.Name = "Doublet on Cliff";
    meta.Category = 9;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Step-like cliff with two nearby localized peaks";
end

function [x,f,meta] = TF144_NeedleInChirp(N,envAmp,envSlope,chirpAmp,needleAmp,needleCtr,needleW)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(envAmp), envAmp = 0.65; end
    if nargin<3 || isempty(envSlope), envSlope = 0.35; end % combined with envAmp to match original scale
    if nargin<4 || isempty(chirpAmp), chirpAmp = 0.34; end
    if nargin<5 || isempty(needleAmp), needleAmp = 0.11; end
    if nargin<6 || isempty(needleCtr), needleCtr = 0.72; end
    if nargin<7 || isempty(needleW), needleW = 0.003; end

    x = linspace(0,1,N).';
    f = (envAmp+envSlope*x).*chirpAmp.*sin(2*pi*(8*x+26*x.^2)) + needleAmp*exp(-0.5*((x-needleCtr)/needleW).^2);
    meta = struct;
    meta.ID = "TF144";
    meta.Name = "Needle in Chirp";
    meta.Category = 9;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Chirped oscillation with a sharp localized spike";
end

function [x,f,meta] = TF145_DerivativeZoo(N,linAmp,stepCtr,stepW,absCtr,quadAmp,quadCtr,sqrtAmp,sqrtCtr,gaussAmp,gaussCtr,gaussW)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(linAmp), linAmp = 0.10; end
    if nargin<3 || isempty(stepCtr), stepCtr = 0.18; end
    if nargin<4 || isempty(stepW), stepW = 0.0025; end
    if nargin<5 || isempty(absCtr), absCtr = 0.36; end
    if nargin<6 || isempty(quadAmp), quadAmp = 0.18; end
    if nargin<7 || isempty(quadCtr), quadCtr = 0.55; end
    if nargin<8 || isempty(sqrtAmp), sqrtAmp = 0.25; end
    if nargin<9 || isempty(sqrtCtr), sqrtCtr = 0.72; end
    if nargin<10 || isempty(gaussAmp), gaussAmp = 0.16; end
    if nargin<11 || isempty(gaussCtr), gaussCtr = 0.88; end
    if nargin<12 || isempty(gaussW), gaussW = 0.025; end

    x = linspace(0,1,N).';
    f = linAmp*x + 0.28*S(x,stepCtr,stepW) + 0.35*abs(x-absCtr) + quadAmp*(x-quadCtr).^2.*(x>=quadCtr) + sqrtAmp*sqrt(abs(x-sqrtCtr)) + gaussAmp*exp(-0.5*((x-gaussCtr)/gaussW).^2);
    meta = struct;
    meta.ID = "TF145";
    meta.Name = "Derivative Zoo";
    meta.Category = 9;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Mixture of features designed to provoke varied derivative behavior";
end

function [x,f,meta] = TF146_MultiscaleComb(N,peakAmp1,peakW1,peakAmp2,peakW2,spikeAmp,spikeW)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(peakAmp1), peakAmp1 = 0.25; end
    if nargin<3 || isempty(peakW1), peakW1 = 0.030; end
    if nargin<4 || isempty(peakAmp2), peakAmp2 = 0.16; end
    if nargin<5 || isempty(peakW2), peakW2 = 0.010; end
    if nargin<6 || isempty(spikeAmp), spikeAmp = 0.07; end
    if nargin<7 || isempty(spikeW), spikeW = 0.003; end

    x = linspace(0,1,N).';
    f = zeros(size(x));
    for c = 0.10:0.20:0.90, f = f + peakAmp1*exp(-0.5*((x-c)/peakW1).^2); end
    for c = 0.15:0.10:0.95, f = f + peakAmp2*exp(-0.5*((x-c)/peakW2).^2); end
    cs = 0.18:0.05:0.93;
    for k = 1:numel(cs), f = f + spikeAmp*(-1)^k*exp(-0.5*((x-cs(k))/spikeW).^2); end
    meta = struct;
    meta.ID = "TF146";
    meta.Name = "Multiscale Comb";
    meta.Category = 9;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Comb of peaks at several scales with alternating polarity fine spikes";
end

function [x,f,meta] = TF147_FrequencyCrossing(N,envAmp,envCtr,envW,ampUp,ampDn)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(envAmp), envAmp = 0.75; end
    if nargin<3 || isempty(envCtr), envCtr = 0.50; end
    if nargin<4 || isempty(envW), envW = 0.30; end
    if nargin<5 || isempty(ampUp), ampUp = 0.25; end
    if nargin<6 || isempty(ampDn), ampDn = 0.25; end

    x = linspace(0,1,N).';
    phiUp = 2*pi*(8*x + 20*x.^2);
    phiDn = 2*pi*(28*x - 20*x.^2);
    f = (envAmp+ (1-envAmp)*exp(-0.5*((x-envCtr)/envW).^2)).*(ampUp*sin(phiUp)+ampDn*sin(phiDn+0.35));
    meta = struct;
    meta.ID = "TF147";
    meta.Name = "Frequency Crossing";
    meta.Category = 9;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Two crossing instantaneous frequency components with amplitude windowing";
end

function [x,f,meta] = TF148_PhaseResetBurst(N,phaseModAmp,phaseModCtr,phaseModW,burstAmp,burstCtr,burstW,burstFreq)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(phaseModAmp), phaseModAmp = 0.95; end
    if nargin<3 || isempty(phaseModCtr), phaseModCtr = 0.48; end
    if nargin<4 || isempty(phaseModW), phaseModW = 0.003; end
    if nargin<5 || isempty(burstAmp), burstAmp = 0.20; end
    if nargin<6 || isempty(burstCtr), burstCtr = 0.67; end
    if nargin<7 || isempty(burstW), burstW = 0.035; end
    if nargin<8 || isempty(burstFreq), burstFreq = 70; end

    x = linspace(0,1,N).';
    f = 0.28*sin(2*pi*18*x + phaseModAmp*S(x,phaseModCtr,phaseModW)) + burstAmp*exp(-0.5*((x-burstCtr)/burstW).^2).*sin(2*pi*burstFreq*x);
    meta = struct;
    meta.ID = "TF148";
    meta.Name = "Phase Reset Burst";
    meta.Category = 9;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "High-frequency burst plus a phase-resetting component";
end

function [x,f,meta] = TF149_LacunaryCascade(N,cLC,baseAmp,ampDecay,baseWid,widDecay,baseline)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(cLC), cLC = [0.18 0.37 0.52 0.63 0.71 0.77 0.815 0.848 0.872 0.890]; end
    if nargin<3 || isempty(baseAmp), baseAmp = 0.30; end
    if nargin<4 || isempty(ampDecay), ampDecay = 0.87; end
    if nargin<5 || isempty(baseWid), baseWid = 0.025; end
    if nargin<6 || isempty(widDecay), widDecay = 0.70; end
    if nargin<7 || isempty(baseline), baseline = 0.02; end

    x = linspace(0,1,N).';
    f = baseline*ones(size(x));
    for k = 1:numel(cLC)
        amp = baseAmp*(ampDecay^(k-1));
        wid = baseWid*(widDecay^(k-1));
        f = f + amp*(-1)^(k+1)*exp(-0.5*((x-cLC(k))/wid).^2);
    end
    meta = struct;
    meta.ID = "TF149";
    meta.Name = "Lacunary Cascade";
    meta.Category = 9;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Cascade of alternating-signed Gaussians with geometrically changing scale";
end

function [x,f,meta] = TF150_SmoothRoughSmooth(N,leftBase,leftAmp,leftFreq,roughAmp1,roughAmp2,roughAmp3,roughFreq1,roughFreq2,roughFreq3,rightBase,rightAmp,rightFreq,win1,win2)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(leftBase), leftBase = 0.20; end
    if nargin<3 || isempty(leftAmp), leftAmp = 0.22; end
    if nargin<4 || isempty(leftFreq), leftFreq = 2; end
    if nargin<5 || isempty(roughAmp1), roughAmp1 = 0.16; end
    if nargin<6 || isempty(roughAmp2), roughAmp2 = 0.08; end
    if nargin<7 || isempty(roughAmp3), roughAmp3 = 0.04; end
    if nargin<8 || isempty(roughFreq1), roughFreq1 = 17; end
    if nargin<9 || isempty(roughFreq2), roughFreq2 = 41; end
    if nargin<10 || isempty(roughFreq3), roughFreq3 = 91; end
    if nargin<11 || isempty(rightBase), rightBase = 0.20; end
    if nargin<12 || isempty(rightAmp), rightAmp = 0.18; end
    if nargin<13 || isempty(rightFreq), rightFreq = 2; end
    if nargin<14 || isempty(win1), win1 = 0.33; end
    if nargin<15 || isempty(win2), win2 = 0.68; end

    x = linspace(0,1,N).';
    leftSRS = leftBase + leftAmp*sin(2*pi*leftFreq*x);
    roughWindow = S(x,win1,0.008)-S(x,win2,0.008);
    roughSRS = roughAmp1*sin(2*pi*roughFreq1*x)+roughAmp2*sin(2*pi*roughFreq2*x+0.3)+roughAmp3*sin(2*pi*roughFreq3*x-0.2);
    rightSRS = rightBase + rightAmp*cos(2*pi*rightFreq*(x-win2));
    f = leftSRS.*(1-S(x,win1,0.008)) + roughWindow.*(0.20+roughSRS) + rightSRS.*S(x,win2,0.008);
    meta = struct;
    meta.ID = "TF150";
    meta.Name = "Smooth Rough Smooth";
    meta.Category = 9;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Transition from smooth to rough oscillations and back";
end

function [x,f,meta] = TF151_PeakOnPeak(N,amp1,ctr1,wid1,amp2,ctr2,wid2,amp3,ctr3,wid3,invAmp,invCtr,invWid)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(amp1), amp1 = 0.75; end
    if nargin<3 || isempty(ctr1), ctr1 = 0.50; end
    if nargin<4 || isempty(wid1), wid1 = 0.18; end
    if nargin<5 || isempty(amp2), amp2 = 0.26; end
    if nargin<6 || isempty(ctr2), ctr2 = 0.58; end
    if nargin<7 || isempty(wid2), wid2 = 0.060; end
    if nargin<8 || isempty(amp3), amp3 = 0.22; end
    if nargin<9 || isempty(ctr3), ctr3 = 0.605; end
    if nargin<10 || isempty(wid3), wid3 = 0.015; end
    if nargin<11 || isempty(invAmp), invAmp = -0.10; end
    if nargin<12 || isempty(invCtr), invCtr = 0.610; end
    if nargin<13 || isempty(invWid), invWid = 0.0035; end

    x = linspace(0,1,N).';
    f = amp1*exp(-0.5*((x-ctr1)/wid1).^2) + amp2*exp(-0.5*((x-ctr2)/wid2).^2) + amp3*exp(-0.5*((x-ctr3)/wid3).^2) + invAmp*exp(-0.5*((x-invCtr)/invWid).^2);
    meta = struct;
    meta.ID = "TF151";
    meta.Name = "Peak on Peak";
    meta.Category = 9;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Nested peaks with a small inverted spike near the summit";
end

function [x,f,meta] = TF152_FalseFlat(N,ampL,ctrL,widL,ampR,ctrR,widR,oscAmp,oscFreq,stepAmp,stepWin1,stepWin2)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(ampL), ampL = 0.55; end
    if nargin<3 || isempty(ctrL), ctrL = 0.17; end
    if nargin<4 || isempty(widL), widL = 0.09; end
    if nargin<5 || isempty(ampR), ampR = 0.62; end
    if nargin<6 || isempty(ctrR), ctrR = 0.84; end
    if nargin<7 || isempty(widR), widR = 0.08; end
    if nargin<8 || isempty(oscAmp), oscAmp = 0.035; end
    if nargin<9 || isempty(oscFreq), oscFreq = 19; end
    if nargin<10 || isempty(stepAmp), stepAmp = 0.045; end
    if nargin<11 || isempty(stepWin1), stepWin1 = 0.49; end
    if nargin<12 || isempty(stepWin2), stepWin2 = 0.60; end

    x = linspace(0,1,N).';
    f = ampL*exp(-0.5*((x-ctrL)/widL).^2) + ampR*exp(-0.5*((x-ctrR)/widR).^2) + oscAmp*sin(2*pi*oscFreq*x).*(S(x,0.35,0.02)-S(x,0.66,0.02)) + stepAmp*(S(x,stepWin1,0.003)-S(x,stepWin2,0.003));
    meta = struct;
    meta.ID = "TF152";
    meta.Name = "False Flat";
    meta.Category = 9;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Apparent flat regions containing localized high-frequency and tiny step features";
end

function [x,f,meta] = TF153_SymmetryBreak(N,mainAmp,mainCtr,mainWid,cosAmp,cosFreq,pertAmp,pertCtr,pertWid)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(mainAmp), mainAmp = 0.58; end
    if nargin<3 || isempty(mainCtr), mainCtr = 0.50; end
    if nargin<4 || isempty(mainWid), mainWid = 0.18; end
    if nargin<5 || isempty(cosAmp), cosAmp = 0.15; end
    if nargin<6 || isempty(cosFreq), cosFreq = 4; end
    if nargin<7 || isempty(pertAmp), pertAmp = 0.055; end
    if nargin<8 || isempty(pertCtr), pertCtr = 0.635; end
    if nargin<9 || isempty(pertWid), pertWid = 0.009; end

    x = linspace(0,1,N).';
    f = mainAmp*exp(-0.5*((x-mainCtr)/mainWid).^2) + cosAmp*cos(2*pi*cosFreq*(x-mainCtr)) + pertAmp*exp(-0.5*((x-pertCtr)/pertWid).^2);
    meta = struct;
    meta.ID = "TF153";
    meta.Name = "Symmetry Break";
    meta.Category = 9;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Nearly symmetric bump with a small asymmetric perturbation";
end

function [x,f,meta] = TF154_CompressionStorm(N,baseline,cCS,baseWid,widDecay,baseAmp,ampDecay,chirpAmp,chirpPhase)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(baseline), baseline = 0.05; end
    if nargin<3 || isempty(cCS), cCS = [0.18 0.36 0.52 0.64 0.73 0.795 0.842 0.876 0.902 0.922 0.938]; end
    if nargin<4 || isempty(baseWid), baseWid = 0.025; end
    if nargin<5 || isempty(widDecay), widDecay = 0.76; end
    if nargin<6 || isempty(baseAmp), baseAmp = 0.24; end
    if nargin<7 || isempty(ampDecay), ampDecay = 0.93; end
    if nargin<8 || isempty(chirpAmp), chirpAmp = 0.12; end
    if nargin<9 || isempty(chirpPhase), chirpPhase = 0; end

    x = linspace(0,1,N).';
    f = baseline*ones(size(x));
    for k = 1:numel(cCS)
        wid = baseWid*(widDecay^(k-1));
        amp = baseAmp*(ampDecay^(k-1));
        f = f + amp*(-1)^(k+1)*exp(-0.5*((x-cCS(k))/wid).^2);
    end
    f = f + chirpAmp*x.^2.*sin(2*pi*(6*x+45*x.^3) + chirpPhase);
    meta = struct;
    meta.ID = "TF154";
    meta.Name = "Compression Storm";
    meta.Category = 9;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Sequence of alternating Gaussians with compressing width and chirped modulation";
end

function [x,f,meta] = TF155_GrandMishMash(N,linA,logA,rootA,stepA1,stepW1,stepA2,stepW2,negStepA,negStepW,peakA1,peakCtr1,peakWid1,peakA2,peakCtr2,peakWid2,negPeakA,negPeakCtr,negPeakWid,oscA,oscPhaseA,oscWin1,oscWin2,hiOscA,hiOscCtr,hiOscWid,peakA3,peakCtr3,peakWid3,negPeakA2,negPeakCtr2,negPeakWid2,spikeA,spikeCtr,spikeWid)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    if nargin<2 || isempty(linA), linA = 0.12; end
    if nargin<3 || isempty(logA), logA = 0.08; end
    if nargin<4 || isempty(rootA), rootA = 0.18; end
    if nargin<5 || isempty(stepA1), stepA1 = 0.16; end
    if nargin<6 || isempty(stepW1), stepW1 = 0.006; end
    if nargin<7 || isempty(stepA2), stepA2 = 0.08; end
    if nargin<8 || isempty(stepW2), stepW2 = 0.006; end
    if nargin<9 || isempty(negStepA), negStepA = 0.18; end
    if nargin<10 || isempty(negStepW), negStepW = 0.003; end
    if nargin<11 || isempty(peakA1), peakA1 = 0.26; end
    if nargin<12 || isempty(peakCtr1), peakCtr1 = 0.50; end
    if nargin<13 || isempty(peakWid1), peakWid1 = 0.010; end
    if nargin<14 || isempty(peakA2), peakA2 = 0.21; end
    if nargin<15 || isempty(peakCtr2), peakCtr2 = 0.527; end
    if nargin<16 || isempty(peakWid2), peakWid2 = 0.008; end
    if nargin<17 || isempty(negPeakA), negPeakA = 0.13; end
    if nargin<18 || isempty(negPeakCtr), negPeakCtr = 0.575; end
    if nargin<19 || isempty(negPeakWid), negPeakWid = 0.005; end
    if nargin<20 || isempty(oscA), oscA = 0.13; end
    if nargin<21 || isempty(oscPhaseA), oscPhaseA = 0; end
    if nargin<22 || isempty(oscWin1), oscWin1 = 0.60; end
    if nargin<23 || isempty(oscWin2), oscWin2 = 0.78; end
    if nargin<24 || isempty(hiOscA), hiOscA = 0.16; end
    if nargin<25 || isempty(hiOscCtr), hiOscCtr = 0.80; end
    if nargin<26 || isempty(hiOscWid), hiOscWid = 0.045; end
    if nargin<27 || isempty(peakA3), peakA3 = 0.28; end
    if nargin<28 || isempty(peakCtr3), peakCtr3 = 0.885; end
    if nargin<29 || isempty(peakWid3), peakWid3 = 0.035; end
    if nargin<30 || isempty(negPeakA2), negPeakA2 = 0.26; end
    if nargin<31 || isempty(negPeakCtr2), negPeakCtr2 = 0.895; end
    if nargin<32 || isempty(negPeakWid2), negPeakWid2 = 0.037; end
    if nargin<33 || isempty(spikeA), spikeA = 0.09; end
    if nargin<34 || isempty(spikeCtr), spikeCtr = 0.955; end
    if nargin<35 || isempty(spikeWid), spikeWid = 0.0028; end

    x = linspace(0,1,N).';
    f = linA*x + logA*log(1+6*x) + rootA*sqrt(abs(x-0.16));
    f = f + stepA1*(S(x,0.24,stepW1)-S(x,0.36,stepW2)) - negStepA*S(x,0.43,negStepW);
    f = f + peakA1*exp(-0.5*((x-peakCtr1)/peakWid1).^2) + peakA2*exp(-0.5*((x-peakCtr2)/peakWid2).^2) - negPeakA*exp(-0.5*((x-negPeakCtr)/negPeakWid).^2);
    f = f + oscA*sin(2*pi*(8*x+24*x.^2) + oscPhaseA).*(S(x,oscWin1,0.02)-S(x,oscWin2,0.02));
    f = f + hiOscA*exp(-0.5*((x-hiOscCtr)/hiOscWid).^2).*sin(2*pi*55*x);
    f = f + peakA3*exp(-0.5*((x-peakCtr3)/peakWid3).^2) - negPeakA2*exp(-0.5*((x-negPeakCtr2)/negPeakWid2).^2) + spikeA*exp(-0.5*((x-spikeCtr)/spikeWid).^2);
    meta = struct;
    meta.ID = "TF155";
    meta.Name = "Grand MishMash";
    meta.Category = 9;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Highly composite signal combining trends, localized peaks, oscillations and fine spikes";
end

%% Category 9: 156 - 180

function [x,f,meta] = TF156_RiemannShockFan(N, xBreak1, xBreak2, xBreak3, xBreak4, v1, v2, v3, v4, v5)
    if nargin<1 || isempty(N), N = 1024; end
    if nargin<2 || isempty(xBreak1), xBreak1 = 0.18; end
    if nargin<3 || isempty(xBreak2), xBreak2 = 0.40; end
    if nargin<4 || isempty(xBreak3), xBreak3 = 0.58; end
    if nargin<5 || isempty(xBreak4), xBreak4 = 0.76; end
    if nargin<6 || isempty(v1), v1 = 1.00; end
    if nargin<7 || isempty(v2), v2 = 1.00; end
    if nargin<8 || isempty(v3), v3 = 0.62; end
    if nargin<9 || isempty(v4), v4 = 0.40; end
    if nargin<10 || isempty(v5), v5 = 0.08; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    f = zeros(size(x));
    m1 = x < xBreak1;
    m2 = x >= xBreak1 & x < xBreak2;
    m3 = x >= xBreak2 & x < xBreak3;
    m4 = x >= xBreak3 & x < xBreak4;
    m5 = x >= xBreak4;
    f(m1) = v1;
    % linear ramp between xBreak1 and xBreak2 from v2 at left to v3 at right
    f(m2) = v2 - (v2-v3)*(x(m2)-xBreak1)/(xBreak2-xBreak1);
    f(m3) = v3;
    f(m4) = v4;
    f(m5) = v5;
    meta = struct;
    meta.ID = "TF156";
    meta.Name = "Riemann Shock Fan";
    meta.Category = 9;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Piecewise constant with a linear ramp (shock and fan)";
end

function [x,f,meta] = TF157_DispersiveHydraulicJump(N, stepCtr, stepWidth, baseA, linA, stepA, oscA, oscDecay, oscPhase)
    if nargin<1 || isempty(N), N = 1024; end
    if nargin<2 || isempty(stepCtr), stepCtr = 0.34; end
    if nargin<3 || isempty(stepWidth), stepWidth = 0.006; end
    if nargin<4 || isempty(baseA), baseA = 0.12; end
    if nargin<5 || isempty(linA), linA = 0.07; end
    if nargin<6 || isempty(stepA), stepA = 0.64; end
    if nargin<7 || isempty(oscA), oscA = 0.22; end
    if nargin<8 || isempty(oscDecay), oscDecay = 7.5; end
    if nargin<9 || isempty(oscPhase), oscPhase = 0; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    uDH = max(x-stepCtr,0);
    f = baseA + linA*x + stepA*S(x,stepCtr,stepWidth);
    f = f + (x>=stepCtr).*oscA.*exp(-oscDecay*uDH).*sin(2*pi*(17*uDH + 12*uDH.^2) + oscPhase);
    meta = struct;
    meta.ID = "TF157";
    meta.Name = "Dispersive Hydraulic Jump";
    meta.Category = 9;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Step with decaying oscillatory wake";
end

function [x,f,meta] = TF158_XAFSEdge(N, edgeCtr, edgeWidth, baseA, linA, stepA, oscA, oscDecay, oscPhase)
    if nargin<1 || isempty(N), N = 1024; end
    if nargin<2 || isempty(edgeCtr), edgeCtr = 0.34; end
    if nargin<3 || isempty(edgeWidth), edgeWidth = 0.004; end
    if nargin<4 || isempty(baseA), baseA = 0.08; end
    if nargin<5 || isempty(linA), linA = 0.10; end
    if nargin<6 || isempty(stepA), stepA = 0.72; end
    if nargin<7 || isempty(oscA), oscA = 0.16; end
    if nargin<8 || isempty(oscDecay), oscDecay = 2.6; end
    if nargin<9 || isempty(oscPhase), oscPhase = 0; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    u = max(x-edgeCtr,0);
    f = baseA + linA*x + stepA*S(x,edgeCtr,edgeWidth);
    f = f + (x>=edgeCtr).*oscA.*exp(-oscDecay*u).*sin(2*pi*(12*u + 18*u.^2) + oscPhase);
    meta = struct;
    meta.ID = "TF158";
    meta.Name = "XAFS Edge";
    meta.Category = 9;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Edge with decaying chirped oscillations";
end

function [x,f,meta] = TF159_QuantumHallPlateaus(N, baseA, cQH, aQH, wQH)
    if nargin<1 || isempty(N), N = 1024; end
    if nargin<2 || isempty(baseA), baseA = 0.10; end
    if nargin<3 || isempty(cQH), cQH = [0.13 0.27 0.41 0.57 0.73 0.87]; end
    if nargin<4 || isempty(aQH), aQH = [0.14 0.16 0.18 0.17 0.15 0.12]; end
    if nargin<5 || isempty(wQH), wQH = [0.004 0.004 0.005 0.004 0.005 0.004]; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    f = baseA*ones(size(x));
    for k = 1:numel(cQH)
        f = f + aQH(k)*S(x,cQH(k),wQH(k));
    end
    f = f + 0.025*exp(-2.4*x).*sin(2*pi*(11*x+8*x.^2)).*(1-S(x,0.58,0.025));
    meta = struct;
    meta.ID = "TF159";
    meta.Name = "Quantum Hall Plateaus";
    meta.Category = 9;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Plateaus with narrow transitions and residual oscillation";
end

function [x,f,meta] = TF160_FresnelOccultation(N, baseA, cFO, sgnFO)
    if nargin<1 || isempty(N), N = 1024; end
    if nargin<2 || isempty(baseA), baseA = 1.0; end
    if nargin<3 || isempty(cFO), cFO = [0.35 0.68]; end
    if nargin<4 || isempty(sgnFO), sgnFO = [1 -1]; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    f = baseA - 0.82*(S(x,cFO(1),0.004)-S(x,cFO(2),0.004));
    for k = 1:numel(cFO)
        u = x-cFO(k);
        f = f + sgnFO(k)*0.15*exp(-0.5*(u/0.052).^2).*sin(2*pi*(16*u + 55*u.*abs(u)));
    end
    meta = struct;
    meta.ID = "TF160";
    meta.Name = "Fresnel Occultation";
    meta.Category = 9;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Occultation step with localized nonlinear oscillations";
end

function [x,f,meta] = TF161_CapnogramBreaths(N, startsCB)
    if nargin<1 || isempty(N), N = 1024; end
    if nargin<2 || isempty(startsCB), startsCB = [0.01 0.205 0.400 0.595 0.790]; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    f = zeros(size(x));
    for k = 1:numel(startsCB)
        rise = startsCB(k)+0.045;
        fall = startsCB(k)+0.145;
        gate = S(x,rise,0.0035)-S(x,fall,0.0035);
        slope = 0.80 + 0.12*(x-rise)/(fall-rise);
        if k == 4
            slope = 0.70 + 0.34*(x-rise)/(fall-rise);
        end
        f = f + gate.*slope;
    end
    f = f - 0.12*exp(-0.5*((x-0.685)/0.009).^2);
    meta = struct;
    meta.ID = "TF161";
    meta.Name = "Capnogram Breaths";
    meta.Category = 9;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Series of breaths modeled with gated rises and falls";
end

function [x,f,meta] = TF162_DiffusionMRIIVIM(N, A1, k1, A2, k2)
    if nargin<1 || isempty(N), N = 1024; end
    if nargin<2 || isempty(A1), A1 = 0.12; end
    if nargin<3 || isempty(k1), k1 = 15; end
    if nargin<4 || isempty(A2), A2 = 0.88; end
    if nargin<5 || isempty(k2), k2 = 2.15; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    f = A1*exp(-k1*x) + A2*exp(-k2*x);
    meta = struct;
    meta.ID = "TF162";
    meta.Name = "Diffusion MRI IVIM";
    meta.Category = 9;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Sum of two decaying exponentials";
end

function [x,f,meta] = TF163_AuditoryBrainstemResponse(N, muABR, aABR, wABR)
    if nargin<1 || isempty(N), N = 1024; end
    if nargin<2 || isempty(muABR), muABR = [0.18 0.27 0.36 0.47 0.58 0.69 0.79]; end
    if nargin<3 || isempty(aABR),  aABR  = [0.18 0.15 0.24 0.19 0.31 0.13 0.10]; end
    if nargin<4 || isempty(wABR),  wABR  = [0.010 0.012 0.011 0.013 0.014 0.015 0.016]; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    f = zeros(size(x));
    for k = 1:numel(muABR)
        f = f + aABR(k)*exp(-0.5*((x-muABR(k))/wABR(k)).^2) - 0.52*aABR(k)*exp(-0.5*((x-(muABR(k)-0.020))/(1.15*wABR(k))).^2);
    end
    f = f + 0.03*exp(-0.5*((x-0.10)/0.006).^2);
    meta = struct;
    meta.ID = "TF163";
    meta.Name = "Auditory Brainstem Response";
    meta.Category = 9;
    meta.RecommendedN = 1024;
    meta.Parameters = struct('muABR',muABR,'aABR',aABR,'wABR',wABR);
    meta.Morphology = "Sequence of positive peaks each followed by a smaller negative component";
end

function [x,f,meta] = TF164_TWaveAlternans(N, rTA, tAmpTA)
    if nargin<1 || isempty(N), N = 1024; end
    if nargin<2 || isempty(rTA), rTA = [0.11 0.305 0.500 0.695 0.890]; end
    if nargin<3 || isempty(tAmpTA), tAmpTA = [0.30 0.270 0.30 0.270 0.30]; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    f = zeros(size(x));
    for k = 1:numel(rTA)
        rc = rTA(k);
        f = f + 0.12*exp(-0.5*((x-(rc-0.060))/0.018).^2) ...
              - 0.14*exp(-0.5*((x-(rc-0.012))/0.0050).^2) ...
              + 1.00*exp(-0.5*((x-rc)/0.0042).^2) ...
              - 0.25*exp(-0.5*((x-(rc+0.012))/0.0060).^2) ...
              + tAmpTA(k)*exp(-0.5*((x-(rc+0.070))/0.027).^2);
    end
    meta = struct;
    meta.ID = "TF164";
    meta.Name = "T-Wave Alternans";
    meta.Category = 9;
    meta.RecommendedN = 1024;
    meta.Parameters = struct('rTA',rTA,'tAmpTA',tAmpTA);
    meta.Morphology = "Alternating T-wave patterns with multi-component shapes";
end

function [x,f,meta] = TF165_TurbulenceIntermittency(N, phaseTI)
    if nargin<1 || isempty(N), N = 1024; end
    if nargin<2 || isempty(phaseTI), phaseTI = [0.2 1.1 2.0 0.7 2.7 1.6 0.4 2.3 1.3]; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    f = zeros(size(x));
    for m = 0:8
        freq = 2^m;
        amp = 0.13*2^(-m/3);
        f = f + amp*sin(2*pi*freq*x + phaseTI(m+1));
    end
    f = f + 0.20*exp(-0.5*((x-0.24)/0.055).^2).*sin(2*pi*73*x+0.3) + ...
            0.16*exp(-0.5*((x-0.56)/0.040).^2).*sin(2*pi*119*x+1.1) + ...
            0.13*exp(-0.5*((x-0.81)/0.028).^2).*sin(2*pi*181*x+0.8);
    meta = struct;
    meta.ID = "TF165";
    meta.Name = "Turbulence Intermittency";
    meta.Category = 9;
    meta.RecommendedN = 1024;
    meta.Parameters = struct('phaseTI',phaseTI);
    meta.Morphology = "Multiscale oscillatory combination with localized high-frequency bursts";
end

function [x,f,meta] = TF166_StressStrainFracture(N)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    f = zeros(size(x));
    m1 = x < 0.18;
    m2 = x >= 0.18 & x < 0.34;
    m3 = x >= 0.34 & x < 0.72;
    m4 = x >= 0.72 & x < 0.90;
    m5 = x >= 0.90;
    f(m1) = 4*x(m1);
    f(m2) = 0.72 + 0.035*(x(m2)-0.18)/(0.34-0.18);
    u = (x(m3)-0.34)/(0.72-0.34);
    f(m3) = 0.755 + 0.30*u + 0.055*u.^2;
    u = (x(m4)-0.72)/(0.90-0.72);
    f(m4) = 1.11 - 0.22*u - 0.03*u.^2;
    f(m5) = 0.15 + 0.04*exp(-18*(x(m5)-0.90));
    meta = struct;
    meta.ID = "TF166";
    meta.Name = "Stress-Strain Fracture";
    meta.Category = 9;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Piecewise polynomial stress-strain response with post-fracture decay";
end

function [x,f,meta] = TF167_NanoindentationPopIn(N)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    f = zeros(size(x));
    loadMask = x <= 0.70;
    f(loadMask) = 1.08*(x(loadMask)/0.70).^1.50;
    f(loadMask) = f(loadMask) - 0.055*S(x(loadMask),0.29,0.0018) - 0.070*S(x(loadMask),0.47,0.0018);
    [~,i70] = min(abs(x-0.70));
    f70 = f(i70);
    unloadMask = x > 0.70;
    f(unloadMask) = f70*((1-x(unloadMask))/0.30).^1.32;
    f = f - 0.11*exp(-0.5*((x-0.925)/0.018).^2);
    meta = struct;
    meta.ID = "TF167";
    meta.Name = "Nanoindentation Pop-In";
    meta.Category = 9;
    meta.RecommendedN = 1024;
    meta.Parameters = struct('loadPoint',0.70);
    meta.Morphology = "Loading-unloading curve with localized pop-in reductions";
end

function [x,f,meta] = TF168_DSCPhaseTransitions(N)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    f = 0.08 + 0.10*x - 0.095*S(x,0.23,0.012) + 0.48*exp(-0.5*((x-0.46)/0.030).^2) - 0.42*exp(-0.5*((x-0.74)/0.060).^2) - 0.12*exp(-0.5*((x-0.825)/0.028).^2);
    meta = struct;
    meta.ID = "TF168";
    meta.Name = "DSC Phase Transitions";
    meta.Category = 9;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Baseline trend with multiple phase transition peaks and dips";
end

function [x,f,meta] = TF169_TGADecomposition(N)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    f = 1 - 0.18*S(x,0.20,0.022) - 0.38*S(x,0.49,0.030) - 0.10*S(x,0.61,0.015) - 0.25*S(x,0.77,0.020);
    meta = struct;
    meta.ID = "TF169";
    meta.Name = "TGA Decomposition";
    meta.Category = 9;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Stepwise mass loss modeled with smooth transitions";
end

function [x,f,meta] = TF170_VanDerPolRelaxation(N)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    muVDP = 7.0;
    dtVDP = 20/(N-1);
    y1 = zeros(1,N); y2 = zeros(1,N);
    y1(1) = 2; y2(1) = 0;
    rhsVDP = @(a,b) [b; muVDP*(1-a.^2).*b-a];
    for k = 1:N-1
        yy = [y1(k); y2(k)];
        k1 = rhsVDP(yy(1),yy(2));
        q = yy + 0.5*dtVDP*k1;
        k2 = rhsVDP(q(1),q(2));
        q = yy + 0.5*dtVDP*k2;
        k3 = rhsVDP(q(1),q(2));
        q = yy + dtVDP*k3;
        k4 = rhsVDP(q(1),q(2));
        yn = yy + dtVDP*(k1+2*k2+2*k3+k4)/6;
        y1(k+1)=yn(1); y2(k+1)=yn(2);
    end
    f = y1(:)/max(abs(y1));
    meta = struct;
    meta.ID = "TF170";
    meta.Name = "Van der Pol Relaxation";
    meta.Category = 9;
    meta.RecommendedN = 1024;
    meta.Parameters = struct('mu',muVDP);
    meta.Morphology = "Nonlinear relaxation oscillator (Van der Pol)";
end

function [x,f,meta] = TF171_SeismicDispersiveWave(N,amp1,amp2,envAmp,envCenter,envWidth,codaAmp,codaDecay)
    if nargin<1 || isempty(N), N = 1024; end
    if nargin<2 || isempty(amp1), amp1 = 0.015; end
    if nargin<3 || isempty(amp2), amp2 = 0.10; end
    if nargin<4 || isempty(envAmp), envAmp = 0.48; end
    if nargin<5 || isempty(envCenter), envCenter = 0.64; end
    if nargin<6 || isempty(envWidth), envWidth = 0.16; end
    if nargin<7 || isempty(codaAmp), codaAmp = 0.10; end
    if nargin<8 || isempty(codaDecay), codaDecay = 9; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    f = amp1*sin(2*pi*3*x) + amp2*exp(-0.5*((x-0.24)/0.025).^2).*sin(2*pi*42*x);
    uSD = max(x-0.39,0);
    envSD = (x>=0.39).*exp(-0.5*((x-envCenter)/envWidth).^2);
    f = f + envAmp*envSD.*sin(2*pi*(34*uSD-10*uSD.^2));
    uCoda = max(x-0.72,0);
    f = f + (x>=0.72).*codaAmp.*exp(-codaDecay*uCoda).*sin(2*pi*48*uCoda);
    meta = struct;
    meta.ID = "TF171";
    meta.Name = "Seismic Dispersive Wave";
    meta.Category = 9;
    meta.RecommendedN = 1024;
    meta.Parameters = struct('amp1',amp1,'amp2',amp2,'envAmp',envAmp,'envCenter',envCenter,'envWidth',envWidth,'codaAmp',codaAmp,'codaDecay',codaDecay);
    meta.Morphology = "Dispersive seismic wave with localized high-frequency components";
end

function [x,f,meta] = TF172_TertiaryCreepFailure(N,a1,a2,a3,a4,break1,break2,break3)
    if nargin<1 || isempty(N), N = 1024; end
    if nargin<2 || isempty(a1), a1 = 0.22; end
    if nargin<3 || isempty(a2), a2 = 0.22; end
    if nargin<4 || isempty(a3), a3 = 0.10; end
    if nargin<5 || isempty(a4), a4 = 0.18; end
    if nargin<6 || isempty(break1), break1 = 0.30; end
    if nargin<7 || isempty(break2), break2 = 0.56; end
    if nargin<8 || isempty(break3), break3 = 0.82; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    f = zeros(size(x));
    m1 = x < break1;
    m2 = x >= break1 & x < break2;
    m3 = x >= break2 & x < break3;
    m4 = x >= break3;
    f(m1) = a1*(1-exp(-10*x(m1)));
    f(m2) = 0.209 + a2*(x(m2)-break1);
    u = (x(m3)-break2)/(break3-break2);
    f(m3) = 0.266 + a3*u + 0.62*u.^4;
    f(m4) = 0.28 + a4*exp(-10*(x(m4)-break3));
    meta = struct;
    meta.ID = "TF172";
    meta.Name = "Tertiary Creep Failure";
    meta.Category = 9;
    meta.RecommendedN = 1024;
    meta.Parameters = struct('a1',a1,'a2',a2,'a3',a3,'a4',a4,'break1',break1,'break2',break2,'break3',break3);
    meta.Morphology = "Piecewise creep evolution with tertiary acceleration";
end

function [x,f,meta] = TF173_TransformerInrush(N,A,decay1,decay2,osc1,osc2,phase)
    if nargin<1 || isempty(N), N = 1024; end
    if nargin<2 || isempty(A), A = 0.35; end
    if nargin<3 || isempty(decay1), decay1 = 5; end
    if nargin<4 || isempty(decay2), decay2 = 4; end
    if nargin<5 || isempty(osc1), osc1 = 8; end
    if nargin<6 || isempty(osc2), osc2 = 16; end
    if nargin<7 || isempty(phase), phase = 0.45; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    f = (A + 1.05*exp(-decay1*x)).*sin(2*pi*osc1*x) + 0.48*exp(-decay2*x) + 0.26*exp(-5.5*x).*sin(2*pi*osc2*x+phase);
    meta = struct;
    meta.ID = "TF173";
    meta.Name = "Transformer Inrush";
    meta.Category = 9;
    meta.RecommendedN = 1024;
    meta.Parameters = struct('A',A,'decay1',decay1,'decay2',decay2,'osc1',osc1,'osc2',osc2,'phase',phase);
    meta.Morphology = "Damped oscillatory inrush current with transient envelope";
end

function [x,f,meta] = TF174_MEMSPullInRelease(N,pullAmp,relCenter,relWidth,oscAmp,oscFreq)
    if nargin<1 || isempty(N), N = 1024; end
    if nargin<2 || isempty(pullAmp), pullAmp = 0.56; end
    if nargin<3 || isempty(relCenter), relCenter = 0.42; end
    if nargin<4 || isempty(relWidth), relWidth = 0.28; end
    if nargin<5 || isempty(oscAmp), oscAmp = 0.15; end
    if nargin<6 || isempty(oscFreq), oscFreq = 34; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    f = zeros(size(x));
    m1 = x < relCenter;
    m2 = x >= relCenter & x < (relCenter+relWidth);
    m3 = x >= (relCenter+relWidth);
    u = x(m1)/relCenter;
    f(m1) = 0.06 + pullAmp*u.^2 + 0.12*u.^5;
    f(m2) = 0.98 + 0.025*sin(2*pi*2*(x(m2)-relCenter)/relWidth);
    u = x(m3)-(relCenter+relWidth);
    f(m3) = 0.24*(1-(x(m3)-(relCenter+relWidth))/0.30) + 0.05 + oscAmp*exp(-16*u).*sin(2*pi*oscFreq*u);
    meta = struct;
    meta.ID = "TF174";
    meta.Name = "MEMS Pull-in/Release";
    meta.Category = 9;
    meta.RecommendedN = 1024;
    meta.Parameters = struct('pullAmp',pullAmp,'relCenter',relCenter,'relWidth',relWidth,'oscAmp',oscAmp,'oscFreq',oscFreq);
    meta.Morphology = "Nonlinear pull-in and release with oscillatory decay";
end

function [x,f,meta] = TF175_LorenzWingSwitch(N,sigmaL,rhoL,betaL,dtL,burnL,initCond)
    if nargin<1 || isempty(N), N = 1024; end
    if nargin<2 || isempty(sigmaL), sigmaL = 10; end
    if nargin<3 || isempty(rhoL), rhoL = 28; end
    if nargin<4 || isempty(betaL), betaL = 8/3; end
    if nargin<5 || isempty(dtL), dtL = 0.01; end
    if nargin<6 || isempty(burnL), burnL = 1200; end
    if nargin<7 || isempty(initCond), initCond = [1;1;1]; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    validateattributes(burnL,{'numeric'},{'scalar','integer','>=',0});
    x = linspace(0,1,N).';
    totL = N + burnL;
    YL = zeros(3,totL);
    YL(:,1) = initCond(:);
    rhsL = @(v) [sigmaL*(v(2)-v(1)); v(1)*(rhoL-v(3))-v(2); v(1)*v(2)-betaL*v(3)];
    for k = 1:totL-1
        yy = YL(:,k);
        k1 = rhsL(yy);
        k2 = rhsL(yy+0.5*dtL*k1);
        k3 = rhsL(yy+0.5*dtL*k2);
        k4 = rhsL(yy+dtL*k3);
        YL(:,k+1) = yy + dtL*(k1+2*k2+2*k3+k4)/6;
    end
    f = YL(1,burnL+1:end).';
    f = f - mean(f);
    f = f / max(abs(f));
    meta = struct;
    meta.ID = "TF175";
    meta.Name = "Lorenz Wing Switch";
    meta.Category = 9;
    meta.RecommendedN = 1024;
    meta.Parameters = struct('sigma',sigmaL,'rho',rhoL,'beta',betaL,'dt',dtL,'burn',burnL,'initCond',initCond);
    meta.Morphology = "Chaotic Lorenz attractor projected with wing switching";
end

function [x,f,meta] = TF176_DyadicPhaseTwins(N,idxDPTp,ampDPT,sigmaDPT,freqDPT)
    if nargin<1 || isempty(N), N = 1024; end
    if nargin<2 || isempty(idxDPTp), idxDPTp = [512 1409 2306 3203]; end
    if nargin<3 || isempty(ampDPT), ampDPT = 1.0; end
    if nargin<4 || isempty(sigmaDPT), sigmaDPT = 0.014; end
    if nargin<5 || isempty(freqDPT), freqDPT = 34; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    f = zeros(size(x));
    idxDPT = idxDPTp;
    cDPT = (idxDPT-1)/(N-1);
    for k = 1:numel(cDPT)
        u = x-cDPT(k);
        f = f + ampDPT*exp(-0.5*(u/sigmaDPT).^2).*cos(2*pi*freqDPT*u);
    end
    meta = struct;
    meta.ID = "TF176";
    meta.Name = "Dyadic Phase Twins";
    meta.Category = 9;
    meta.RecommendedN = 1024;
    meta.Parameters = struct('idx',idxDPT,'amp',ampDPT,'sigma',sigmaDPT,'freq',freqDPT);
    meta.Morphology = "Spatially localized phase-shifted cosine twins";
end

function [x,f,meta] = TF177_BoundaryInteriorTwins(N,centers,ampBIT,sigmaBIT,freqBIT)
    if nargin<1 || isempty(N), N = 1024; end
    if nargin<2 || isempty(centers), centers = [0.025 0.50 0.975]; end
    if nargin<3 || isempty(ampBIT), ampBIT = 1.0; end
    if nargin<4 || isempty(sigmaBIT), sigmaBIT = 0.013; end
    if nargin<5 || isempty(freqBIT), freqBIT = 31; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    f = zeros(size(x));
    for c = centers
        u = x-c;
        f = f + ampBIT*exp(-0.5*(u/sigmaBIT).^2).*cos(2*pi*freqBIT*u);
    end
    meta = struct;
    meta.ID = "TF177";
    meta.Name = "Boundary/Interior Twins";
    meta.Category = 9;
    meta.RecommendedN = 1024;
    meta.Parameters = struct('centers',centers,'amp',ampBIT,'sigma',sigmaBIT,'freq',freqBIT);
    meta.Morphology = "Localized oscillatory twins at boundaries and interior";
end

function [x,f,meta] = TF178_RayleighDoubletLadder(N,cRDL,dRDL,wRDL,ampRDL)
    if nargin<1 || isempty(N), N = 1024; end
    if nargin<2 || isempty(cRDL), cRDL = [0.10 0.25 0.40 0.55 0.70 0.85]; end
    if nargin<3 || isempty(dRDL), dRDL = [0.060 0.045 0.032 0.024 0.018 0.012]; end
    if nargin<4 || isempty(wRDL), wRDL = 0.010; end
    if nargin<5 || isempty(ampRDL), ampRDL = 1.0; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    f = zeros(size(x));
    for k = 1:numel(cRDL)
        f = f + ampRDL*(exp(-0.5*((x-(cRDL(k)-dRDL(k)/2))/wRDL).^2) + exp(-0.5*((x-(cRDL(k)+dRDL(k)/2))/wRDL).^2));
    end
    meta = struct;
    meta.ID = "TF178";
    meta.Name = "Rayleigh Doublet Ladder";
    meta.Category = 9;
    meta.RecommendedN = 1024;
    meta.Parameters = struct('centers',cRDL,'separation',dRDL,'width',wRDL,'amp',ampRDL);
    meta.Morphology = "Ladder of Rayleigh doublets with decreasing spacing";
end

function [x,f,meta] = TF179_EqualEnergyScaleLadder(N,cEES,wEES,wref,ampEES)
    if nargin<1 || isempty(N), N = 1024; end
    if nargin<2 || isempty(cEES), cEES = [0.10 0.27 0.45 0.65 0.85]; end
    if nargin<3 || isempty(wEES), wEES = [0.005 0.008 0.013 0.022 0.037]; end
    if nargin<4 || isempty(wref), wref = 0.013; end
    if nargin<5 || isempty(ampEES), ampEES = 1.0; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    f = zeros(size(x));
    for k = 1:numel(cEES)
        z = (x-cEES(k))/wEES(k);
        A = sqrt(wref/wEES(k))*ampEES;
        f = f + A*(1-z.^2).*exp(-0.5*z.^2);
    end
    meta = struct;
    meta.ID = "TF179";
    meta.Name = "Equal-Energy Scale Ladder";
    meta.Category = 9;
    meta.RecommendedN = 1024;
    meta.Parameters = struct('centers',cEES,'widths',wEES,'wref',wref,'amp',ampEES);
    meta.Morphology = "Scale-normalized bumps with equal energy";
end

function [x,f,meta] = TF180_HolderLadder(N,cHL,alphaHL,wHL,ampHL)
    if nargin<1 || isempty(N), N = 1024; end
    if nargin<2 || isempty(cHL), cHL = [0.10 0.29 0.49 0.69 0.89]; end
    if nargin<3 || isempty(alphaHL), alphaHL = [0.25 0.50 1.00 1.50 2.50]; end
    if nargin<4 || isempty(wHL), wHL = 0.040; end
    if nargin<5 || isempty(ampHL), ampHL = 0.42; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    f = zeros(size(x));
    for k = 1:numel(cHL)
        z = (x-cHL(k))/wHL;
        phi = exp(-0.5*z.^2).*(1-0.62*abs(z).^alphaHL(k));
        phi = phi/max(abs(phi));
        f = f + ampHL*phi;
    end
    meta = struct;
    meta.ID = "TF180";
    meta.Name = "Holder Ladder";
    meta.Category = 9;
    meta.RecommendedN = 1024;
    meta.Parameters = struct('centers',cHL,'alpha',alphaHL,'width',wHL,'amp',ampHL);
    meta.Morphology = "Summed localized Holder-like pulses with varying regularity";
end

%% Category 10: 181- 230

function [x,f,meta] = TF181_GWChirpRingdown(N,xc)
    if nargin<1 || isempty(N), N = 1024; end
    if nargin<2 || isempty(xc), xc = 0.72; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    validateattributes(xc,{'numeric'},{'scalar','>=',0,'<=',1});
    x = linspace(0,1,N).';
    pre = x < xc;
    A = 0.12 + 0.88*(x/xc).^1.6;
    phase = 2*pi*(4*x + 5*x.^2 + 12*x.^3 + 18*x.^5);
    phasec = 2*pi*(4*xc + 5*xc^2 + 12*xc^3 + 18*xc^5);
    f = zeros(size(x));
    f(pre) = A(pre).*sin(phase(pre));
    u = max(x-xc,0);
    f(~pre) = exp(-14*u(~pre)).*sin(2*pi*42*u(~pre) + phasec);
    meta = struct;
    meta.ID = "TF181";
    meta.Name = "GW Chirp + Ringdown";
    meta.Category = 10;
    meta.RecommendedN = 1024;
    meta.Parameters = struct('xc',xc);
    meta.Morphology = "Chirp up to cutoff with exponential ringdown";
end

function [x,f,meta] = TF182_FRBScatterTail(N,c1,s1,tau1,c2,s2,tau2)
    if nargin<1 || isempty(N), N = 1024; end
    if nargin<2 || isempty(c1), c1 = 0.310; end
    if nargin<3 || isempty(s1), s1 = 0.0045; end
    if nargin<4 || isempty(tau1), tau1 = 0.038; end
    if nargin<5 || isempty(c2), c2 = 0.347; end
    if nargin<6 || isempty(s2), s2 = 0.0032; end
    if nargin<7 || isempty(tau2), tau2 = 0.024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    exg = @(z,c,s,tau) 0.5*exp(s^2/(2*tau^2) - (z-c)/tau).*erfc((s^2/tau - (z-c))/(sqrt(2)*s));
    e1 = exg(x,c1,s1,tau1);
    e2 = exg(x,c2,s2,tau2);
    e1 = e1/max(e1); e2 = e2/max(e2);
    f = e1 + 0.42*e2;
    meta = struct;
    meta.ID = "TF182";
    meta.Name = "Fast Radio Burst with Scattering Tail";
    meta.Category = 10;
    meta.RecommendedN = 1024;
    meta.Parameters = struct('c1',c1,'s1',s1,'tau1',tau1,'c2',c2,'s2',s2,'tau2',tau2);
    meta.Morphology = "Two scattered pulse components with tails";
end

function [x,f,meta] = TF183_PulsarGlitchRecovery(N,c)
    if nargin<1 || isempty(N), N = 1024; end
    if nargin<2 || isempty(c), c = 0.43; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    validateattributes(c,{'numeric'},{'scalar','>=',0,'<=',1});
    x = linspace(0,1,N).';
    u = max(x-c,0);
    h = double(x>=c);
    phase = 2*pi*(9*x + h.*(2.4*u + 0.22*(1-exp(-u/0.03)) + 0.16*(1-exp(-u/0.18))));
    f = sin(phase);
    meta = struct;
    meta.ID = "TF183";
    meta.Name = "Pulsar Glitch + Recovery";
    meta.Category = 10;
    meta.RecommendedN = 1024;
    meta.Parameters = struct('c',c);
    meta.Morphology = "Phase jump at glitch with multi-timescale recovery";
end

function [x,f,meta] = TF184_MagnetarBurstStorm(N,c,a,w)
    if nargin<1 || isempty(N), N = 1024; end
    if nargin<2 || isempty(c), c = [0.16 0.28 0.295 0.48 0.67 0.715 0.83]; end
    if nargin<3 || isempty(a), a = [0.55 0.42 0.25 0.92 0.38 0.62 0.30]; end
    if nargin<4 || isempty(w), w = [0.008 0.006 0.0035 0.010 0.005 0.006 0.004]; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    f = 0.025*sin(2*pi*3*x);
    for k = 1:numel(c)
        f = f + a(k)*G(x,c(k),w(k));
    end
    for k = 1:2
        cc = [0.48 0.715]; aa = [0.18 0.12];
        u = max(x-cc(k),0);
        f = f + (x>=cc(k)).*aa(k).*exp(-22*u).*sin(2*pi*55*u);
    end
    meta = struct;
    meta.ID = "TF184";
    meta.Name = "Magnetar Burst Storm";
    meta.Category = 10;
    meta.RecommendedN = 1024;
    meta.Parameters = struct('centers',c,'amps',a,'widths',w);
    meta.Morphology = "Burst pulses on background oscillation with decaying transients";
end

function [x,f,meta] = TF185_XrayQPODrift(N,ampScale)
    if nargin<1 || isempty(N), N = 1024; end
    if nargin<2 || isempty(ampScale), ampScale = 1.0; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    amp = (0.12 + 0.35*S(x,0.18,0.06) - 0.22*S(x,0.78,0.05))*ampScale;
    phase = 2*pi*(10*x + 8*x.^2 + 1.8*x.^3) + 0.7*sin(2*pi*1.3*x);
    f = amp.*sin(phase);
    meta = struct;
    meta.ID = "TF185";
    meta.Name = "X-ray QPO Drift";
    meta.Category = 10;
    meta.RecommendedN = 1024;
    meta.Parameters = struct('ampScale',ampScale);
    meta.Morphology = "Amplitude-modulated quasi-periodic oscillation with drifting phase";
end

function [x,f,meta] = TF186_QubitRamseyWander(N,visBase,visDipCenter,visDipWidth)
    if nargin<1 || isempty(N), N = 1024; end
    if nargin<2 || isempty(visBase), visBase = 0.92; end
    if nargin<3 || isempty(visDipCenter), visDipCenter = 0.56; end
    if nargin<4 || isempty(visDipWidth), visDipWidth = 0.055; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    vis = (visBase-0.35*x).*(1-0.78*G(x,visDipCenter,visDipWidth));
    phase = 2*pi*(8*x + 2.8*x.^2) + 0.55*sin(2*pi*1.4*x);
    f = vis.*cos(phase);
    meta = struct;
    meta.ID = "TF186";
    meta.Name = "Qubit Ramsey Wander";
    meta.Category = 10;
    meta.RecommendedN = 1024;
    meta.Parameters = struct('visBase',visBase,'visDipCenter',visDipCenter,'visDipWidth',visDipWidth);
    meta.Morphology = "Visibility envelope with wandering phase";
end

function [x,f,meta] = TF187_JosephsonPhaseSlips(N,baseFreq,slipPhases,slipLocations)
    if nargin<1 || isempty(N), N = 1024; end
    if nargin<2 || isempty(baseFreq), baseFreq = 12; end
    if nargin<3 || isempty(slipPhases), slipPhases = [0.75*pi -1.05*pi 0.60*pi]; end
    if nargin<4 || isempty(slipLocations), slipLocations = [0.28 0.53 0.78]; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    phi = 2*pi*baseFreq*x;
    for k=1:numel(slipLocations)
        phi = phi + slipPhases(k)*double(x>=slipLocations(k));
    end
    f = 0.75*sin(phi) + 0.12*sin(2*phi+0.4);
    meta = struct;
    meta.ID = "TF187";
    meta.Name = "Josephson Phase Slips";
    meta.Category = 10;
    meta.RecommendedN = 1024;
    meta.Parameters = struct('baseFreq',baseFreq,'slipPhases',slipPhases,'slipLocations',slipLocations);
    meta.Morphology = "Discrete phase slips producing harmonic content";
end

function [x,f,meta] = TF188_TokamakELMTrain(N,qSlope,qPertAmp,c,a,w)
    if nargin<1 || isempty(N), N = 1024; end
    if nargin<2 || isempty(qSlope), qSlope = 6.4; end
    if nargin<3 || isempty(qPertAmp), qPertAmp = 0.07; end
    if nargin<4 || isempty(c), c = [0.156 0.312 0.468 0.625 0.782 0.937]; end
    if nargin<5 || isempty(a), a = [0.12 0.08 0.15 0.10 0.16 0.08]; end
    if nargin<6 || isempty(w), w = 0.006; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    q = qSlope*x + qPertAmp*sin(2*pi*x);
    ramp = q-floor(q);
    f = 0.12 + 0.78*ramp.*(1+0.10*sin(2*pi*1.1*x));
    for k = 1:numel(c)
        f = f + a(k)*G(x,c(k),w);
    end
    meta = struct;
    meta.ID = "TF188";
    meta.Name = "Tokamak ELM Train";
    meta.Category = 10;
    meta.RecommendedN = 1024;
    meta.Parameters = struct('qSlope',qSlope,'qPertAmp',qPertAmp,'centers',c,'amps',a,'width',w);
    meta.Morphology = "Periodic ramp-like ELMs with localized spikes";
end

function [x,f,meta] = TF189_SolitonCollision(N,amp1,amp2,amp3,c1,c2,c3,w1,w2,w3,carrierFreq)
    if nargin<1 || isempty(N), N = 1024; end
    if nargin<2 || isempty(amp1), amp1 = 0.66; end
    if nargin<3 || isempty(amp2), amp2 = 0.66; end
    if nargin<4 || isempty(amp3), amp3 = 0.82; end
    if nargin<5 || isempty(c1), c1 = 0.40; end
    if nargin<6 || isempty(c2), c2 = 0.60; end
    if nargin<7 || isempty(c3), c3 = 0.50; end
    if nargin<8 || isempty(w1), w1 = 0.045; end
    if nargin<9 || isempty(w2), w2 = 0.045; end
    if nargin<10 || isempty(w3), w3 = 0.030; end
    if nargin<11 || isempty(carrierFreq), carrierFreq = 29; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    sech2 = @(z) 1./cosh(z).^2;
    f = amp1*sech2((x-c1)/w1) + amp2*sech2((x-c2)/w2) + amp3*sech2((x-c3)/w3).*cos(2*pi*carrierFreq*(x-c3));
    meta = struct;
    meta.ID = "TF189";
    meta.Name = "Soliton Collision";
    meta.Category = 10;
    meta.RecommendedN = 1024;
    meta.Parameters = struct('amps',[amp1 amp2 amp3],'centers',[c1 c2 c3],'widths',[w1 w2 w3],'carrierFreq',carrierFreq);
    meta.Morphology = "Two solitons with central oscillatory interaction";
end

function [x,f,meta] = TF190_CriticalSlowing(N)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    f = 0.10 + 0.04*x;
    c = [0.16 0.38 0.60]; a = [0.35 0.33 0.30]; tau = [0.025 0.060 0.120];
    for k = 1:3
        u = max(x-c(k),0);
        f = f + (x>=c(k)).*a(k).*exp(-u/tau(k));
    end
    f = f - 0.48*S(x,0.83,0.006) + 0.20*S(x,0.89,0.025);
    meta = struct;
    meta.ID = "TF190";
    meta.Name = "Critical Slowing";
    meta.Category = 10;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Step-like activations with slow relaxations";
end

function [x,f,meta] = TF191_BatteryKnee(N,kappa,x0)
    if nargin<1 || isempty(N), N = 1024; end
    if nargin<2 || isempty(kappa), kappa = 26; end
    if nargin<3 || isempty(x0), x0 = 0.64; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    sp = log1p(exp(kappa*(x-x0)))/kappa;
    sp1 = log1p(exp(kappa*(1-x0)))/kappa;
    f = 1 - 0.18*x - 0.58*(sp/sp1).^1.55;
    meta = struct;
    meta.ID = "TF191";
    meta.Name = "Battery Knee";
    meta.Category = 10;
    meta.RecommendedN = 1024;
    meta.Parameters = struct('kappa',kappa,'x0',x0);
    meta.Morphology = "Smooth knee via softplus transform";
end

function [x,f,meta] = TF192_FuelCellFloodDry(N,f0,c,a,tf,ts)
    if nargin<1 || isempty(N), N = 1024; end
    if nargin<2 || isempty(f0), f0 = 0.82; end
    if nargin<3 || isempty(c), c = [0.20 0.50 0.76]; end
    if nargin<4 || isempty(a), a = [0.36 0.48 0.32]; end
    if nargin<5 || isempty(tf), tf = [0.010 0.012 0.008]; end
    if nargin<6 || isempty(ts), ts = [0.095 0.135 0.080]; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    f = f0 + 0.03*sin(2*pi*2*x);
    for k = 1:numel(c)
        u = max(x-c(k),0);
        f = f - (x>=c(k)).*a(k).*(1-exp(-u/tf(k))).*exp(-u/ts(k));
    end
    meta = struct;
    meta.ID = "TF192";
    meta.Name = "Fuel-cell Flood/Dry Cycles";
    meta.Category = 10;
    meta.RecommendedN = 1024;
    meta.Parameters = struct('baseline',f0,'centers',c,'amps',a,'tf',tf,'ts',ts);
    meta.Morphology = "Transient flooding events with slow drainage";
end

function [x,f,meta] = TF193_GNSSMultipathFade(N,base,lowAmp,highAmp,w)
    if nargin<1 || isempty(N), N = 1024; end
    if nargin<2 || isempty(base), base = 0.65; end
    if nargin<3 || isempty(lowAmp), lowAmp = 0.035; end
    if nargin<4 || isempty(highAmp), highAmp = 0.06; end
    if nargin<5 || isempty(w), w = [0.018 0.011 0.026 0.014]; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    f = base + 0.08*sin(2*pi*1.5*x) + lowAmp*sin(2*pi*16*x+0.4);
    c = [0.23 0.51 0.73 0.86]; a = [0.42 0.56 0.34 0.46];
    for k = 1:4
        f = f - a(k)*G(x,c(k),w(k));
    end
    f = f + highAmp*sin(2*pi*33*x).*G(x,0.52,0.08);
    meta = struct;
    meta.ID = "TF193";
    meta.Name = "GNSS Multipath Fade";
    meta.Category = 10;
    meta.RecommendedN = 1024;
    meta.Parameters = struct('base',base,'lowAmp',lowAmp,'highAmp',highAmp,'centers',c,'amps',a,'widths',w);
    meta.Morphology = "Multipath dips with high-frequency modulation";
end

function [x,f,meta] = TF194_RadarMicroDoppler(N,amp1,amp2,mod1,mod2)
    if nargin<1 || isempty(N), N = 1024; end
    if nargin<2 || isempty(amp1), amp1 = 1; end
    if nargin<3 || isempty(amp2), amp2 = 0.24; end
    if nargin<4 || isempty(mod1), mod1 = 1.25; end
    if nargin<5 || isempty(mod2), mod2 = 0.70; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    phase1 = 2*pi*(17*x + 5*x.^2) + mod1*sin(2*pi*2.7*x);
    phase2 = 2*pi*(39*x + 2.5*x.^2) + mod2*sin(2*pi*5.2*x);
    f = (0.58+0.25*cos(2*pi*1.8*x)).*sin(phase1) * amp1 + amp2*sin(phase2);
    meta = struct;
    meta.ID = "TF194";
    meta.Name = "Radar Micro-Doppler";
    meta.Category = 10;
    meta.RecommendedN = 1024;
    meta.Parameters = struct('amp1',amp1,'amp2',amp2,'mod1',mod1,'mod2',mod2);
    meta.Morphology = "Amplitude-modulated dual-component micro-Doppler signal";
end

function [x,f,meta] = TF195_MeltPoolSpatter(N,base,c,a,w)
    if nargin<1 || isempty(N), N = 1024; end
    if nargin<2 || isempty(base), base = 0.12; end
    if nargin<3 || isempty(c), c = [0.21 0.37 0.49 0.58 0.74 0.79]; end
    if nargin<4 || isempty(a), a = [0.18 0.28 0.20 0.34 0.23 -0.15]; end
    if nargin<5 || isempty(w), w = [0.004 0.003 0.0025 0.0035 0.0028 0.004]; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    f = base + 0.72*G(x,0.55,0.22);
    for k = 1:numel(c)
        f = f + a(k)*G(x,c(k),w(k));
    end
    f = f + 0.05*sin(2*pi*18*x).*G(x,0.58,0.20);
    meta = struct;
    meta.ID = "TF195";
    meta.Name = "Melt-pool Spatter";
    meta.Category = 10;
    meta.RecommendedN = 1024;
    meta.Parameters = struct('base',base,'centers',c,'amps',a,'widths',w);
    meta.Morphology = "Localized spatter peaks with high-frequency modulation";
end

function [x,f,meta] = TF196_CavitationCollapse(N,c,a,w,fr)
    if nargin<1 || isempty(N), N = 1024; end
    if nargin<2 || isempty(c), c = [0.18 0.225 0.46 0.69 0.735 0.84]; end
    if nargin<3 || isempty(a), a = [0.70 0.42 0.95 0.52 0.76 0.38]; end
    if nargin<4 || isempty(w), w = [0.003 0.0025 0.0035 0.0025 0.003 0.002]; end
    if nargin<5 || isempty(fr), fr = [70 86 62 92 78 105]; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    f = zeros(size(x));
    for k = 1:numel(c)
        f = f + a(k)*G(x,c(k),w(k));
        u = max(x-c(k),0);
        f = f + (x>=c(k)).*(0.18*a(k)).*exp(-35*u).*sin(2*pi*fr(k)*u);
    end
    meta = struct;
    meta.ID = "TF196";
    meta.Name = "Cavitation Collapse";
    meta.Category = 10;
    meta.RecommendedN = 1024;
    meta.Parameters = struct('centers',c,'amps',a,'widths',w,'ringFreqs',fr);
    meta.Morphology = "Burst-like collapses with damped ringing";
end

function [x,f,meta] = TF197_ModeBeatingDecay(N,amp1,amp2,amp3)
    if nargin<1 || isempty(N), N = 1024; end
    if nargin<2 || isempty(amp1), amp1 = 1; end
    if nargin<3 || isempty(amp2), amp2 = 0.93; end
    if nargin<4 || isempty(amp3), amp3 = 0.28; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    f = exp(-2.4*x).*(sin(2*pi*15*x) + amp2*sin(2*pi*16.4*x+0.15))*amp1 + ...
        amp3*exp(-5.8*x).*sin(2*pi*33*x+0.6);
    meta = struct;
    meta.ID = "TF197";
    meta.Name = "Mode Beating Decay";
    meta.Category = 10;
    meta.RecommendedN = 1024;
    meta.Parameters = struct('amp1',amp1,'amp2',amp2,'amp3',amp3);
    meta.Morphology = "Beating modes with exponential decay";
end

function [x,f,meta] = TF198_ValveChatter(N,gain,depth)
    if nargin<1 || isempty(N), N = 1024; end
    if nargin<2 || isempty(gain), gain = 0.48; end
    if nargin<3 || isempty(depth), depth = 0.34; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    gate = S(x,0.30,0.003)-S(x,0.58,0.003);
    chatter = gate.*tanh(2.7*sin(2*pi*47*(x-0.30)));
    u = max(x-0.58,0);
    ring = (x>=0.58).*depth.*exp(-18*u).*sin(2*pi*34*u);
    f = 0.12 + 0.18*x + gain*chatter + ring;
    meta = struct;
    meta.ID = "TF198";
    meta.Name = "Valve Chatter";
    meta.Category = 10;
    meta.RecommendedN = 1024;
    meta.Parameters = struct('gain',gain,'depth',depth);
    meta.Morphology = "Gated chatter with post-event ringing";
end

function [x,f,meta] = TF199_NetworkCongestionBurst(N,loadBase,burstAmp)
    if nargin<1 || isempty(N), N = 1024; end
    if nargin<2 || isempty(loadBase), loadBase = 0.15; end
    if nargin<3 || isempty(burstAmp), burstAmp = 0.17; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    loadCurve = loadBase + 0.78*S(x,0.22,0.065) - 0.62*S(x,0.82,0.035);
    gate = S(x,0.46,0.010)-S(x,0.78,0.010);
    q = 18*(x-0.46);
    saw = 2*(q-floor(q))-1;
    f = loadCurve + burstAmp*gate.*saw;
    meta = struct;
    meta.ID = "TF199";
    meta.Name = "Network Congestion Burst";
    meta.Category = 10;
    meta.RecommendedN = 1024;
    meta.Parameters = struct('loadBase',loadBase,'burstAmp',burstAmp);
    meta.Morphology = "Load curve with gated sawtooth bursts";
end

function [x,f,meta] = TF200_ThermalThrottle(N,thermalBase,throttleDepth)
    if nargin<1 || isempty(N), N = 1024; end
    if nargin<2 || isempty(thermalBase), thermalBase = 0.12; end
    if nargin<3 || isempty(throttleDepth), throttleDepth = 0.16; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    thermal = thermalBase + 0.78*(1-exp(-4*x));
    gate = S(x,0.44,0.01);
    sq = 0.5*(1+sign(sin(2*pi*12*(x-0.44))));
    f = thermal - throttleDepth*gate.*sq + 0.045*gate.*sin(2*pi*24*(x-0.44));
    meta = struct;
    meta.ID = "TF200";
    meta.Name = "Thermal Throttle";
    meta.Category = 10;
    meta.RecommendedN = 1024;
    meta.Parameters = struct('thermalBase',thermalBase,'throttleDepth',throttleDepth);
    meta.Morphology = "Thermal ramp with gated duty-cycle throttling";
end

function [x,f,meta] = TF201_CGMMealStack(N,baseSin,centers,amps,tau)
    if nargin<1 || isempty(N), N = 1024; end
    if nargin<2 || isempty(baseSin), baseSin = 0.20; end
    if nargin<3 || isempty(centers), centers = [0.16 0.36 0.54 0.69]; end
    if nargin<4 || isempty(amps), amps = [0.48 0.62 0.45 0.70]; end
    if nargin<5 || isempty(tau), tau = [0.075 0.095 0.080 0.110]; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    f = baseSin + 0.03*sin(2*pi*x);
    for k = 1:numel(centers)
        u = max(x-centers(k),0);
        resp = (x>=centers(k)).*(u/tau(k)).*exp(1-u/tau(k));
        f = f + amps(k)*resp;
    end
    meta = struct;
    meta.ID = "TF201";
    meta.Name = "CGM Meal Stack";
    meta.Category = 10;
    meta.RecommendedN = 1024;
    meta.Parameters = struct('baseSin',baseSin,'centers',centers,'amps',amps,'tau',tau);
    meta.Morphology = "Stacked meal responses with gamma-like shape";
end

function [x,f,meta] = TF202_SleepSpindleKComplex(N,kamp,kcent,kwidth)
    if nargin<1 || isempty(N), N = 1024; end
    if nargin<2 || isempty(kamp), kamp = -0.75; end
    if nargin<3 || isempty(kcent), kcent = 0.43; end
    if nargin<4 || isempty(kwidth), kwidth = 0.035; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    kcomp = kamp*G(x,kcent,kwidth) + 0.48*G(x,0.475,0.048);
    spindle = 0.32*G(x,0.66,0.075).*sin(2*pi*37*(x-0.66));
    slow = 0.06*sin(2*pi*2.4*x);
    f = slow + kcomp + spindle;
    meta = struct;
    meta.ID = "TF202";
    meta.Name = "Sleep Spindle + K-Complex";
    meta.Category = 10;
    meta.RecommendedN = 1024;
    meta.Parameters = struct('kamp',kamp,'kcent',kcent,'kwidth',kwidth);
    meta.Morphology = "K-complex with overlapping spindle oscillation";
end

function [x,f,meta] = TF203_PupilLightReflex(N,respAmp,respOnset,respTau,baselineBumpAmp)
    if nargin<1 || isempty(N), N = 1024; end
    if nargin<2 || isempty(respAmp), respAmp = 0.72; end
    if nargin<3 || isempty(respOnset), respOnset = 0.25; end
    if nargin<4 || isempty(respTau), respTau = struct('rise',0.014,'decay',0.22); end
    if nargin<5 || isempty(baselineBumpAmp), baselineBumpAmp = 0.10; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    u = max(x-respOnset,0);
    resp = (x>=respOnset).*(1-exp(-u/respTau.rise)).*exp(-u/respTau.decay);
    f = 1 - respAmp*resp + baselineBumpAmp*G(x,0.68,0.07);
    meta = struct;
    meta.ID = "TF203";
    meta.Name = "Pupil Light Reflex";
    meta.Category = 10;
    meta.RecommendedN = 1024;
    meta.Parameters = struct('respAmp',respAmp,'respOnset',respOnset,'respTau',respTau,'baselineBumpAmp',baselineBumpAmp);
    meta.Morphology = "Rapid constriction with slow recovery and baseline bump";
end

function [x,f,meta] = TF204_CoughFlowBurst(N,c,a,tau,p)
    if nargin<1 || isempty(N), N = 1024; end
    if nargin<2 || isempty(c), c = [0.28 0.405 0.53]; end
    if nargin<3 || isempty(a), a = [1.0 0.48 0.32]; end
    if nargin<4 || isempty(tau), tau = [0.035 0.027 0.045]; end
    if nargin<5 || isempty(p), p = [1.2 1.4 1.1]; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    f = zeros(size(x));
    for k = 1:numel(c)
        uk = max(x-c(k),0);
        resp = (x>=c(k)).*(uk/tau(k)).^p(k).*exp(p(k)-uk/tau(k));
        f = f + a(k)*resp;
    end
    f = f.*(1+0.08*sin(2*pi*23*x));
    meta = struct;
    meta.ID = "TF204";
    meta.Name = "Cough Flow Burst";
    meta.Category = 10;
    meta.RecommendedN = 1024;
    meta.Parameters = struct('c',c,'a',a,'tau',tau,'p',p);
    meta.Morphology = "Burst-like respiratory flows with modulation";
end

function [x,f,meta] = TF205_DesaturationRecovery(N,c,a,tf,ts)
    if nargin<1 || isempty(N), N = 1024; end
    if nargin<2 || isempty(c), c = [0.34 0.67]; end
    if nargin<3 || isempty(a), a = [0.54 0.34]; end
    if nargin<4 || isempty(tf), tf = [0.012 0.018]; end
    if nargin<5 || isempty(ts), ts = [0.19 0.14]; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    f = ones(size(x));
    for k = 1:numel(c)
        uk = max(x-c(k),0);
        f = f - (x>=c(k)).*a(k).*(1-exp(-uk/tf(k))).*exp(-uk/ts(k));
    end
    meta = struct;
    meta.ID = "TF205";
    meta.Name = "Desaturation + Recovery";
    meta.Category = 10;
    meta.RecommendedN = 1024;
    meta.Parameters = struct('c',c,'a',a,'tf',tf,'ts',ts);
    meta.Morphology = "Step-like desaturations with slow recovery";
end

function [x,f,meta] = TF206_OJIPFluorescence(N,amp1,amp2,amp3)
    if nargin<1 || isempty(N), N = 1024; end
    if nargin<2 || isempty(amp1), amp1 = 0.28; end
    if nargin<3 || isempty(amp2), amp2 = 0.25; end
    if nargin<4 || isempty(amp3), amp3 = 0.38; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    f = 0.08 + ...
        amp1*(1-exp(-(x/0.012).^1.25)) + ...
        amp2*(1-exp(-(x/0.075).^1.15)) + ...
        amp3*(1-exp(-(x/0.32).^1.55));
    f = f + 0.035*G(x,0.085,0.018) - 0.025*G(x,0.20,0.032);
    meta = struct;
    meta.ID = "TF206";
    meta.Name = "OJIP Chlorophyll Fluorescence";
    meta.Category = 10;
    meta.RecommendedN = 1024;
    meta.Parameters = struct('amp1',amp1,'amp2',amp2,'amp3',amp3);
    meta.Morphology = "Multi-stage fluorescence rise with small peaks/dips";
end

function [x,f,meta] = TF207_StomatalClosure(N,cent1,wid1,amp1,cent2,wid2,amp2)
    if nargin<1 || isempty(N), N = 1024; end
    if nargin<2 || isempty(cent1), cent1 = 0.39; end
    if nargin<3 || isempty(wid1), wid1 = 0.020; end
    if nargin<4 || isempty(amp1), amp1 = 0.62; end
    if nargin<5 || isempty(cent2), cent2 = 0.79; end
    if nargin<6 || isempty(wid2), wid2 = 0.055; end
    if nargin<7 || isempty(amp2), amp2 = 0.30; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    f = 1 - amp1*S(x,cent1,wid1) + amp2*S(x,cent2,wid2) - 0.06*G(x,0.50,0.055);
    meta = struct;
    meta.ID = "TF207";
    meta.Name = "Stomatal Closure";
    meta.Category = 10;
    meta.RecommendedN = 1024;
    meta.Parameters = struct('cent1',cent1,'wid1',wid1,'amp1',amp1,'cent2',cent2,'wid2',wid2,'amp2',amp2);
    meta.Morphology = "Closure dynamics with secondary reopening and dip";
end

function [x,f,meta] = TF208_SapFlowLag(N,base,c,a,tr,td,lfAmp,lfFreq,phase)
    if nargin<1 || isempty(N), N = 1024; end
    if nargin<2 || isempty(base), base = 0.12; end
    if nargin<3 || isempty(c), c = [0.08 0.57]; end
    if nargin<4 || isempty(a), a = [0.78 0.70]; end
    if nargin<5 || isempty(tr), tr = [0.040 0.050]; end
    if nargin<6 || isempty(td), td = [0.17 0.19]; end
    if nargin<7 || isempty(lfAmp), lfAmp = 0.03; end
    if nargin<8 || isempty(lfFreq), lfFreq = 2; end
    if nargin<9 || isempty(phase), phase = -0.4; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    f = base*ones(size(x));
    for k = 1:numel(c)
        uk = max(x-c(k),0);
        f = f + (x>=c(k)).*a(k).*(1-exp(-uk/tr(k))).*exp(-uk/td(k));
    end
    f = f + lfAmp*sin(2*pi*lfFreq*x+phase);
    meta = struct;
    meta.ID = "TF208";
    meta.Name = "Sap Flow Lag";
    meta.Category = 10;
    meta.RecommendedN = 1024;
    meta.Parameters = struct('base',base,'c',c,'a',a,'tr',tr,'td',td,'lfAmp',lfAmp,'lfFreq',lfFreq,'phase',phase);
    meta.Morphology = "Delayed rise with slow decay and low-frequency modulation";
end

function [x,f,meta] = TF209_LeafNyctinasty(N,base,c1,w1,c2,w2,amp)
    if nargin<1 || isempty(N), N = 1024; end
    if nargin<2 || isempty(base), base = 0.12; end
    if nargin<3 || isempty(c1), c1 = 0.08; end
    if nargin<4 || isempty(w1), w1 = 0.025; end
    if nargin<5 || isempty(c2), c2 = 0.57; end
    if nargin<6 || isempty(w2), w2 = 0.022; end
    if nargin<7 || isempty(amp), amp = 0.025; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    f = base + ...
        0.78*(S(x,c1,w1)-S(x,0.38,0.050)) + ...
        0.72*(S(x,c2,w2)-S(x,0.88,0.060)) + ...
        amp*sin(2*pi*5*x);
    meta = struct;
    meta.ID = "TF209";
    meta.Name = "Leaf Nyctinasty";
    meta.Category = 10;
    meta.RecommendedN = 1024;
    meta.Parameters = struct('base',base,'c1',c1,'w1',w1,'c2',c2,'w2',w2,'amp',amp);
    meta.Morphology = "Day-night leaf movement with periodic modulation";
end

function [x,f,meta] = TF210_FungalGrowthPulse(N)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    f = 0.06 + 0.12*x + ...
        0.19*S(x,0.19,0.035) + 0.15*S(x,0.39,0.018) + ...
        0.27*S(x,0.63,0.050) + 0.12*S(x,0.84,0.020);
    f = f + 0.018*sin(2*pi*9*x).*(S(x,0.17,0.03)-S(x,0.88,0.03));
    meta = struct;
    meta.ID = "TF210";
    meta.Name = "Fungal Growth Pulses";
    meta.Category = 10;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Pulsed growth responses with gated higher-frequency ripples";
end

function [x,f,meta] = TF211_PianoInharmonicDecay(N, u0, gateCenter, gateWidth)
    if nargin<1 || isempty(N), N = 1024; end
    if nargin<2 || isempty(u0), u0 = 0.035; end
    if nargin<3 || isempty(gateCenter), gateCenter = 0.035; end
    if nargin<4 || isempty(gateWidth), gateWidth = 0.0025; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    u = max(x-u0,0);
    gate = S(x,gateCenter,gateWidth);
    f = gate.*( ...
        0.62*exp(-2.2*u).*sin(2*pi*7*u) + ...
        0.34*exp(-4.0*u).*sin(2*pi*14.25*u+0.15) + ...
        0.22*exp(-6.0*u).*sin(2*pi*21.7*u+0.4) + ...
        0.14*exp(-8.0*u).*sin(2*pi*29.5*u+0.7));
    meta = struct;
    meta.ID = "TF211";
    meta.Name = "Piano Inharmonic Decay";
    meta.Category = 11;
    meta.RecommendedN = 1024;
    meta.Parameters = struct('u0',u0,'gateCenter',gateCenter,'gateWidth',gateWidth);
    meta.Morphology = "Inharmonic decaying partials gated by attack";
end

function [x,f,meta] = TF212_GuitarPluckDualDecay(N, u0, gateCenter, gateWidth)
    if nargin<1 || isempty(N), N = 1024; end
    if nargin<2 || isempty(u0), u0 = 0.045; end
    if nargin<3 || isempty(gateCenter), gateCenter = 0.045; end
    if nargin<4 || isempty(gateWidth), gateWidth = 0.002; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    u = max(x-u0,0);
    gate = S(x,gateCenter,gateWidth);
    f = gate.*( ...
        0.72*exp(-1.8*u).*sin(2*pi*6.5*u) + ...
        0.32*exp(-5.5*u).*sin(2*pi*13*u+0.2) + ...
        0.22*exp(-8.0*u).*sin(2*pi*19.5*u+0.5) + ...
        0.12*exp(-11*u).*sin(2*pi*32.5*u));
    meta = struct;
    meta.ID = "TF212";
    meta.Name = "Guitar Pluck Dual Decay";
    meta.Category = 11;
    meta.RecommendedN = 1024;
    meta.Parameters = struct('u0',u0,'gateCenter',gateCenter,'gateWidth',gateWidth);
    meta.Morphology = "Dual-decay pluck with multiple partials";
end

function [x,f,meta] = TF213_BellBeating(N, decay1, decay2, amp2)
    if nargin<1 || isempty(N), N = 1024; end
    if nargin<2 || isempty(decay1), decay1 = 2.3; end
    if nargin<3 || isempty(decay2), decay2 = 6.9; end
    if nargin<4 || isempty(amp2), amp2 = 0.35; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    f = exp(-decay1*x).*(sin(2*pi*11*x) + 0.92*sin(2*pi*11.75*x+0.12)) + ...
        amp2*exp(-decay2*x).*sin(2*pi*27.3*x+0.5);
    meta = struct;
    meta.ID = "TF213";
    meta.Name = "Bell Beating";
    meta.Category = 11;
    meta.RecommendedN = 1024;
    meta.Parameters = struct('decay1',decay1,'decay2',decay2,'amp2',amp2);
    meta.Morphology = "Beating between close partials with faster overtone";
end

function [x,f,meta] = TF214_DrumModePacket(N, u0, gateCenter, gateWidth)
    if nargin<1 || isempty(N), N = 1024; end
    if nargin<2 || isempty(u0), u0 = 0.06; end
    if nargin<3 || isempty(gateCenter), gateCenter = 0.06; end
    if nargin<4 || isempty(gateWidth), gateWidth = 0.002; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    u = max(x-u0,0);
    gate = S(x,gateCenter,gateWidth);
    f = gate.*( ...
        0.58*exp(-4*u).*sin(2*pi*8.5*u) + ...
        0.40*exp(-5.8*u).*sin(2*pi*13.7*u+0.7) + ...
        0.27*exp(-7.5*u).*sin(2*pi*22.4*u+0.3) + ...
        0.16*exp(-10*u).*sin(2*pi*31.2*u+1.0));
    meta = struct;
    meta.ID = "TF214";
    meta.Name = "Drum Mode Packet";
    meta.Category = 11;
    meta.RecommendedN = 1024;
    meta.Parameters = struct('u0',u0,'gateCenter',gateCenter,'gateWidth',gateWidth);
    meta.Morphology = "Envelope-gated drum modal packet";
end

function [x,f,meta] = TF215_TrafficStopGo(N, base, c, a, tf, ts)
    if nargin<1 || isempty(N), N = 1024; end
    if nargin<2 || isempty(base), base = 0.72; end
    if nargin<3 || isempty(c), c = [0.18 0.38 0.59 0.78]; end
    if nargin<4 || isempty(a), a = [0.48 0.38 0.55 0.44]; end
    if nargin<5 || isempty(tf), tf = [0.015 0.020 0.012 0.018]; end
    if nargin<6 || isempty(ts), ts = [0.08 0.11 0.09 0.10]; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    f = base + 0.05*sin(2*pi*0.8*x);
    for k = 1:numel(c)
        uk = max(x-c(k),0);
        f = f - (x>=c(k)).*a(k).*(1-exp(-uk/tf(k))).*exp(-uk/ts(k));
    end
    meta = struct;
    meta.ID = "TF215";
    meta.Name = "Traffic Stop-and-Go";
    meta.Category = 11;
    meta.RecommendedN = 1024;
    meta.Parameters = struct('base',base,'c',c,'a',a,'tf',tf,'ts',ts);
    meta.Morphology = "Series of desaturation-like slow recoveries (stop-go)";
end

function [x,f,meta] = TF216_ElevatorRideAcceleration(N, a1, a2, hfAmp)
    if nargin<1 || isempty(N), N = 1024; end
    if nargin<2 || isempty(a1), a1 = 0.62; end
    if nargin<3 || isempty(a2), a2 = 0.58; end
    if nargin<4 || isempty(hfAmp), hfAmp = 0.18; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    f = a1*(S(x,0.08,0.008)-S(x,0.22,0.008)) - a2*(S(x,0.68,0.008)-S(x,0.80,0.008));
    u = max(x-0.80,0);
    f = f + (x>=0.80).*hfAmp.*exp(-22*u).*sin(2*pi*30*u);
    meta = struct;
    meta.ID = "TF216";
    meta.Name = "Elevator Ride Acceleration";
    meta.Category = 11;
    meta.RecommendedN = 1024;
    meta.Parameters = struct('a1',a1,'a2',a2,'hfAmp',hfAmp);
    meta.Morphology = "Acceleration pulses with high-frequency end oscillation";
end

function [x,f,meta] = TF217_ThermostatCycle(N, base, on, off, amp)
    if nargin<1 || isempty(N), N = 1024; end
    if nargin<2 || isempty(base), base = 0.25; end
    if nargin<3 || isempty(on), on = [0.05 0.28 0.52 0.76]; end
    if nargin<4 || isempty(off), off = [0.18 0.41 0.65 0.89]; end
    if nargin<5 || isempty(amp), amp = [0.22 0.20 0.23 0.19]; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    f = base + 0.18*x;
    for k = 1:numel(on)
        f = f + amp(k)*(S(x,on(k),0.018)-S(x,off(k),0.038));
    end
    f = f + 0.025*sin(2*pi*4*x);
    meta = struct;
    meta.ID = "TF217";
    meta.Name = "Thermostat Cycle";
    meta.Category = 11;
    meta.RecommendedN = 1024;
    meta.Parameters = struct('base',base,'on',on,'off',off,'amp',amp);
    meta.Morphology = "Repetitive on-off steps with low-frequency drift";
end

function [x,f,meta] = TF218_AtmosphericRiver(N, u0, mainScale)
    if nargin<1 || isempty(N), N = 1024; end
    if nargin<2 || isempty(u0), u0 = 0.12; end
    if nargin<3 || isempty(mainScale), mainScale = 0.82; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    u = max(x-u0,0);
    main = (x>=u0).*(u/0.16).^2.*exp(2-u/0.16);
    main = main/max(main);
    f = 0.12 + mainScale*main + 0.16*G(x,0.43,0.025) + 0.12*G(x,0.58,0.032) - 0.07*G(x,0.71,0.018);
    meta = struct;
    meta.ID = "TF218";
    meta.Name = "Atmospheric River";
    meta.Category = 11;
    meta.RecommendedN = 1024;
    meta.Parameters = struct('u0',u0,'mainScale',mainScale);
    meta.Morphology = "Normalized main pulse with subsidiary bumps and dips";
end

function [x,f,meta] = TF219_HeatwaveFrontBreak(N, base, modAmp)
    if nargin<1 || isempty(N), N = 1024; end
    if nargin<2 || isempty(base), base = 0.18; end
    if nargin<3 || isempty(modAmp), modAmp = 0.02; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    f = base + 0.72*S(x,0.28,0.075) - 0.82*S(x,0.79,0.012);
    f = f + (modAmp+0.05*S(x,0.35,0.08)).*sin(2*pi*9*x);
    meta = struct;
    meta.ID = "TF219";
    meta.Name = "Heatwave Front Break";
    meta.Category = 11;
    meta.RecommendedN = 1024;
    meta.Parameters = struct('base',base,'modAmp',modAmp);
    meta.Morphology = "Slow front with sharp break and modulated ripples";
end

function [x,f,meta] = TF220_DroughtRecovery(N, a, b, c1, c2)
    if nargin<1 || isempty(N), N = 1024; end
    if nargin<2 || isempty(a), a = 1; end
    if nargin<3 || isempty(b), b = -0.62; end
    if nargin<4 || isempty(c1), c1 = 0.78; end
    if nargin<5 || isempty(c2), c2 = 0.92; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    f = a + b*x.^1.35 + 0.37*S(x,c1,0.018) - 0.08*S(x,c2,0.03);
    meta = struct;
    meta.ID = "TF220";
    meta.Name = "Drought Recovery";
    meta.Category = 12;
    meta.RecommendedN = 1024;
    meta.Parameters = struct('a',a,'b',b,'c1',c1,'c2',c2);
    meta.Morphology = "Long-term decline with late recovery bumps";
end

function [x,f,meta] = TF221_ENSOEnvelope(N, ampBase, ampMod, phaseLin, phaseQuad)
    if nargin<1 || isempty(N), N = 1024; end
    if nargin<2 || isempty(ampBase), ampBase = 0.45; end
    if nargin<3 || isempty(ampMod), ampMod = 0.20; end
    if nargin<4 || isempty(phaseLin), phaseLin = 2.1; end
    if nargin<5 || isempty(phaseQuad), phaseQuad = 0.22; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    amp = ampBase + ampMod*sin(2*pi*0.75*x+0.4);
    phase = 2*pi*(phaseLin*x + phaseQuad*x.^2);
    f = amp.*sin(phase) + 0.22*G(x,0.28,0.06) - 0.18*G(x,0.57,0.07) + 0.25*G(x,0.83,0.045);
    meta = struct;
    meta.ID = "TF221";
    meta.Name = "ENSO Envelope";
    meta.Category = 12;
    meta.RecommendedN = 1024;
    meta.Parameters = struct('ampBase',ampBase,'ampMod',ampMod,'phaseLin',phaseLin,'phaseQuad',phaseQuad);
    meta.Morphology = "Amplitude-modulated oscillation with localized bumps";
end

function [x,f,meta] = TF222_BubbleLogPeriodic(N, xc, preAmp, postScale)
    if nargin<1 || isempty(N), N = 1024; end
    if nargin<2 || isempty(xc), xc = 0.83; end
    if nargin<3 || isempty(preAmp), preAmp = 1.05; end
    if nargin<4 || isempty(postScale), postScale = 0.42; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    f = zeros(size(x));
    pre = x < xc;
    t = max(xc - x, 1e-5);
    f(pre) = 1 - preAmp*t(pre).^0.55.*(1+0.14*cos(8.5*log(t(pre))+0.4));
    u = max(x - xc, 0);
    idx = ~pre;
    f(idx) = 0.24 + postScale*(1-exp(-u(idx)/0.12)) + 0.03*sin(2*pi*18*u(idx)).*exp(-12*u(idx));
    meta = struct;
    meta.ID = "TF222";
    meta.Name = "Bubble Log-Periodic";
    meta.Category = 12;
    meta.RecommendedN = 1024;
    meta.Parameters = struct('xc',xc,'preAmp',preAmp,'postScale',postScale);
    meta.Morphology = "Pre-crash log-periodic approach and post-crash relaxation";
end

function [x,f,meta] = TF223_IntradayVolatilityU(N, baseline, spikeA, spikeC)
    if nargin<1 || isempty(N), N = 1024; end
    if nargin<2 || isempty(baseline), baseline = 0.16; end
    if nargin<3 || isempty(spikeA), spikeA = [0.18 0.10 0.12 0.20]; end
    if nargin<4 || isempty(spikeC), spikeC = [0.08 0.32 0.71 0.93]; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    f = baseline + 2.2*(x-0.5).^2 + 0.025*sin(2*pi*45*x).*(1+2.5*abs(x-0.5));
    c = spikeC;
    a = spikeA;
    w = [0.008 0.006 0.007 0.006];
    for k = 1:4
        f = f + a(k)*G(x,c(k),w(k));
    end
    meta = struct;
    meta.ID = "TF223";
    meta.Name = "Intraday Volatility U";
    meta.Category = 12;
    meta.RecommendedN = 1024;
    meta.Parameters = struct('baseline',baseline,'spikeA',spikeA,'spikeC',spikeC);
    meta.Morphology = "U-shaped baseline with localized intraday spikes";
end

function [x,f,meta] = TF224_LiquidityDrought(N, a0, slope, stepCenter)
    if nargin<1 || isempty(N), N = 1024; end
    if nargin<2 || isempty(a0), a0 = 0.95; end
    if nargin<3 || isempty(slope), slope = -0.38; end
    if nargin<4 || isempty(stepCenter), stepCenter = 0.61; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    f = a0 + slope*x - 0.34*S(x,stepCenter,0.008);
    u = max(x-stepCenter,0);
    f = f + (x>=stepCenter).*0.27.*(1-exp(-u/0.18)) + 0.07*G(x,0.595,0.010) - 0.10*G(x,0.625,0.012);
    meta = struct;
    meta.ID = "TF224";
    meta.Name = "Liquidity Drought";
    meta.Category = 12;
    meta.RecommendedN = 1024;
    meta.Parameters = struct('a0',a0,'slope',slope,'stepCenter',stepCenter);
    meta.Morphology = "Linear decline with step recovery and local bumps";
end

function [x,f,meta] = TF225_YieldShockRecovery(N)
    if nargin<1 || isempty(N), N = 1024; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    f = 0.18 + 0.10*x;
    c = [0.43 0.76];
    a = [0.72 -0.32];
    t1 = [0.055 0.040];
    t2 = [0.24 0.14];
    for k = 1:2
        u = max(x-c(k),0);
        f = f + (x>=c(k)).*a(k).*(0.72*exp(-u/t1(k))+0.28*exp(-u/t2(k)));
    end
    meta = struct;
    meta.ID = "TF225";
    meta.Name = "Yield Shock + Recovery";
    meta.Category = 12;
    meta.RecommendedN = 1024;
    meta.Parameters = struct;
    meta.Morphology = "Sudden shocks followed by fast and slow recoveries";
end

function [x,f,meta] = TF226_AnalyticNearPole(N, xc, width)
    if nargin<1 || isempty(N), N = 1024; end
    if nargin<2 || isempty(xc), xc = 0.52; end
    if nargin<3 || isempty(width), width = 0.015; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    raw = 1./((x-xc).^2 + width^2);
    f = raw./max(raw);
    meta = struct;
    meta.ID = "TF226";
    meta.Name = "Analytic Near-Pole";
    meta.Category = 12;
    meta.RecommendedN = 1024;
    meta.Parameters = struct('xc',xc,'width',width);
    meta.Morphology = "Normalized sharp peak from near-pole singularity";
end

function [x,f,meta] = TF227_ChirpCuspCollision(N, xc, pow1, pow2, chirpAmp, chirpScale, chirpOffset)
    if nargin<1 || isempty(N), N = 1024; end
    if nargin<2 || isempty(xc), xc = 0.52; end
    if nargin<3 || isempty(pow1), pow1 = 0.5; end
    if nargin<4 || isempty(pow2), pow2 = 1/3; end
    if nargin<5 || isempty(chirpAmp), chirpAmp = 0.48; end
    if nargin<6 || isempty(chirpScale), chirpScale = 0.18; end
    if nargin<7 || isempty(chirpOffset), chirpOffset = 0.004; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    u = x-xc; au = abs(u);
    f = au.^pow1 + chirpAmp*au.^pow2.*sin(chirpScale./(au+chirpOffset));
    f = f - mean(f);
    f = f./max(abs(f));
    meta = struct;
    meta.ID = "TF227";
    meta.Name = "Chirp-Cusp Collision";
    meta.Category = 12;
    meta.RecommendedN = 1024;
    meta.Parameters = struct('xc',xc,'pow1',pow1,'pow2',pow2,'chirpAmp',chirpAmp,'chirpScale',chirpScale,'chirpOffset',chirpOffset);
    meta.Morphology = "Cusp with embedded short-scale chirp";
end

function [x,f,meta] = TF228_LogPeriodicCusp(N, xc, pow, modAmp, freq, eps)
    if nargin<1 || isempty(N), N = 1024; end
    if nargin<2 || isempty(xc), xc = 0.57; end
    if nargin<3 || isempty(pow), pow = 0.34; end
    if nargin<4 || isempty(modAmp), modAmp = 0.62; end
    if nargin<5 || isempty(freq), freq = 10.5; end
    if nargin<6 || isempty(eps), eps = 0.0025; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    u = x-xc; au = abs(u);
    f = au.^pow.*(1+modAmp*sin(freq*log(au+eps)));
    f = f - mean(f);
    f = f./max(abs(f));
    meta = struct;
    meta.ID = "TF228";
    meta.Name = "Log-Periodic Cusp";
    meta.Category = 12;
    meta.RecommendedN = 1024;
    meta.Parameters = struct('xc',xc,'pow',pow,'modAmp',modAmp,'freq',freq,'eps',eps);
    meta.Morphology = "Cusp with log-periodic modulation";
end

function [x,f,meta] = TF229_CancellationNeedle(N, g1Amp, g1Wide, g1ToneAmp, g2Scale, needleA, needlePos, needleW1, needleW2, smallAdd)
    if nargin<1 || isempty(N), N = 1024; end
    if nargin<2 || isempty(g1Amp), g1Amp = 1.10; end
    if nargin<3 || isempty(g1Wide), g1Wide = 0.18; end
    if nargin<4 || isempty(g1ToneAmp), g1ToneAmp = 0.22; end
    if nargin<5 || isempty(g2Scale), g2Scale = 1.004; end
    if nargin<6 || isempty(needleA), needleA = 0.16; end
    if nargin<7 || isempty(needlePos), needlePos = 0.635; end
    if nargin<8 || isempty(needleW1), needleW1 = 0.006; end
    if nargin<9 || isempty(needleW2), needleW2 = 0.009; end
    if nargin<10 || isempty(smallAdd), smallAdd = 0.018; end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    g1 = g1Amp*G(x,0.50,g1Wide) + g1ToneAmp*sin(2*pi*2*x);
    g2 = g2Scale*g1 + smallAdd*G(x,0.44,0.10);
    needle = G(x,needlePos,needleW1) - 0.62*G(x,0.648,needleW2);
    f = g1 - 0.995*g2 + needleA*needle;
    f = f./max(abs(f));
    meta = struct;
    meta.ID = "TF229";
    meta.Name = "Cancellation Needle";
    meta.Category = 12;
    meta.RecommendedN = 1024;
    meta.Parameters = struct('g1Amp',g1Amp,'g1Wide',g1Wide,'g1ToneAmp',g1ToneAmp,'g2Scale',g2Scale,'needleA',needleA,'needlePos',needlePos,'needleW1',needleW1,'needleW2',needleW2,'smallAdd',smallAdd);
    meta.Morphology = "Nearly cancelling components leaving a narrow needle";
end

function [x,f,meta] = TF230_RegularityQuilt(N, intervals)
    if nargin<1 || isempty(N), N = 1024; end
    if nargin<2 || isempty(intervals)
        intervals = [0 .2 4 1.00; .2 .4 3 -.85; .4 .6 2 .90; .6 .8 1.5 -.80; .8 1.0 .5 .65];
    end
    validateattributes(N,{'numeric'},{'scalar','integer','>=',2});
    x = linspace(0,1,N).';
    f = zeros(size(x));
    for k = 1:size(intervals,1)
        aa = intervals(k,1); bb = intervals(k,2); pp = intervals(k,3); A0 = intervals(k,4);
        m = x>=aa & x<=bb;
        s = (x(m)-aa)/(bb-aa);
        bump = (4*s.*(1-s)).^pp;
        f(m) = A0*bump;
    end
    meta = struct;
    meta.ID = "TF230";
    meta.Name = "Regularity Quilt";
    meta.Category = 12;
    meta.RecommendedN = 1024;
    meta.Parameters = struct('intervals',intervals);
    meta.Morphology = "Piecewise bumps with varying regularity and sign";
end

function y = S(x,center,width)
%S Smooth step centered at center.

validateattributes(width,{'numeric'}, ...
    {'scalar','real','finite','positive'}, ...
    mfilename,'width');

y = 0.5*(1+tanh((x-center)./width));
end


function y = G(x,center,width)
%G Unit-height Gaussian pulse.

validateattributes(width,{'numeric'}, ...
    {'scalar','real','finite','positive'}, ...
    mfilename,'width');

y = exp(-0.5*((x-center)./width).^2);
end










































































































































































































































































