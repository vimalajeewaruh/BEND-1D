# XRDPeaks

## Overview

The **XRDPeaks** signal mimics an X-ray diffraction profile with a decaying background, broad amorphous hump, and several sharp Bragg peaks. A deliberately close peak pair makes scale separation especially difficult.

## Mathematical Definition

Let

$$
G(x;c,w)=\exp\!\left[-\frac12\left(\frac{x-c}{w}\right)^2\right].
$$

The background is

$$
B(x)=0.10+0.12e^{-2.8x}+0.075G(x;0.29,0.095).
$$

The peak parameters are

$$
c=(0.18,0.355,0.475,0.565,0.582,0.745,0.89),
$$

$$
A=(0.34,0.62,0.43,0.92,0.70,0.52,0.27),
$$

$$
w=(0.010,0.008,0.012,0.007,0.0075,0.010,0.006).
$$

The signal is

$$
f(x)=B(x)+\sum_{k=1}^{7}A_kG(x;c_k,w_k).
$$

[XRDPeaks signal](../../assets/images/TF064_XRDPeaks.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Broad background with sharp diffraction peaks |
| Number of Bragg peaks | 7 |
| Close pair | Centers 0.565 and 0.582 |
| Broad feature | Amorphous hump near $x=0.29$ |
| Main challenge | Separating narrow peaks from broad background |

## Parameters

| Parameter | Meaning | Default |
|---|---|---|
| $N$ | Number of samples | 1024 |
| $c$ | Bragg-peak centers | As listed above |
| $A$ | Peak amplitudes | As listed above |
| $w$ | Peak widths | As listed above |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF064_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF064_python.md)



## Recommended Uses

- XRD profile denoising
- Bragg-peak preservation
- Close-peak resolution
- Broad–narrow scale separation

## Provenance

**Status:** X-ray-diffraction-inspired deterministic analytical surrogate.

---

[← Previous: NMRMultiplet](TF063_NMRMultiplet.md) | [Category 5 Catalog](index.md) | [Next: AFMForceCurve →](TF065_AFMForceCurve.md)
