# PlateWear

## Overview

The **PlateWear** signal represents a print-quality measurement accumulated over a production run. Progressive deterioration is interrupted by a maintenance event that partially restores performance, after which wear resumes at a different rate.

## Mathematical Definition

Define

$$
w_1(x)=1-0.38x^{0.82},
$$

$$
M(x)=\frac{0.20}{1+e^{-160(x-0.56)}},
$$

$$
w_2(x)=-0.28(x-0.56)_+,
$$

and

$$
m(x)=0.018\sin(24\pi x)(1-0.4x).
$$

Then

$$
f(x)=w_1(x)+M(x)+w_2(x)+m(x).
$$

[PlateWear signal](../../assets/images/TF046_PlateWear.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Long smooth trend with discrete intervention |
| Pre-maintenance behavior | Gradual nonlinear deterioration |
| Maintenance location | $x=0.56$ |
| Fine structure | Weak decreasing-amplitude oscillation |
| Main challenge | Preserving a reset embedded in long-term wear |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $0.56$ | Maintenance location | 0.56 |
| $160$ | Reset sharpness | 160 |
| $12$ | Microwear frequency | 12 |

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
