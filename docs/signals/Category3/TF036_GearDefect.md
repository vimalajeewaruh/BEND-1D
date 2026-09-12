# GearDefect

## Overview

The **GearDefect** signal contains a gear-mesh carrier with lower-frequency shaft modulation in both amplitude and phase. A second harmonic and a localized defect-enhanced packet create a hierarchy of global and localized scales.

## Mathematical Definition

Let the shaft and mesh frequencies be $f_s=3.2$ and $f_m=31$. Define

$$
\phi(x)=2\pi f_mx+0.22\sin(2\pi f_sx),
\qquad
A(x)=0.78+0.22\cos(2\pi f_sx).
$$

The carrier is

$$
C(x)=A(x)\sin\phi(x)+0.20\sin\{2\phi(x)-0.35\},
$$

and the localized defect packet is

$$
D(x)=0.70\exp\!\left[-\frac12\left(\frac{x-0.63}{0.035}\right)^2\right]
\sin(72\pi x+0.8).
$$

Thus

$$
f(x)=C(x)+D(x).
$$

[GearDefect signal](../../assets/images/TF036_GearDefect.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Modulated carrier with localized oscillatory packet |
| Shaft frequency | 3.2 |
| Mesh frequency | 31 |
| Localized defect | Centered at $x=0.63$ |
| Main challenge | Scale-dependent recovery of carrier, harmonic, modulation, and defect |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $f_s$ | Shaft frequency | 3.2 |
| $f_m$ | Mesh frequency | 31 |
| $0.035$ | Defect-packet width | 0.035 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF036_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF036_python.md)



## Recommended Uses

- Modulated-carrier denoising
- Local gear-defect detection
- Sideband and harmonic preservation
- Scale-dependent shrinkage evaluation

## Provenance

**Status:** Gear-mesh-defect-inspired deterministic mechanical surrogate.

---

[← Previous: BearingFault](TF035_BearingFault.md) | [Category 3 Catalog](index.md) | [Next: RotorRub →](TF037_RotorRub.md)

