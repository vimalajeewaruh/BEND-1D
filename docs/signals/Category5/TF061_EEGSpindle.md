# EEGSpindle

## Overview

The **EEGSpindle** signal represents a localized sleep-spindle-like oscillatory burst on a low-frequency EEG background. The spindle has a smooth envelope and mildly varying instantaneous frequency.

## Mathematical Definition

The background is

$$
B(x)=0.055\sin(8.4\pi x+0.3)+0.028\sin(14.2\pi x-0.5).
$$

Define

$$
E(x)=\exp\!\left[-\frac12\left(\frac{x-0.56}{0.115}\right)^2\right]
$$

and

$$
\phi(x)=2\pi\left[20x+2.2(x-0.56)^2\right].
$$

The signal is

$$
f(x)=B(x)+0.39E(x)\sin\phi(x).
$$

[EEGSpindle signal](../../assets/images/TF061_EEGSpindle.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Localized frequency-modulated oscillatory packet |
| Spindle center | $x=0.56$ |
| Envelope width | 0.115 |
| Background | Two weak low-frequency components |
| Main challenge | Preserving packet coherence without retaining noise |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $0.39$ | Spindle amplitude | 0.39 |
| $20$ | Nominal spindle frequency | 20 |
| $2.2$ | Quadratic phase coefficient | 2.2 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF061_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF061_python.md)



## Recommended Uses

- Sleep-spindle detection
- Localized oscillation denoising
- Coherent-envelope preservation
- EEG background–burst separation

## Provenance

**Status:** Sleep-spindle-inspired deterministic EEG surrogate.

---

[← Previous: ArterialPulse](TF060_ArterialPulse.md) | [Category 5 Catalog](index.md) | [Next: MassSpectrum →](TF062_MassSpectrum.md)
