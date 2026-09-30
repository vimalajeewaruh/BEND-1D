# EEGSpindle

## Overview

The **EEGSpindle** signal represents a localized sleep-spindle-like oscillatory burst on a low-frequency EEG background. The spindle has a smooth envelope and mildly varying instantaneous frequency.

## Mathematical Definition

Define the background component

```math
B(x)=A_1\sin(\omega_1x+\delta_1)
+A_2\sin(\omega_2x+\delta_2).
```

Define the spindle envelope

```math
E(x)=\exp\left[
-\frac12\left(\frac{x-\mu_S}{s_S}\right)^2
\right].
```

Define the spindle phase

```math
\phi(x)=2\pi\left[
f_Sx+\beta(x-\mu_S)^2
\right].
```

The signal is

```math
f(x)=B(x)+A_SE(x)\sin\phi(x).
```

[View EEGSpindle signal](../../assets/images/TF061_EEGSpindle.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Localized frequency-modulated oscillatory packet |
| Spindle center | $x=\mu_S$ |
| Envelope width | $s_S$ |
| Background | Two weak low-frequency components |
| Main challenge | Preserving packet coherence without retaining noise |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $A_1,A_2$ | Background amplitudes | 0.055, 0.028 |
| $\omega_1,\omega_2$ | Background angular frequencies | $8.4\pi,14.2\pi$ |
| $\delta_1,\delta_2$ | Background phase shifts | 0.3, -0.5 |
| $\mu_S$ | Spindle center | 0.56 |
| $s_S$ | Spindle envelope width | 0.115 |
| $A_S$ | Spindle amplitude | 0.39 |
| $f_S$ | Nominal spindle frequency | 20 |
| $\beta$ | Quadratic phase coefficient | 2.2 |

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
