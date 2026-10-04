# MRFreeInductionDecay


## Overview

The **MRFreeInductionDecay** signal sums four damped oscillations with different frequencies, phases, amplitudes, and relaxation rates. One component is weak but long-lived.

## Mathematical Definition

For $k=1,\ldots,K$, define the damped oscillatory component

```math
D_k(x)=
A_k e^{-\alpha_k x}
\cos(2\pi f_kx+\delta_k).
```

The signal is

```math
f(x)=
\sum_{k=1}^{K}D_k(x).
```

The component amplitudes, decay rates, frequencies, and phase shifts are

```math
\mathbf{A}
=
(0.55,\,0.34,\,0.18,\,0.06),
```

```math
\boldsymbol{\alpha}
=
(3.5,\,7,\,1.2,\,0.55),
```

```math
\mathbf{f}
=
(18,\,31,\,8,\,43),
```

```math
\boldsymbol{\delta}
=
(0,\,0.3,\,-0.5,\,0.8).
```

[View MRFreeInductionDecay signal](../../assets/images/TF132_MRFreeInductionDecay.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Multicomponent damped oscillation |
| Frequencies | $8$, $18$, $31$, and $43$ cycles per unit interval |
| Relaxation rates | $0.55$, $1.2$, $3.5$, and $7$ |
| Weak long-lived component | Small-amplitude component with decay rate $\alpha_4$ and frequency $f_4$ |
| Main challenge | Preserving weak, long-lived spectral information |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $K$ | Number of damped oscillatory components | 4 |
| $\mathbf{A}$ | Component amplitudes | $(0.55,\,0.34,\,0.18,\,0.06)$ |
| $\boldsymbol{\alpha}$ | Decay rates | $(3.5,\,7,\,1.2,\,0.55)$ |
| $\mathbf{f}$ | Component frequencies | $(18,\,31,\,8,\,43)$ |
| $\boldsymbol{\delta}$ | Phase shifts | $(0,\,0.3,\,-0.5,\,0.8)$ |
## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF132_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF132_python.md)



## Recommended Uses

- MR free-induction denoising
- Multirate-decay recovery
- Weak spectral-component preservation

## Provenance

**Status:** Magnetic-resonance-FID-inspired deterministic surrogate.

---

[← Previous: EEGSeizureOnset](TF131_EEGSeizureOnset.md) | [Category 8 Catalog](index.md) | [Next: ATACChromatinAccessibility →](TF133_ATACChromatinAccessibility.md)
