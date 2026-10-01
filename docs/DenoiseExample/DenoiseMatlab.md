```matlab

%% Experiment configuration
% select a signal
signalID = "TF001";

% select signal length
N = 1024;

% Generate and normalize the BEND-1D signal
[x,fNative,meta] = generate(signalID,N);

%%

% specify noise level
noiseSigma = 0.20;

% Linear power ratio
targetSNR = 5;             

[fClean,normalization] = normalizeSNR( fNative,noiseSigma,targetSNR);

noise = noiseSigma*randn(size(fClean));

NoisySignal = fClean + noise;

fprintf("Signal: %s %s\n",meta.ID,meta.Name);
fprintf("Sample size: %d\n",N);
fprintf("Target linear SNR: %.3f\n",targetSNR);
fprintf("Noise standard deviation: %.3f\n",noiseSigma);

% plot clean and noisy signals
figure("Color","white");
plot(x,fClean,"k","LineWidth",2.0, "DisplayName","Clean signal");
hold on;
plot(x,NoisySignal,".", ...
    "Color",[0.65 0.65 0.65], "MarkerSize",4, "DisplayName","Noisy signal");
xlabel("x");
ylabel("Signal value");
title(meta.ID + " " + meta.Name + ": Clean and Noisy Signals");
legend("Location","best");
xlim([0 1]);
grid on;
box on;

%%

% select a wavelet filter
waveletName = "db4";

% number of wavelet decomposition levels
requestedLevel = 5;

maximumLevel = wmaxlev(N,waveletName);
decompositionLevel = min(requestedLevel,maximumLevel);

if decompositionLevel < requestedLevel
    warning("BEND1D:ReducedWaveletLevel", ...
        ["The requested level %d is not available. " + ...
        "Using level %d instead."], requestedLevel,decompositionLevel);
end

%% Allocate simulation results
methodNames = [ "Hard thresholding"
    "Soft thresholding"];


HardEstimate = exampleWaveletThreshold( NoisySignal,waveletName,decompositionLevel,"hard");

SoftEstimate = exampleWaveletThreshold( NoisySignal,waveletName,decompositionLevel,"soft");

figure("Color","white");

plot(x,fClean,"k","LineWidth",2.0, "DisplayName","Clean signal");
hold on;

plot(x,NoisySignal,".", "Color",[0.65 0.65 0.65], "MarkerSize",4, ...
    "DisplayName","Noisy signal");

plot(x, HardEstimate, "Color",[0.8500 0.3250 0.0980], "LineWidth",1.4, ...
    "DisplayName","Hard thresholding");

plot(x, SoftEstimate, "Color",[0 0.4470 0.7410], "LineWidth",1.4, ...
    "DisplayName","Soft thresholding");

xlabel("x");
ylabel("Signal value");
title(meta.ID + " " + meta.Name + ": Wavelet-Denoising Example");
subtitle("SNR = " + targetSNR + ", \sigma = " + noiseSigma + ...
    ", wavelet = " + waveletName);
legend("Location","best");
xlim([0 1]);
grid on;
box on;

mseHard = mean((HardEstimate-fClean).^2);

mseSoft = mean((SoftEstimate-fClean).^2);

fprintf("MSE Hard Thresholding: %.5f\n", mseHard);
fprintf("MSE Soft Thresholding: %.5f\n ",mseSoft);

%% Repeat the denoising 100 times

numberOfMethods = numel(methodNames);
mseResults = zeros(numberOfReplications,numberOfMethods);

firstNoisySignal = [];
firstHardEstimate = [];
firstSoftEstimate = [];


numberOfReplications = 100;
randomSeed = 2026;

%% Run the Monte Carlo experiment

rng(randomSeed,"twister");

for replication = 1:numberOfReplications

    noise = noiseSigma*randn(size(fClean));
    y = fClean + noise;

    fHard = exampleWaveletThreshold( y,waveletName,decompositionLevel,"hard");

    fSoft = exampleWaveletThreshold( y,waveletName,decompositionLevel,"soft");

    mseResults(replication,1) = mean((fHard-fClean).^2);

    mseResults(replication,2) = mean((fSoft-fClean).^2);

    if replication == 1
        firstNoisySignal = y;
        firstHardEstimate = fHard;
        firstSoftEstimate = fSoft;
    end
end

%% Summarize performance

averageMSE = mean(mseResults,1);
standardDeviationMSE = std(mseResults,0,1);
standardErrorMSE = standardDeviationMSE/sqrt(numberOfReplications);

confidenceHalfWidth = 1.96*standardErrorMSE;

lowerConfidenceLimit = max( averageMSE-confidenceHalfWidth,0);

upperConfidenceLimit = averageMSE+confidenceHalfWidth;

resultsTable = table( ...
    methodNames, averageMSE.', standardDeviationMSE.', standardErrorMSE.', lowerConfidenceLimit.', upperConfidenceLimit.', ...
    'VariableNames',{ 'Method','AMSE', 'SD_MSE','SE_AMSE', 'CI95_Lower', 'CI95_Upper'});

fprintf("\nDenoising Results\n");
fprintf("=================\n");
disp(resultsTable);

%% Plot the first realization

figure("Color","white");

plot(x,fClean,"k","LineWidth",2.0, "DisplayName","Clean signal");
hold on;

plot(x,firstNoisySignal,".", "Color",[0.65 0.65 0.65], "MarkerSize",4, "DisplayName","Noisy signal");

plot(x,firstHardEstimate, "Color",[0.8500 0.3250 0.0980], "LineWidth",1.4, "DisplayName","Hard thresholding");

plot(x,firstSoftEstimate, "Color",[0 0.4470 0.7410], "LineWidth",1.4, "DisplayName","Soft thresholding");

xlabel("x");
ylabel("Signal value");
title(meta.ID + " " + meta.Name + ": Wavelet-Denoising Example");
subtitle("SNR = " + targetSNR + ...
    ", \sigma = " + noiseSigma + ...
    ", wavelet = " + waveletName);
legend("Location","best");
xlim([0 1]);
grid on;
box on;

%% Plot AMSE and confidence intervals

figure("Color","white");

barHandle = bar( categorical(methodNames),averageMSE,0.65);

barHandle.FaceColor = "flat";
barHandle.CData = [
    0.8500 0.3250 0.0980
    0.0000 0.4470 0.7410
];

hold on;

errorbar( ...
    1:numberOfMethods,averageMSE, ...
    averageMSE-lowerConfidenceLimit, ...
    upperConfidenceLimit-averageMSE, ...
    "k.","LineWidth",1.4,"CapSize",10);

ylabel("Average mean squared error");
title("Denoising Performance for " + ...
    meta.ID + " " + meta.Name);
subtitle(numberOfReplications + ...
    " Monte Carlo replications; error bars are 95% confidence intervals");
grid on;
box on;

%% Plot replication-level MSE distributions

figure("Color","white");

boxchart( ...
    categorical(repelem(methodNames,numberOfReplications)), ...
    mseResults(:));

ylabel("Mean squared error");
title("Replication-Level Denoising Errors");
subtitle(meta.ID + " " + meta.Name + ...
    ", SNR = " + targetSNR);
grid on;
box on;

```
