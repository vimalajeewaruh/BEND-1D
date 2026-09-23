# TGA Decomposition


## Overview

This thermogravimetric-analysis surrogate contains four overlapping mass-loss stages with different locations, widths, and magnitudes. The result is a monotone staircase whose weak intermediate stage can be hidden by aggressive smoothing.

## Mathematical Definition

Define

$$
L(x;c,w)=\frac{1}{1+e^{-(x-c)/w}}.
$$

Then

$$
\begin{aligned}
f(x)=1
&-0.18L(x;0.20,0.022)
-0.38L(x;0.49,0.030)\\
&-0.10L(x;0.61,0.015)
-0.25L(x;0.77,0.020).
\end{aligned}
$$

[TGA Decomposition](../../assets/images/TF169_TGADecomposition.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Multistage monotone transition |
| Signal type | Sum of four smooth downward steps |
| Weak feature | $0.10$ mass-loss stage near $x=0.61$ |
| Regularity | Smooth with concentrated transition curvature |
| Main challenge | Resolve adjacent and unequal decomposition stages |

## Parameters

| Stage | Center | Width | Loss |
|---|---:|---:|---:|
| 1 | $0.20$ | $0.022$ | $0.18$ |
| 2 | $0.49$ | $0.030$ | $0.38$ |
| 3 | $0.61$ | $0.015$ | $0.10$ |
| 4 | $0.77$ | $0.020$ | $0.25$ |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF0169_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF0169_python.md)



## Recommended Uses

- Multistage change recovery
- Monotone smoothing evaluation
- Weak transition preservation

## Provenance

This deterministic function is inspired by qualitative TGA mass-loss curves and is not material-specific.

[← Previous: DSC Phase Transitions](TF168_DSCPhaseTransitions.md) · [Category 9 catalog](index.md) · [Next: Van der Pol Relaxation →](TF170_VanDerPolRelaxation.md)
