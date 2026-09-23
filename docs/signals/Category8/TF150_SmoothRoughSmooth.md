# SmoothRoughSmooth


## Overview

The **SmoothRoughSmooth** stress test transitions from a smooth low-frequency region to a finite interval with three high-frequency components, then returns to a smooth regime.

## Mathematical Definition

Let $S_c=S(x;c,0.008)=[1+e^{-(x-c)/0.008}]^{-1}$ and $W=S_{0.33}-S_{0.68}$. Define

$$
L(x)=0.20+0.22\sin(4\pi x),\qquad
R(x)=0.20+0.18\cos[4\pi(x-0.68)],
$$

$$
q(x)=0.16\sin(34\pi x)+0.08\sin(82\pi x+0.3)+0.04\sin(182\pi x-0.2).
$$

Then

$$
f(x)=L(x)(1-S_{0.33})+W[0.20+q(x)]+R(x)S_{0.68}.
$$

[SmoothRoughSmooth signal](../../assets/images/TF150_SmoothRoughSmooth.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Smooth–rough–smooth transition |
| Rough interval | Approximately 0.33–0.68 |
| Rough scales | 17, 41, and 91 cycles |
| Main challenge | The optimal smoothing level changes abruptly across the record |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $0.33,0.68$ | Rough-window boundaries | As shown |
| $0.16,0.08,0.04$ | Rough-component amplitudes | As shown |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF0150_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF0150_python.md)


## Recommended Uses

- Spatially adaptive smoothing tests
- Rough-window localization
- Multiband structure preservation

## Provenance

**Status:** Deliberately artificial MishMash stress test.

---

[← Previous: LacunaryCascade](TF149_LacunaryCascade.md) | [Category 8 Catalog](index.md) | [Next: PeakOnPeak →](TF151_PeakOnPeak.md)
