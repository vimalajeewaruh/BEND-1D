# GNSSMultipathFade


## Overview

The **GNSSMultipathFade** signal contains a slowly varying received-signal baseline with destructive-interference notches of unequal depth and width, together with localized high-frequency ripple.

## Mathematical Definition

Define the Gaussian profile

```math
G(x;c,w)=
\exp\left[
-\frac{1}{2}
\left(
\frac{x-c}{w}
\right)^2
\right].
```

Define the baseline component by

```math
B(x)=
b_0
+
A_1\sin(2\pi f_1x)
+
A_2\sin(2\pi f_2x+\delta_2).
```

Let the fade centers, depths, and widths be

```math
\mathbf{c}
=
(0.23,\,0.51,\,0.73,\,0.86),
```

```math
\mathbf{a}
=
(0.42,\,0.56,\,0.34,\,0.46),
```

and

```math
\mathbf{w}
=
(w_1,\,w_2,\,w_3,\,w_4),
```

where the fade widths are specified in the implementation.

Define the multipath-fade component by

```math
D(x)=
-\sum_{k=1}^{K}
a_kG(x;c_k,w_k).
```

Define the localized high-frequency ripple by

```math
R(x)=
A_R
G(x;c_R,w_R)
\sin(2\pi f_Rx).
```

The signal is

```math
f(x)=
B(x)+D(x)+R(x).
```

[View GNSS Multipath Fade](../../assets/images/TF193_GNSSMultipathFade.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Navigation |
| Structure | Smooth oscillatory baseline with four Gaussian fades and localized ripple |
| Fade behavior | Destructive-interference notches with unequal depths and widths |
| Ripple behavior | High-frequency oscillation localized around $c_R$ |
| Regularity | Smooth with narrow high-curvature depressions |
| Main challenge | Keeping deep fades from being treated as isolated outliers |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $b_0$ | Baseline level | 0.65 |
| $A_1$ | Low-frequency baseline amplitude | 0.08 |
| $f_1$ | Low-frequency baseline frequency | 1.5 |
| $A_2$ | Higher-frequency baseline amplitude | 0.035 |
| $f_2$ | Higher-frequency baseline frequency | 16 |
| $\delta_2$ | Higher-frequency phase offset | 0.4 |
| $K$ | Number of multipath fades | 4 |
| $\mathbf{c}$ | Fade centers | $(0.23,\,0.51,\,0.73,\,0.86)$ |
| $\mathbf{a}$ | Fade depths | $(0.42,\,0.56,\,0.34,\,0.46)$ |
| $\mathbf{w}$ | Fade widths | Specified in implementation |
| $A_R$ | Localized-ripple amplitude | 0.06 |
| $c_R$ | Localized-ripple center | 0.52 |
| $w_R$ | Localized-ripple width | 0.08 |
| $f_R$ | Localized-ripple carrier frequency | 33 |


## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF193_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF193_python.md)




## Recommended Uses

- Fade-depth preservation
- Multipath morphology recovery
- Localized-ripple denoising

## Provenance

This is a deterministic benchmark surrogate inspired by navigation measurement morphology. It is not a calibrated physical simulator.

[← Previous: FuelCellFloodDry](TF192_FuelCellFloodDry.md) · [Category 10 catalog](index.md) · [Next: RadarMicroDoppler →](TF194_RadarMicroDoppler.md)

