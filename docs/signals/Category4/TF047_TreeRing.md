# TreeRing


## Overview

The **TreeRing** signal represents annual ring-width variation. Multiscale oscillations mimic changing growth conditions, two narrow depressions represent drought episodes, and a local increase represents post-drought recovery.

## Mathematical Definition

Define the background growth pattern

$$
g(x)=b_0+A_1\sin(\omega_1x+\delta_1)
+A_2\sin(\omega_2x)
+A_3\sin(\omega_3x+\delta_3).
$$

Define the drought and recovery components

$$
D_1(x)=A_{D1}\exp\left[-\frac12\left(\frac{x-\mu_{D1}}{s_{D1}}\right)^2\right],
$$

$$
D_2(x)=A_{D2}\exp\left[-\frac12\left(\frac{x-\mu_{D2}}{s_{D2}}\right)^2\right],
$$

$$
R(x)=A_R\exp\left[-\frac12\left(\frac{x-\mu_R}{s_R}\right)^2\right].
$$

Thus

$$
f(x)=g(x)-D_1(x)-D_2(x)+R(x).
$$

[View TreeRing signal](../../assets/images/TF047_TreeRing.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Multiscale environmental variation with depressions |
| Drought centers | $x=\mu_{D1}$ and $x=\mu_{D2}$ |
| Recovery center | $x=\mu_R$ |
| Background scales | Frequencies 5, 13, and 31 |
| Main challenge | Preserving narrow environmental events within oscillatory growth |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $b_0$ | Baseline growth level | 0.75 |
| $A_1,A_2,A_3$ | Background amplitudes | 0.12, 0.07, 0.035 |
| $\omega_1,\omega_2,\omega_3$ | Background angular frequencies | $10\pi,26\pi,62\pi$ |
| $\delta_1,\delta_3$ | Background phase shifts | 0.3, 0.7 |
| $A_{D1},A_{D2}$ | Drought amplitudes | 0.42, 0.30 |
| $\mu_{D1},\mu_{D2}$ | Drought centers | 0.34, 0.72 |
| $s_{D1},s_{D2}$ | Drought widths | 0.055, 0.035 |
| $A_R$ | Recovery amplitude | 0.14 |
| $\mu_R$ | Recovery center | 0.43 |
| $s_R$ | Recovery width | 0.025 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF047_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF047_python.md)



## Recommended Uses

- Drought-event preservation
- Environmental trend denoising
- Multiscale oscillation recovery
- Local depression and rebound analysis

## Provenance

**Status:** Dendrochronology-inspired deterministic measurement surrogate.

---

[← Previous: PlateWear](TF046_PlateWear.md) | [Category 4 Catalog](index.md) | [Next: IceCore →](TF048_IceCore.md)

