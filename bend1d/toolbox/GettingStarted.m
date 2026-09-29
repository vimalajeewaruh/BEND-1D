%% BEND-1D Getting Started
%
% BEND-1D is a reproducible library of one-dimensional benchmark
% signals for evaluating denoising and smoothing methods.
%
% The library includes signals with different smoothness,
% discontinuity, oscillation, localization, multiscale, transient,
% and singularity structures.
%
% All signals are generated in their native deterministic scales.
% Power-SNR normalization is applied only when constructing a
% denoising experiment.

%% List Available Signals
%
% Use listSignals without an input to display the complete catalog.

signals = listSignals

%% List Signals from One Category
%
% Category 1 contains signals TF001--TF016.

category1Signals = listSignals(1)

%% Obtain Information About a Signal
%
% The info function accepts either the signal ID or signal name.

signalInformation = info("TF001")

% The following produces the same result:
signalInformationByName = info("Percolation")

%% Generate a Signal
%
% Generate TF001 Percolation using the recommended sample size.

[x,f,meta] = generate("TF001");

figure;

plot(x,f, ...
    "LineWidth",1.6, ...
    "Color",[0 0.4470 0.7410]);

xlabel("x");
ylabel("f(x)");
title(meta.ID + " " + meta.Name);

xlim([0 1]);
grid on;
box on;

%% Specify the Sample Size
%
% The second input to generate specifies the number of sample points.

N = 2048;

[x,f,meta] = generate("TF002",N);

figure;

plot(x,f, ...
    "LineWidth",1.6, ...
    "Color",[0.8500 0.3250 0.0980]);

xlabel("x");
ylabel("f(x)");
title(meta.ID + " " + meta.Name);

xlim([0 1]);
grid on;
box on;

%% Use Nondefault Signal Parameters
%
% Additional inputs are passed to the corresponding local signal
% function inside bend1d.m.
%
% For TF001 Percolation, the parameters are:
%
%   pc   - Critical threshold
%   beta - Critical exponent

N = 1024;
pc = 0.42;
beta = 0.50;

[x,f,meta] = generate( ...
    "TF001",N,pc,beta);

figure;

plot(x,f,"LineWidth",1.6);

xlabel("x");
ylabel("f(x)");

title( ...
    meta.ID + " " + meta.Name + ...
    ": p_c = " + pc + ...
    ", beta = " + beta);

xlim([0 1]);
grid on;
box on;

%% Normalize a Signal to a Target SNR
%
% BEND-1D uses centered signal power:
%
%   P_f = mean((f-mean(f)).^2).
%
% The signal is rescaled so that
%
%   P_f/sigma^2 = targetSNR.
%
% The target SNR below is a linear power ratio.

[x,f,meta] = generate("TF001",1024);

sigma = 0.20;
targetSNR = 5;

[fScaled,normalization] = normalizeSNR( ...
    f,sigma,targetSNR);

normalization

%% Add Reproducible Gaussian Noise
%
% Set the random-number seed before generating noise.

rng(2026,"twister");

noise = sigma*randn(size(fScaled));
y = fScaled + noise;

figure;

plot(x,fScaled, ...
    "LineWidth",1.7, ...
    "Color",[0 0.4470 0.7410]);

hold on;

plot(x,y, ...
    ".", ...
    "Color",[0.8500 0.3250 0.0980], ...
    "MarkerSize",4);

xlabel("x");
ylabel("Signal value");

title( ...
    meta.ID + " " + meta.Name + ...
    ", SNR = " + targetSNR);

legend( ...
    "Clean signal", ...
    "Noisy signal", ...
    "Location","best");

xlim([0 1]);
grid on;
box on;

%% Verify the Achieved SNR
%
% The calculated SNR should equal the requested target, apart from
% numerical rounding.

centeredSignal = fScaled-mean(fScaled(:));
signalPower = mean(centeredSignal(:).^2);

achievedSNR = signalPower/sigma^2

%% Use an SNR Specified in Decibels
%
% Use "dB" as the fourth input when the target is expressed in
% decibels.

targetSNRdB = 7;

[fScaledDB,normalizationDB] = normalizeSNR( ...
    f,sigma,targetSNRdB,"dB");

normalizationDB.AchievedSNRdB

%% Compare Several Signals
%
% The following example displays four Category 1 signals.

signalIDs = [
    "TF001"
    "TF002"
    "TF003"
    "TF004"
];

figure;

layout = tiledlayout(2,2);
layout.TileSpacing = "compact";
layout.Padding = "compact";

for k = 1:numel(signalIDs)

    [xk,fk,metak] = generate( ...
        signalIDs(k),1024);

    nexttile;

    plot(xk,fk,"LineWidth",1.4);

    xlabel("x");
    ylabel("f(x)");
    title(metak.ID + " " + metak.Name);

    xlim([0 1]);
    grid on;
    box on;
end

title(layout,"Selected BEND-1D Category 1 Signals");

%% Recommended Reproducibility Information
%
% When reporting a BEND-1D experiment, record:
%
% * Signal ID and name
% * BEND-1D version
% * MATLAB release
% * Sample size
% * Signal parameter values
% * Noise distribution
% * Noise standard deviation
% * SNR definition and target
% * Random-number seed
% * Number of Monte Carlo replications
% * Denoising method and tuning parameters
%
% Within each Monte Carlo replication, every method should receive
% exactly the same noisy signal realization.

%% Direct Access to the Signal Bank
%
% The generate function is the recommended public interface.
% However, the main signal bank can also be called directly.

[xDirect,fDirect,metaDirect] = SignalBank( ...
    "TF001",1024);

isequal(f,fDirect)

%% BEND-1D
%
% Reproducible signals, transparent code, and
% morphology-balanced evaluation for one-dimensional
% denoising research.