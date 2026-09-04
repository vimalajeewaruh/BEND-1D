# MATLAB Code

The MATLAB implementation provides deterministic generators for all **230
BEND-1D signals**. Each signal is defined on the unit interval and is returned
in its native scale. Apply power–SNR normalization only when constructing a
denoising experiment.

[Browse Signals](../signals/) ·
[Python Code](python.html) ·
[Golden Rules](../golden-rules.html) ·
[Return Home](../)

---

## Requirements

- MATLAB R2019b or later is recommended.
- No specialized toolbox is required for most signals.
- Use a sample size suitable for the finest feature being studied. A common
  starting value is `N = 1024`.

## Suggested Repository Structure

```text
code/
└── matlab/
    ├── TEST_FUNCTION_LIBRARY001_016.m
    ├── TEST_FUNCTION_LIBRARY017_026.m
    ├── TEST_FUNCTION_LIBRARY027_042.m
    ├── TEST_FUNCTION_LIBRARY043_058.m
    ├── TEST_FUNCTION_LIBRARY059_070.m
    ├── TEST_FUNCTION_LIBRARY071_100.m
    ├── TEST_FUNCTION_LIBRARY101_125.m
    ├── TEST_FUNCTION_LIBRARY126_155.m
    ├── TEST_FUNCTION_LIBRARY156_180.m
    ├── TEST_FUNCTION_LIBRARY181_230.m
    └── bend_rescale_snr.m
```

You may keep the functions in ten category scripts or place each signal in a
separate function file. Whichever arrangement you choose, retain the signal
identifier and name in every filename and function header.

## Source Blocks

| Category | Signal range | Suggested MATLAB file |
|---|---:|---|
| Category 1 | TF001–TF016 | `TEST_FUNCTION_LIBRARY001_016.m` |
| Category 2 | TF017–TF026 | `TEST_FUNCTION_LIBRARY017_026.m` |
| Category 3 | TF027–TF042 | `TEST_FUNCTION_LIBRARY027_042.m` |
| Category 4 | TF043–TF058 | `TEST_FUNCTION_LIBRARY043_058.m` |
| Category 5 | TF059–TF070 | `TEST_FUNCTION_LIBRARY059_070.m` |
| Category 6 | TF071–TF100 | `TEST_FUNCTION_LIBRARY071_100.m` |
| Category 7 | TF101–TF125 | `TEST_FUNCTION_LIBRARY101_125.m` |
| Category 8 | TF126–TF155 | `TEST_FUNCTION_LIBRARY126_155.m` |
| Category 9 | TF156–TF180 | `TEST_FUNCTION_LIBRARY156_180.m` |
| Category 10 | TF181–TF230 | `TEST_FUNCTION_LIBRARY181_230.m` |

[Browse the complete MATLAB source on GitHub][matlab-source]

## Quick Start

The following example generates **Planck** in its native scale.

```matlab
N = 1024;
x = linspace(0,1,N);

lambda = 0.08 + 0.92*x;
f = lambda.^(-5) ./ (exp(2.5./lambda) - 1);

figure;
plot(x,f,'LineWidth',1.5);
xlabel('x');
ylabel('f(x)');
title('TF002 Planck');
grid on;
```

## Common Power–SNR Normalization

```matlab
function fScaled = bend_rescale_snr(f, sigma, targetSNR)
%BEND_RESCALE_SNR Rescale centered signal power to a target linear SNR.
%
% targetSNR is a power ratio, not a value in decibels.

    fMean = mean(f);
    centered = f - fMean;
    signalPower = mean(centered.^2);

    if signalPower <= 0
        error('The signal must have a nonconstant component.');
    end

    scale = sqrt(targetSNR * sigma^2 / signalPower);
    fScaled = fMean + scale * centered;
end
```

Example use:

```matlab
sigma = 0.20;
targetSNR = 4;                 % linear power ratio
fScaled = bend_rescale_snr(f, sigma, targetSNR);

rng(2026);                    % reproducible noise
y = fScaled + sigma*randn(size(fScaled));
```

If the target is specified in decibels, convert it first:

```matlab
targetSNRdB = 6;
targetSNR = 10^(targetSNRdB/10);
```

## Reproducible Experiments

For each reported experiment, record:

- the signal identifier and name;
- the BEND-1D version or Git commit;
- the sample size `N` and sampling grid;
- all nondefault signal parameters;
- the noise model, noise standard deviation, and SNR convention;
- the random-number seed and number of Monte Carlo replications; and
- the denoising method and its tuning parameters.

Within each Monte Carlo replication, give every denoising method the **same
noisy realization**. See the [Golden Rules](../golden-rules.html) for the full
evaluation protocol.

## Signal-Level Implementations

Every page in the [signal catalog](../signals/) contains a standalone MATLAB
implementation for that signal. These examples are useful when you need only
one function; the category scripts are more convenient for generating a
complete benchmark block.

## Reporting Problems

If a MATLAB implementation produces an unexpected result, report the signal
ID, MATLAB release, sample size, parameter values, and a minimal script in the
[repository issue tracker][issues].

---

[← Return to BEND-1D](../) · [Python Code →](python.html)

<!-- Replace YOUR-USERNAME/YOUR-REPOSITORY in the links below. -->
[matlab-source]: https://github.com/YOUR-USERNAME/YOUR-REPOSITORY/tree/main/code/matlab
[issues]: https://github.com/YOUR-USERNAME/YOUR-REPOSITORY/issues
