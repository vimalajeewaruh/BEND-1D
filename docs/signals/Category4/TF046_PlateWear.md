# PlateWear

## Overview

The **PlateWear** signal represents a print-quality measurement accumulated over a production run. Progressive deterioration is interrupted by a maintenance event that partially restores performance, after which wear resumes at a different rate.

## Mathematical Definition

Define

$$
w_1(x)=b_0-A_wx^p,
$$

$$
M(x)=\frac{A_M}{1+e^{-k(x-x_c)}},
$$

$$
w_2(x)=-\gamma(x-x_c)_+,
\qquad (u)_+=\max(u,0),
$$

and

$$
m(x)=A_m\sin(\omega_m x)(1-\beta_m x).
$$

Then

$$
f(x)=w_1(x)+M(x)+w_2(x)+m(x).
$$

[View PlateWear signal](../../assets/images/TF046_PlateWear.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Long smooth trend with discrete intervention |
| Pre-maintenance behavior | Gradual nonlinear deterioration |
| Maintenance location | $x=x_c$ |
| Fine structure | Weak decreasing-amplitude oscillation |
| Main challenge | Preserving a reset embedded in long-term wear |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $b_0$ | Initial wear level | 1 |
| $A_w$ | Wear-trend amplitude | 0.38 |
| $p$ | Wear exponent | 0.82 |
| $A_M$ | Maintenance-reset amplitude | 0.20 |
| $x_c$ | Maintenance location | 0.56 |
| $k$ | Reset sharpness | 160 |
| $\gamma$ | Post-maintenance slope | 0.28 |
| $A_m$ | Microwear amplitude | 0.018 |
| $\omega_m$ | Microwear angular frequency | $24\pi$ |
| $\beta_m$ | Microwear amplitude-decay coefficient | 0.4 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF046_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF046_python.md)



## Recommended Uses

- Maintenance-reset detection
- Long-term degradation monitoring
- Trend and intervention separation
- Weak production-structure preservation

## Provenance

**Status:** Printing-plate-wear-inspired deterministic measurement surrogate.

---

[← Previous: StampReflectance](TF045_StampReflectance.md) | [Category 4 Catalog](index.md) | [Next: TreeRing →](TF047_TreeRing.md)
