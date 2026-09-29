function [fScaled,details] = normalizeSNR( ...
    f,sigma,targetSNR,snrUnits)
%NORMALIZESNR Rescale a BEND-1D signal to a target centered-power SNR.
%
%   fScaled = normalizeSNR(f,sigma,targetSNR)
%
%   fScaled = normalizeSNR( ...
%       f,sigma,targetSNR,snrUnits)
%
%   [fScaled,details] = normalizeSNR(...)
%
% Inputs
%   f          - Clean signal in its native scale.
%   sigma      - Noise standard deviation.
%   targetSNR  - Target signal-to-noise ratio.
%   snrUnits   - "linear" or "dB". Default: "linear".
%
% Outputs
%   fScaled    - Signal rescaled to the requested centered-power SNR.
%   details    - Structure containing normalization information.
%
% The centered signal power is
%
%       mean((f-mean(f)).^2).
%
% The DC level is preserved but is not counted as signal power.
%
% Examples
%   fScaled = normalizeSNR(f,0.2,5);
%   fScaled = normalizeSNR(f,0.2,7,"dB");

    if nargin < 4 || isempty(snrUnits)
        snrUnits = "linear";
    end

    validateattributes(f,{'numeric'}, ...
        {'vector','real','finite','nonempty'}, ...
        mfilename,'f');

    validateattributes(sigma,{'numeric'}, ...
        {'scalar','real','finite','positive'}, ...
        mfilename,'sigma');

    validateattributes(targetSNR,{'numeric'}, ...
        {'scalar','real','finite'}, ...
        mfilename,'targetSNR');

    snrUnits = lower(strtrim(string(snrUnits)));

    switch snrUnits
        case {"linear","ratio"}
            if targetSNR <= 0
                error("BEND1D:InvalidSNR", ...
                    "A linear target SNR must be positive.");
            end

            targetSNRLinear = targetSNR;
            targetSNRdB = 10*log10(targetSNRLinear);

        case {"db","decibel","decibels"}
            targetSNRdB = targetSNR;
            targetSNRLinear = 10^(targetSNRdB/10);

        otherwise
            error("BEND1D:InvalidSNRUnits", ...
                "snrUnits must be either 'linear' or 'dB'.");
    end

    originalMean = mean(f(:));
    centeredSignal = f-originalMean;

    originalPower = mean(centeredSignal(:).^2);

    if originalPower <= eps(max(abs(f(:)))^2)
        error("BEND1D:ConstantSignal", ...
            ["The signal has no meaningful nonconstant component " ...
             "and cannot be normalized using centered power."]);
    end

    targetPower = targetSNRLinear*sigma^2;

    scalingFactor = sqrt(targetPower/originalPower);

    fScaled = originalMean + scalingFactor*centeredSignal;

    scaledMean = mean(fScaled(:));
    scaledCentered = fScaled-scaledMean;
    scaledPower = mean(scaledCentered(:).^2);

    achievedSNRLinear = scaledPower/sigma^2;
    achievedSNRdB = 10*log10(achievedSNRLinear);

    details = struct;
    details.NoiseStandardDeviation = sigma;
    details.OriginalMean = originalMean;
    details.OriginalCenteredPower = originalPower;
    details.TargetCenteredPower = targetPower;
    details.ScalingFactor = scalingFactor;
    details.TargetSNRLinear = targetSNRLinear;
    details.TargetSNRdB = targetSNRdB;
    details.AchievedCenteredPower = scaledPower;
    details.AchievedSNRLinear = achievedSNRLinear;
    details.AchievedSNRdB = achievedSNRdB;
end