# BEND-1D

**BEND-1D** is a reproducible MATLAB library of 230 one-dimensional benchmark signals for evaluating denoising, smoothing, feature-extraction, and statistical signal-processing methods. The signals are organized into ten morphology-oriented categories spanning smooth trends, discontinuities, oscillations, transients, singularities, multiscale structure, biomedical waveforms, measurement signals, and complex mixed morphologies.

The library provides a common interface for signal generation, catalog browsing, metadata lookup, and centered-power signal-to-noise ratio (SNR) normalization.

## Key features

- 230 deterministic one-dimensional benchmark signals.
- Ten morphology-based signal categories.
- Reproducible signal generation at user-selected sample sizes.
- Catalog lookup by unique `TF###` identifier or signal name.
- Consistent metadata returned with every signal.
- Linear-ratio and decibel centered-power SNR normalization.
- Automated structural and integration tests for every category.
- Installable MATLAB toolbox distribution (`.mltbx`).

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

For noise standard deviation \(\sigma\), linear power SNR is defined as

```math
\operatorname{SNR}=\frac{P_f}{\sigma^2}.
```

The DC level is preserved but is not counted as signal power.

### Linear SNR

```matlab
[x,f,meta] = generate("TF001",1024);

sigma = 0.20;
targetSNR = 5;

[fScaled,normalization] = normalizeSNR( ...
    f,sigma,targetSNR);

rng(2026,"twister");
y = fScaled + sigma*randn(size(fScaled));
```

### SNR in decibels

```matlab
targetSNRdB = 7;

[fScaled,normalization] = normalizeSNR( ...
    f,sigma,targetSNRdB,"dB");
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

## Reproducible simulation practice

When reporting an experiment using BEND-1D, record:

- BEND-1D version;
- signal ID and name;
- MATLAB release;
- sample size;
- signal-specific parameter values;
- noise distribution and parameters;
- SNR definition, units, and target;
- random-number seed;
- number of Monte Carlo replications; and
- method names and tuning parameters.

Within each Monte Carlo replication, competing methods should receive exactly the same noisy realization.

## Testing

The category test suite verifies catalog consistency, dispatcher connectivity, output dimensions, finite real values, unit-interval sampling grids, nonconstant output, metadata, information lookup, SNR normalization, parameter forwarding, and expected error handling.

To test a selected category from the repository root:

```matlab
projectRoot = "/path/to/bend1d";
addpath(fullfile(projectRoot,"toolbox"));

categoryNumber = 5;
setenv("BEND1D_TEST_CATEGORY",string(categoryNumber));

testFile = fullfile( ...
    projectRoot,"tests","testSignalCategory.m");

results = runtests(testFile);
disp(table(results));
```

To build the toolbox, run:

```matlab
run(fullfile(projectRoot,"buildToolbox.m"));
```

The build script tests all ten categories before creating the `.mltbx` file.

Passing the automated tests establishes software and structural validity. It does not, by itself, prove that every signal has the intended scientific interpretation; morphology-specific validation should also use the documented definitions and reference figures.

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

BEND-1D follows semantic versioning:

- major version: incompatible public-interface changes;
- minor version: backward-compatible additions; and
- patch version: backward-compatible corrections.

The initial release is Version 1.0.0.

## Citation

If BEND-1D contributes to published research, please cite the software release. Replace the repository URL and DOI below after the public archive is available.

```text
Vimalajeewa, D. (2026). BEND-1D: A morphology-balanced library of
one-dimensional benchmark signals (Version 1.0.0) [Computer software].
Repository URL. DOI.
```

Suggested BibTeX:

```bibtex
@software{vimalajeewa2026bend1d,
  author  = {Vimalajeewa, Dixon},
  title   = {BEND-1D: A Morphology-Balanced Library of
             One-Dimensional Benchmark Signals},
  year    = {2026},
  version = {1.0.0},
  url     = {REPOSITORY-URL},
  doi     = {RELEASE-DOI}
}
```

## License

See the `LICENSE` file for the terms governing use and redistribution. Add the selected license before publishing the first public release.

## Author

**Dixon Vimalajeewa**  
Department of Statistics  
University of Nebraska–Lincoln

Project repository: `REPOSITORY-URL`  
Contact: `PUBLIC-CONTACT-EMAIL`

## Acknowledgment

If the library is used in a publication, please identify the BEND-1D version and the exact TF identifiers used so that the experiment can be reproduced.

