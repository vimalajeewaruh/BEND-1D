function [x,f,meta] = generate(signalID,N,varargin)
%GENERATE Generate a BEND-1D signal.
%
%   [x,f,meta] = generate("TF001")
%   [x,f,meta] = generate("TF001",2048)
%   [x,f,meta] = generate("TF001",2048,0.38,0.41)

    signalID = upper(strtrim(string(signalID)));

    T = catalog;
    index = find(T.ID == signalID,1);

    if isempty(index)
        available = strjoin(T.ID,", ");

        error("BEND1D:UnknownSignal", ...
            "Unknown signal identifier '%s'. Available signals: %s", ...
            signalID,available);
    end

    if nargin < 2 || isempty(N)
        N = T.RecommendedN(index);
    end

    validateattributes(N,{'numeric'}, ...
        {'scalar','integer','>=',2}, ...
        mfilename,'N');

    % bend1d.m decides which local signal function to execute.
    [x,f,meta] = SignalBank( ...
    signalID,N,varargin{:});
end