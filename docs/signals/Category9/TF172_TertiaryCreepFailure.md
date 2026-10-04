# Tertiary Creep Failure


## Overview

The **TertiaryCreepFailure** signal is a creep surrogate containing primary deceleration, approximately steady secondary creep, rapidly accelerating tertiary creep, and a sudden failure drop. The onset of acceleration is gradual, whereas failure is abrupt.

## Mathematical Definition

Let the regime boundaries be

```math
c_1=0.30,\qquad
c_2=0.56,\qquad
c_3=0.82.
```

For $0\leq x<c_1$, define the primary-creep regime by

```math
f(x)=
A_P\left(1-e^{-\lambda_P x}\right).
```

For $c_1\leq x<c_2$, define the secondary-creep regime by

```math
f(x)=
L_S+m_S(x-c_1).
```

For $c_2\leq x<c_3$, let

```math
u=
\frac{x-c_2}{c_3-c_2},
```

and define the tertiary-creep regime by

```math
f(x)=
L_T+a_Tu+b_Tu^p.
```

For $x\geq c_3$, define the post-failure regime by

```math
f(x)=
L_F+A_Fe^{-\lambda_F(x-c_3)}.
```

[View Tertiary Creep Failure](../../assets/images/TF172_TertiaryCreepFailure.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Accelerating trend with failure |
| Regimes | Primary, secondary, tertiary, and post-failure |
| Primary creep | Rapid initial increase followed by deceleration |
| Secondary creep | Approximately linear growth |
| Tertiary creep | Strong nonlinear acceleration controlled by $b_T$ and $p$ |
| Discontinuity | Large failure drop at $c_3$ |
| Main challenge | Preserving early acceleration and terminal failure |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $c_1$ | Secondary-creep onset | 0.30 |
| $c_2$ | Tertiary-creep onset | 0.56 |
| $c_3$ | Failure location | 0.82 |
| $A_P$ | Primary-creep amplitude | 0.22 |
| $\lambda_P$ | Primary-creep rate | 10 |
| $L_S$ | Secondary-creep initial level | 0.209 |
| $m_S$ | Secondary-creep slope | 0.22 |
| $L_T$ | Tertiary-creep initial level | 0.266 |
| $a_T$ | Linear tertiary coefficient | 0.10 |
| $b_T$ | Nonlinear tertiary coefficient | 0.62 |
| $p$ | Tertiary acceleration exponent | 4 |
| $L_F$ | Post-failure baseline level | 0.28 |
| $A_F$ | Post-failure transient amplitude | 0.18 |
| $\lambda_F$ | Post-failure decay rate | 10 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF172_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF172_python.md)



## Recommended Uses

- Failure-precursor preservation
- Accelerating-trend denoising
- Mixed smooth-change and jump recovery

## Provenance

This deterministic function is inspired by qualitative creep curves and is not a calibrated lifetime model.

[← Previous: Seismic Dispersive Wave](TF171_SeismicDispersiveWave.md) · [Category 9 catalog](index.md) · [Next: Transformer Inrush →](TF173_TransformerInrush.md)
