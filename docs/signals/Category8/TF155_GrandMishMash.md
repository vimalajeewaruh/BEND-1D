# GrandMishMash


## Overview

The **GrandMishMash** is a compact final examination of local adaptivity, combining smooth curvature, a cusp, finite plateau, jump, close peaks, notch, localized chirp, wave packet, near-cancellation, and terminal needle.

## Mathematical Definition

Define the smooth step

```math
S(x;c,w)=
\left[1+e^{-(x-c)/w}\right]^{-1}.
```

Define the Gaussian function

```math
g(x;c,w)=
\exp\left[
-\frac12\left(\frac{x-c}{w}\right)^2
\right].
```

Define the smooth background

```math
B(x)=
m x+A_L\log(1+\gamma x).
```

Define the square-root cusp

```math
C(x)=
A_C\sqrt{|x-c_C|}.
```

Define the finite plateau

```math
P(x)=
A_P
\left[
S(x;c_{P1},w_P)
-
S(x;c_{P2},w_P)
\right].
```

Define the sharp downward jump

```math
J(x)=
-A_JS(x;c_J,w_J).
```

Define the close positive peaks

```math
D(x)=
A_1g(x;c_1,w_1)
+
A_2g(x;c_2,w_2).
```

Define the narrow negative notch

```math
N(x)=
-A_Ng(x;c_N,w_N).
```

Define the chirp window

```math
W_C(x)=
S(x;c_{C1},w_C)
-
S(x;c_{C2},w_C).
```

Define the localized chirp

```math
H(x)=
A_H
\sin\left[
2\pi(f_Hx+\beta_Hx^2)
\right]
W_C(x).
```

Define the localized wave packet

```math
W(x)=
A_Wg(x;c_W,w_W)
\sin(2\pi f_Wx).
```

Define the near-cancellation component

```math
Q(x)=
A_{Q1}g(x;c_{Q1},w_{Q1})
-
A_{Q2}g(x;c_{Q2},w_{Q2}).
```

Define the terminal needle

```math
T(x)=
A_Tg(x;c_T,w_T).
```

The signal is

```math
f(x)=
B(x)+C(x)+P(x)+J(x)+D(x)+N(x)+H(x)+W(x)+Q(x)+T(x).
```

[View GrandMishMash signal](../../assets/images/TF155_GrandMishMash.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Comprehensive mixed-geometry stress test |
| Smooth background | Linear trend combined with logarithmic curvature |
| Local singularity | Square-root cusp centered at $c_C$ |
| Plateau | Finite elevated region from approximately $c_{P1}$ to $c_{P2}$ |
| Jump | Sharp downward transition centered at $c_J$ |
| Close peaks | Positive doublet centered at $c_1$ and $c_2$ |
| Notch | Narrow negative feature centered at $c_N$ |
| Localized chirp | Windowed accelerating oscillation between approximately $c_{C1}$ and $c_{C2}$ |
| Wave packet | Localized high-frequency oscillation centered at $c_W$ |
| Near-cancellation | Overlapping positive and negative broad peaks near $c_{Q1}$ and $c_{Q2}$ |
| Terminal needle | Very narrow positive feature centered at $c_T$ |
| Main challenge | Local adaptation across essentially incompatible geometries |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $m$ | Linear trend slope | 0.12 |
| $A_L$ | Logarithmic-curvature amplitude | 0.08 |
| $\gamma$ | Logarithmic-curvature scale | 6 |
| $A_C$ | Cusp amplitude | 0.18 |
| $c_C$ | Cusp location | 0.16 |
| $A_P$ | Plateau magnitude | 0.16 |
| $c_{P1}$ | Plateau onset | 0.24 |
| $c_{P2}$ | Plateau offset | 0.36 |
| $w_P$ | Plateau transition width | 0.006 |
| $A_J$ | Jump magnitude | 0.18 |
| $c_J$ | Jump location | 0.43 |
| $w_J$ | Jump transition width | 0.003 |
| $A_1$ | First close-peak amplitude | 0.26 |
| $c_1$ | First close-peak center | 0.50 |
| $w_1$ | First close-peak width | 0.010 |
| $A_2$ | Second close-peak amplitude | 0.21 |
| $c_2$ | Second close-peak center | 0.527 |
| $w_2$ | Second close-peak width | 0.008 |
| $A_N$ | Notch magnitude | 0.13 |
| $c_N$ | Notch center | 0.575 |
| $w_N$ | Notch width | 0.005 |
| $A_H$ | Localized-chirp amplitude | 0.13 |
| $f_H$ | Chirp base frequency | 8 |
| $\beta_H$ | Quadratic chirp coefficient | 24 |
| $c_{C1}$ | Chirp-window onset | 0.60 |
| $c_{C2}$ | Chirp-window offset | 0.78 |
| $w_C$ | Chirp-window transition width | 0.02 |
| $A_W$ | Wave-packet amplitude | 0.16 |
| $c_W$ | Wave-packet center | 0.80 |
| $w_W$ | Wave-packet width | 0.045 |
| $f_W$ | Wave-packet frequency | 55 |
| $A_{Q1}$ | Positive cancellation-component amplitude | 0.28 |
| $c_{Q1}$ | Positive cancellation-component center | 0.885 |
| $w_{Q1}$ | Positive cancellation-component width | 0.035 |
| $A_{Q2}$ | Negative cancellation-component magnitude | 0.26 |
| $c_{Q2}$ | Negative cancellation-component center | 0.895 |
| $w_{Q2}$ | Negative cancellation-component width | 0.037 |
| $A_T$ | Terminal-needle amplitude | 0.09 |
| $c_T$ | Terminal-needle center | 0.955 |
| $w_T$ | Terminal-needle width | 0.0028 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF155_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF155_python.md)




## Recommended Uses

- Comprehensive local-adaptivity testing
- Multiscale feature preservation
- Global-error limitation studies

## Provenance

**Status:** Deliberately artificial GrandMishMash stress test.

---

[← Previous: CompressionStorm](TF154_CompressionStorm.md) | [Category 8 Catalog](index.md) | Next: end of Category 8
