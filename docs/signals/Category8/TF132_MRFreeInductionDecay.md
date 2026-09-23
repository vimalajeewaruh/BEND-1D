# MRFreeInductionDecay


## Overview

The **MRFreeInductionDecay** signal sums four damped oscillations with different frequencies, phases, amplitudes, and relaxation rates. One component is weak but long-lived.

## Mathematical Definition

$$
\begin{aligned}
f(x)={}&0.55e^{-3.5x}\cos(36\pi x)
+0.34e^{-7x}\cos(62\pi x+0.3)\\
&+0.18e^{-1.2x}\cos(16\pi x-0.5)
+0.06e^{-0.55x}\cos(86\pi x+0.8).
\end{aligned}
$$

[MRFreeInductionDecay signal](../../assets/images/TF132_MRFreeInductionDecay.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Multicomponent damped oscillation |
| Frequencies | 8, 18, 31, and 43 cycles |
| Relaxation rates | 0.55, 1.2, 3.5, and 7 |
| Main challenge | Preserving weak, long-lived spectral information |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $0.55,0.34,0.18,0.06$ | Component amplitudes | As shown |
| $3.5,7,1.2,0.55$ | Decay rates | As shown |

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
