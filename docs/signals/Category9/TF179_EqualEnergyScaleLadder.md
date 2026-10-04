# Equal-Energy Scale Ladder


## Overview

The **EqualEnergyScaleLadder** signal contains five Mexican-hat-like features spanning a wide range of widths. Their amplitudes are scaled inversely with the square root of width so that the features have comparable continuous-domain energy. This isolates scale preference from raw-energy preference.

## Mathematical Definition

Let the feature centers be

```math
\mathbf{c}
=
(0.10,\,0.27,\,0.45,\,0.65,\,0.85),
```

with corresponding widths

```math
\mathbf{w}
=
(0.005,\,0.008,\,0.013,\,0.022,\,0.037).
```

For each feature, define the standardized coordinate

```math
z_k(x)=
\frac{x-c_k}{w_k},
\qquad
k=1,\ldots,K.
```

Using reference width $w_0$, define the amplitude scaling by

```math
A_k=
\sqrt{\frac{w_0}{w_k}}.
```

The $k$th Mexican-hat-like feature is

```math
M_k(x)=
A_k
\left[1-z_k(x)^2\right]
e^{-z_k(x)^2/2}.
```

The signal is

```math
f(x)=
\sum_{k=1}^{K}M_k(x),
\qquad
0\leq x\leq1.
```

[View Equal-Energy Scale Ladder](../../assets/images/TF179_EqualEnergyScaleLadder.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Controlled scale-bias diagnostic |
| Signal type | $K$ second-derivative Gaussian profiles |
| Controlled variable | Feature width $w_k$ |
| Width range | $0.005$ to $0.037$ |
| Amplitude scaling | $A_k=\sqrt{w_0/w_k}$ |
| Equalized property | Approximate continuous-domain energy |
| Main challenge | Treating narrow and broad equal-energy features fairly |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $K$ | Number of features | 5 |
| $\mathbf{c}$ | Feature centers | $(0.10,\,0.27,\,0.45,\,0.65,\,0.85)$ |
| $\mathbf{w}$ | Feature widths | $(0.005,\,0.008,\,0.013,\,0.022,\,0.037)$ |
| $w_0$ | Reference width | 0.013 |
| $A_k$ | Width-dependent amplitude factor | $\sqrt{w_0/w_k}$ |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF179_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF179_python.md)



## Recommended Uses

- Scale-bias measurement
- Comparing multiscale shrinkage rules
- Equal-energy feature retention

## Provenance

This is a deliberately artificial scale diagnostic. The amplitude normalization is part of the definition.

[← Previous: Rayleigh Doublet Ladder](TF178_RayleighDoubletLadder.md) · [Category 9 catalog](index.md) · [Next: Hölder Ladder →](TF180_HolderLadder.md)
