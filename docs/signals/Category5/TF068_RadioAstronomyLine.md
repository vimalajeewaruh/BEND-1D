# RadioAstronomyLine


## Overview

The **RadioAstronomyLine** signal consists of a smooth continuum with a weak narrow emission line, broader emission component, close intermediate-width pair, and shallow absorption notch.

## Mathematical Definition

Let

$$
G(x;c,w)=\exp\!\left[-\frac12\left(\frac{x-c}{w}\right)^2\right].
$$

The continuum is

$$
C(x)=0.30+0.10x-0.055x^2+0.012\sin(3\pi x).
$$

The signal is

$$
\begin{aligned}
f(x)={}&C(x)+0.095G(x;0.235,0.007)+0.24G(x;0.565,0.045)\\
&+0.13G(x;0.745,0.010)+0.10G(x;0.770,0.009)\\
&-0.075G(x;0.885,0.012).
\end{aligned}
$$

[RadioAstronomyLine signal](../../assets/images/TF068_RadioAstronomyLine.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Smooth continuum with unequal spectral lines |
| Weak narrow line | Centered at $x=0.235$ |
| Broad emission | Centered at $x=0.565$ |
| Close pair | Centers 0.745 and 0.770 |
| Main challenge | Retaining low-amplitude spectral information on a continuum |

## Parameters

| Feature | Center | Width | Amplitude |
|---|---:|---:|---:|
| Weak line | 0.235 | 0.007 | 0.095 |
| Broad line | 0.565 | 0.045 | 0.24 |
| Absorption notch | 0.885 | 0.012 | -0.075 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF068_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF068_python.md)



## Recommended Uses

- Radio-spectral denoising
- Weak-line detection
- Close-line-pair resolution
- Emission and absorption preservation

## Provenance

**Status:** Radio-astronomy-spectroscopy-inspired deterministic surrogate.

---

[← Previous: FluorescenceBleach](TF067_FluorescenceBleach.md) | [Category 5 Catalog](index.md) | [Next: OceanThermocline →](TF069_OceanThermocline.md)

