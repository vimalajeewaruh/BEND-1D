# OCTRetinalProfile


## Overview

The **OCTRetinalProfile** signal models a layered reflectivity profile with seven sharp interfaces and one particularly thin weak layer.

## Mathematical Definition

Define the Gaussian function

```math
g(x;c,w)=
\exp\left[
-\frac12\left(\frac{x-c}{w}\right)^2
\right].
```

Define the background trend

```math
B(x)=b_0+mx.
```

Define the primary layer-interface component

```math
L(x)=
\sum_{k=1}^{K}
a_k g(x;c_k,w_k).
```

Define the thin weak layer

```math
T(x)=
A_T g(x;c_T,w_T).
```

The signal is

```math
f(x)=B(x)+L(x)+T(x).
```

The primary layer centers, amplitudes, and widths are

```math
\mathbf{c}
=
(0.14,\,0.23,\,0.36,\,0.49,\,0.62,\,0.73,\,0.81),
```

```math
\mathbf{a}
=
(0.16,\,0.28,\,0.42,\,0.26,\,0.54,\,0.31,\,0.18),
```

```math
\mathbf{w}
=
(0.008,\,0.010,\,0.012,\,0.009,\,0.010,\,0.007,\,0.006).
```

[View OCTRetinalProfile signal](../../assets/images/TF128_OCTRetinalProfile.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Layered narrow reflectivity peaks |
| Layer interfaces | $K$ localized peaks with centers specified by $\mathbf{c}$ |
| Strong interface | Largest primary peak centered at $c_5$ |
| Thin weak layer | Centered at $c_T$ with width $w_T$ |
| Main challenge | Preserving fine stratification without merging adjacent layers |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $b_0$ | Baseline reflectivity level | 0.10 |
| $m$ | Background trend slope | 0.03 |
| $K$ | Number of primary layer interfaces | 7 |
| $\mathbf{c}$ | Primary layer centers | $(0.14,\,0.23,\,0.36,\,0.49,\,0.62,\,0.73,\,0.81)$ |
| $\mathbf{a}$ | Primary layer amplitudes | $(0.16,\,0.28,\,0.42,\,0.26,\,0.54,\,0.31,\,0.18)$ |
| $\mathbf{w}$ | Primary layer widths | $(0.008,\,0.010,\,0.012,\,0.009,\,0.010,\,0.007,\,0.006)$ |
| $A_T$ | Thin-layer amplitude | 0.07 |
| $c_T$ | Thin-layer center | 0.655 |
| $w_T$ | Thin-layer width | 0.004 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF128_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF128_python.md)



## Recommended Uses

- OCT-profile denoising
- Layer-resolution evaluation
- Thin-feature preservation

## Provenance

**Status:** Retinal-OCT-reflectivity-inspired deterministic surrogate.

---

[← Previous: PhotoacousticAline](TF127_PhotoacousticAline.md) | [Category 8 Catalog](index.md) | [Next: UltrasoundCrackEcho →](TF129_UltrasoundCrackEcho.md)
