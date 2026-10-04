# MeltPoolSpatter


## Overview

The **MeltPoolSpatter** signal contains a broad thermal envelope with sparse positive and negative spatter events and weak localized oscillation. The narrow events represent legitimate physical signal features rather than contamination.

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

Define the broad thermal envelope by

```math
T(x)=
A_T G(x;c_T,w_T).
```

Let the spatter-event centers be

```math
\mathbf{c}
=
(0.21,\,0.37,\,0.49,\,0.58,\,0.74,\,0.79),
```

with corresponding signed amplitudes

```math
\mathbf{a}
=
(a_1,\ldots,a_K),
```

and widths

```math
\mathbf{w}
=
(w_1,\ldots,w_K),
```

as specified in the implementation.

Define the sparse spatter component by

```math
P(x)=
\sum_{k=1}^{K}
a_kG(x;c_k,w_k).
```

Define the localized oscillatory component by

```math
R(x)=
A_R
G(x;c_R,w_R)
\sin(2\pi f_Rx).
```

The signal is

```math
f(x)=
b_0+T(x)+P(x)+R(x).
```

[View Melt Pool Spatter](../../assets/images/TF195_MeltPoolSpatter.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Additive manufacturing |
| Structure | Broad Gaussian thermal envelope with sparse multiscale events and localized oscillation |
| Spatter behavior | Sparse positive and negative narrow events |
| Oscillatory behavior | Weak high-frequency oscillation localized within the thermal region |
| Regularity | Smooth but with extremely narrow high-curvature peaks |
| Main challenge | Preserving rare physical events without fitting noise |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $b_0$ | Baseline level | 0.12 |
| $A_T$ | Thermal-envelope amplitude | 0.72 |
| $c_T$ | Thermal-envelope center | 0.55 |
| $w_T$ | Thermal-envelope width | 0.22 |
| $K$ | Number of spatter events | 6 |
| $\mathbf{c}$ | Event centers | $(0.21,\,0.37,\,0.49,\,0.58,\,0.74,\,0.79)$ |
| $\mathbf{a}$ | Signed event amplitudes | Specified in implementation |
| $\mathbf{w}$ | Event widths | $0.0025$–$0.004$ |
| $A_R$ | Localized-oscillation amplitude | 0.05 |
| $c_R$ | Localized-oscillation center | 0.58 |
| $w_R$ | Localized-oscillation width | 0.20 |
| $f_R$ | Localized-oscillation frequency | 18 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF195_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF195_python.md)




## Recommended Uses

- Sparse-event preservation
- Thermal-envelope smoothing
- Outlier-versus-signal discrimination

## Provenance

This is a deterministic benchmark surrogate inspired by additive manufacturing measurement morphology. It is not a calibrated physical simulator.

[← Previous: RadarMicroDoppler](TF194_RadarMicroDoppler.md) · [Category 10 catalog](index.md) · [Next: CavitationCollapse →](TF196_CavitationCollapse.md)

