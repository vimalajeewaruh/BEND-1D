# TGA Decomposition


## Overview

The **TGADecomposition** signal is a thermogravimetric-analysis surrogate containing four overlapping mass-loss stages with different locations, widths, and magnitudes. The result is a monotone staircase whose weak intermediate stage can be hidden by aggressive smoothing.

## Mathematical Definition

Define the smooth logistic transition

```math
L(x;c,w)=
\left[1+e^{-(x-c)/w}\right]^{-1}.
```

For each decomposition stage, define

```math
D_k(x)=
A_k L(x;c_k,w_k).
```

The stage centers are

```math
\mathbf{c}
=
(0.20,\,0.49,\,0.61,\,0.77),
```

with widths

```math
\mathbf{w}
=
(0.022,\,0.030,\,0.015,\,0.020),
```

and mass-loss magnitudes

```math
\mathbf{A}
=
(0.18,\,0.38,\,0.10,\,0.25).
```

The signal is

```math
f(x)=
b_0-\sum_{k=1}^{K}D_k(x).
```

[View TGA Decomposition](../../assets/images/TF169_TGADecomposition.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Multistage monotone transition |
| Signal type | Sum of $K$ smooth downward steps |
| Decomposition stages | Unequal transitions centered at $\mathbf{c}$ |
| Weak feature | Small mass-loss stage near $c_3$ |
| Regularity | Smooth with concentrated transition curvature |
| Main challenge | Resolving adjacent and unequal decomposition stages |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $b_0$ | Initial mass level | 1 |
| $K$ | Number of decomposition stages | 4 |
| $\mathbf{c}$ | Stage centers | $(0.20,\,0.49,\,0.61,\,0.77)$ |
| $\mathbf{w}$ | Stage transition widths | $(0.022,\,0.030,\,0.015,\,0.020)$ |
| $\mathbf{A}$ | Mass-loss magnitudes | $(0.18,\,0.38,\,0.10,\,0.25)$ |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF169_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF169_python.md)



## Recommended Uses

- Multistage change recovery
- Monotone smoothing evaluation
- Weak transition preservation

## Provenance

This deterministic function is inspired by qualitative TGA mass-loss curves and is not material-specific.

[← Previous: DSC Phase Transitions](TF168_DSCPhaseTransitions.md) · [Category 9 catalog](index.md) · [Next: Van der Pol Relaxation →](TF170_VanDerPolRelaxation.md)
