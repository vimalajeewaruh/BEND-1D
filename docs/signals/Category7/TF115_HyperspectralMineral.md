# HyperspectralMineral


## Overview

The **HyperspectralMineral** signal contains five absorption bands of unequal amplitude and width on a smooth continuum, including a close pair and a weak diagnostic band.

## Mathematical Definition

Define the Gaussian function

```math
g(x;c,w)=
\exp\left[
-\frac12\left(\frac{x-c}{w}\right)^2
\right].
```

Define the smooth continuum

```math
B(x)=b_0+mx.
```

Let the absorption-band centers, depths, and widths be

```math
\mathbf{c}
=
(0.22,\,0.46,\,0.59,\,0.625,\,0.81),
```

```math
\mathbf{a}
=
(0.12,\,0.25,\,0.18,\,0.14,\,0.08),
```

```math
\mathbf{w}
=
(0.030,\,0.040,\,0.018,\,0.016,\,0.024).
```

Define the absorption component

```math
A(x)=
-\sum_{k=1}^{K}
a_k g(x;c_k,w_k).
```

The signal is

```math
f(x)=B(x)+A(x).
```

[View HyperspectralMineral signal](../../assets/images/TF115_HyperspectralMineral.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Unequal spectral absorption bands |
| Continuum | Smooth linear trend with baseline $b_0$ and slope $m$ |
| Close pair | Bands centered at $c_3=0.59$ and $c_4=0.625$ |
| Weak feature | Band centered at $c_5=0.81$ with depth $a_5=0.08$ |
| Main challenge | Avoiding merger of close bands and loss of weak diagnostic features |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $b_0$ | Continuum baseline | 0.78 |
| $m$ | Continuum slope | 0.08 |
| $K$ | Number of absorption bands | 5 |
| $\mathbf{c}$ | Band centers | $(0.22,\,0.46,\,0.59,\,0.625,\,0.81)$ |
| $\mathbf{a}$ | Band depths | $(0.12,\,0.25,\,0.18,\,0.14,\,0.08)$ |
| $\mathbf{w}$ | Band widths | $(0.030,\,0.040,\,0.018,\,0.016,\,0.024)$ |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF115_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF115_python.md)



## Recommended Uses

- Hyperspectral denoising
- Close-band resolution
- Weak-feature preservation

## Provenance

**Status:** Mineral-reflectance-spectrum-inspired deterministic remote-sensing surrogate.

---

[← Previous: GNSSMultipathSlip](TF114_GNSSMultipathSlip.md) | [Category 7 Catalog](index.md) | [Next: SideChannelPower →](TF116_SideChannelPower.md)
