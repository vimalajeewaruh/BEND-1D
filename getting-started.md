# BEND-1D - MATLAB version

This page provides MATLAB version of the BEND-1D library. The library provides a common interface for signal generation, catalog browsing, metadata lookup, and centered-power signal-to-noise ratio (SNR) normalization.

## Requirements

- MATLAB R2026a or later.
- No additional MathWorks products are currently required.

Compatibility with earlier MATLAB releases has not yet been formally tested.

## Installation

### Install the packaged toolbox

1. Download `BEND-1D_1.0.0.mltbx` from the project release page.
2. Double-click the file in MATLAB, or install it from the Command Window:

```matlab
toolboxFile = "BEND-1D_1.0.0.mltbx";
installedInfo = matlab.addons.toolbox.installToolbox(toolboxFile);
disp(installedInfo);
```

After installation, the public BEND-1D functions are available on the MATLAB path.

### Use the source repository during development

```matlab
projectRoot = "/path/to/bend1d";
addpath(fullfile(projectRoot,"toolbox"));
```

## Quick start

### List all signals

```matlab
T = listSignals;
```

### List one category

```matlab
T3 = listSignals(3);
```

### Inspect one signal

```matlab
signalInformation = info("TF027");
```

Signal lookup is case-insensitive and accepts a unique TF identifier, signal name, or combined identifier and name:

```matlab
info("TF001")
info("Percolation")
info("TF001_Percolation")
```

If a name appears more than once in the catalog, use its unique `TF###` identifier.

### Generate a signal

```matlab
[x,f,meta] = generate("TF001");

plot(x,f,"LineWidth",1.5);
xlabel("x");
ylabel("f(x)");
title(meta.ID + " " + meta.Name);
grid on;
```

Calling `generate` without a sample size uses the catalog's recommended value. Specify a different sample size with the second argument:

```matlab
[x,f,meta] = generate("TF027",2048);
```

Signal-specific parameters can be passed as additional inputs. For example, TF001 Percolation accepts the critical threshold and critical exponent:

```matlab
N = 1024;
pc = 0.42;
beta = 0.50;

[x,f,meta] = generate("TF001",N,pc,beta);
```

`SignalBank` is the internal dispatcher containing the individual signal implementations. Users should normally call `generate` as the public interface.

## SNR normalization

BEND-1D generates signals in their native deterministic scales. SNR normalization is applied only when constructing a noisy experiment.

The centered signal power is

```math
P_f=\frac{1}{N}\sum_{i=1}^{N}\left(f_i-\bar f\right)^2.
```

For noise standard deviation $sigma$, linear power SNR is defined as $SNR=\frac{P_f}{\sigma^2}.$

The DC level is preserved but is not counted as signal power.

### Linear SNR

```matlab
[x,f,meta] = generate("TF001",1024);

sigma = 0.20;
targetSNR = 5;

[fScaled,normalization] = normalizeSNR(f,sigma,targetSNR);

rng(2026,"twister");
y = fScaled + sigma*randn(size(fScaled));
```

### SNR in decibels

```matlab
targetSNRdB = 7;

[fScaled,normalization] = normalizeSNR(f,sigma,targetSNRdB,"dB");
```

## Signal categories

| Category | TF identifiers | Signals | General emphasis |
|---:|---|---:|---|
| 1 | TF001–TF016 | 16 | Foundational physical, biological, and financial morphologies |
| 2 | TF017–TF026 | 10 | Low-frequency structure with weaker localized features |
| 3 | TF027–TF042 | 16 | Recurrent, pathological-onset, modulated, impulsive, and resonant signals |
| 4 | TF043–TF058 | 16 | Measurement-science and observational signals |
| 5 | TF059–TF070 | 12 | Biomedical, spectroscopic, geophysical, and energy profiles |
| 6 | TF071–TF100 | 30 | Engineering, computing, astronomy, market, audio, and environmental signals |
| 7 | TF101–TF125 | 25 | Quantum, genomic, semiconductor, space-weather, and adversarial morphologies |
| 8 | TF126–TF155 | 30 | Modern sensing systems and deliberately challenging mixed structures |
| 9 | TF156–TF180 | 25 | Nonlinear physical transitions, singularities, and matched regularity structures |
| 10 | TF181–TF230 | 50 | Complex contemporary scientific, engineering, biomedical, and analytic signals |

Use `listSignals(categoryNumber)` to obtain the authoritative signal names and metadata for any category.

## Public functions

| Function | Purpose |
|---|---|
| `catalog` | Return the complete 230-signal catalog |
| `listSignals` | List all signals or filter by category |
| `info` | Retrieve the catalog row for one signal |
| `generate` | Generate a signal using its ID and optional parameters |
| `normalizeSNR` | Rescale a signal to a target centered-power SNR |
| `SignalBank` | Dispatch to the local deterministic signal implementation |

## Repository structure

```text
bend1d/
├── README.md
├── LICENSE
├── CHANGELOG.md
├── buildToolbox.m
├── toolbox/
│   ├── SignalBank.m
│   ├── catalog.m
│   ├── generate.m
│   ├── listSignals.m
│   ├── info.m
│   ├── normalizeSNR.m
│   └── GettingStarted.m
├── tests/
│   └── testSignalCategory.m
└── build/
    └── BEND-1D_1.0.0.mltbx
```

## Versioning

The initial release is Version 1.0.0.
