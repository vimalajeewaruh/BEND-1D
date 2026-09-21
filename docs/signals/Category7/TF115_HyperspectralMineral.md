# HyperspectralMineral


## Overview

The **HyperspectralMineral** signal contains five absorption bands of unequal amplitude and width on a smooth continuum, including a close pair and a weak diagnostic band.

## Mathematical Definition

Let $g(x;c,w)=e^{-((x-c)/w)^2/2}$. Then

$$
f(x)=0.78+0.08x-\sum_{k=1}^{5}a_k g(x;c_k,w_k),
$$

where

$$
c=(0.22,0.46,0.59,0.625,0.81),\quad
a=(0.12,0.25,0.18,0.14,0.08),
$$

$$
w=(0.030,0.040,0.018,0.016,0.024).
$$

[HyperspectralMineral signal](../../assets/images/TF115_HyperspectralMineral.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Unequal spectral absorption bands |
| Close pair | Centers at 0.59 and 0.625 |
| Weak feature | Band at $x=0.81$ with amplitude 0.08 |
| Main challenge | Avoiding merger of close bands and loss of weak diagnostics |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $c_k$ | Band centers | As above |
| $a_k$ | Band depths | As above |
| $w_k$ | Band widths | As above |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF0115_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF0115_python.md)



## Recommended Uses

- Hyperspectral denoising
- Close-band resolution
- Weak-feature preservation

## Provenance

**Status:** Mineral-reflectance-spectrum-inspired deterministic remote-sensing surrogate.

---

[← Previous: GNSSMultipathSlip](TF114_GNSSMultipathSlip.md) | [Category 7 Catalog](index.md) | [Next: SideChannelPower →](TF116_SideChannelPower.md)
