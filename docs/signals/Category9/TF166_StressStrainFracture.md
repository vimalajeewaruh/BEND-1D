# Stress–Strain Fracture


## Overview

The **StressStrainFracture** signal is a piecewise stress–strain surrogate that moves through elastic loading, a short yield plateau, strain hardening, softening, and abrupt fracture. It combines multiple slope changes with a large terminal discontinuity.

## Mathematical Definition

Let the regime boundaries be

```math
c_1=0.18,\qquad
c_2=0.34,\qquad
c_3=0.72,\qquad
c_4=0.90.
```

For $0\leq x<c_1$, define the elastic-loading regime by

```math
f(x)=m_E x.
```

For $c_1\leq x<c_2$, define the yield regime by

```math
f(x)=
L_Y+
A_Y\frac{x-c_1}{c_2-c_1}.
```

For $c_2\leq x<c_3$, let

```math
u=
\frac{x-c_2}{c_3-c_2},
```

and define the strain-hardening regime by

```math
f(x)=
L_H+a_Hu+b_Hu^2.
```

For $c_3\leq x<c_4$, let

```math
v=
\frac{x-c_3}{c_4-c_3},
```

and define the softening regime by

```math
f(x)=
L_S-a_Sv-b_Sv^2.
```

For $x\geq c_4$, define the post-fracture regime by

```math
f(x)=
L_F+A_Fe^{-\lambda_F(x-c_4)}.
```

[View Stress–Strain Fracture](../../assets/images/TF166_StressStrainFracture.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Piecewise constitutive curve |
| Regimes | Elastic, yield, hardening, softening, and fracture |
| Regime boundaries | $c_1$, $c_2$, $c_3$, and $c_4$ |
| Singular structure | Slope changes and terminal jump |
| Dominant event | Fracture at $c_4$ |
| Post-fracture behavior | Low-level exponentially decaying response |
| Main challenge | Preserving both regime boundaries and the abrupt failure |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $c_1$ | Yield onset | 0.18 |
| $c_2$ | Hardening onset | 0.34 |
| $c_3$ | Softening onset | 0.72 |
| $c_4$ | Fracture location | 0.90 |
| $m_E$ | Elastic slope | 4 |
| $L_Y$ | Yield-regime initial level | 0.72 |
| $A_Y$ | Yield-regime increase | 0.035 |
| $L_H$ | Hardening-regime initial level | 0.755 |
| $a_H$ | Linear hardening coefficient | 0.30 |
| $b_H$ | Quadratic hardening coefficient | 0.055 |
| $L_S$ | Softening-regime initial level | 1.11 |
| $a_S$ | Linear softening coefficient | 0.22 |
| $b_S$ | Quadratic softening coefficient | 0.03 |
| $L_F$ | Post-fracture baseline level | 0.15 |
| $A_F$ | Post-fracture transient amplitude | 0.04 |
| $\lambda_F$ | Post-fracture decay rate | 18 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF166_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF166_python.md)



## Recommended Uses

- Edge and kink preservation
- Constitutive-curve smoothing
- Abrupt-failure localization

## Provenance

This deterministic curve is a qualitative materials-testing surrogate, not a calibrated constitutive law.

[← Previous: Turbulence Intermittency](TF165_TurbulenceIntermittency.md) · [Category 9 catalog](index.md) · [Next: Nanoindentation Pop-In →](TF167_NanoindentationPopIn.md)
