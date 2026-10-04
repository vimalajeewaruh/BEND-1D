# CriticalSlowing


## Overview

The **CriticalSlowing** signal contains three similar perturbations that relax with progressively longer time constants before a final abrupt regime transition and partial recovery.

## Mathematical Definition

Define the smooth logistic transition

```math
L(x;c,w)=
\left[1+e^{-(x-c)/w}\right]^{-1}.
```

Let the perturbation centers, amplitudes, and relaxation time scales be

```math
\mathbf{c}
=
(0.16,\,0.38,\,0.60),
```

```math
\mathbf{a}
=
(0.35,\,0.33,\,0.30),
```

and

```math
\boldsymbol{\tau}
=
(0.025,\,0.060,\,0.120).
```

For each $k=1,\ldots,K$, let

```math
u_k=x-c_k.
```

For $x\geq c_k$, define the causal relaxation component by

```math
R_k(x)=
a_k e^{-u_k/\tau_k},
```

with $R_k(x)=0$ for $x<c_k$.

Define the baseline by

```math
B(x)=b_0+mx.
```

Define the terminal regime transition and partial recovery by

```math
T(x)=
-A_TL(x;c_T,w_T)
+
A_RL(x;c_R,w_R).
```

The signal is

```math
f(x)=
B(x)
+
\sum_{k=1}^{K}R_k(x)
+
T(x).
```

[View Critical Slowing](../../assets/images/TF190_CriticalSlowing.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Dynamical systems |
| Structure | Causal exponential relaxations followed by smooth terminal transitions |
| Perturbations | Three similar events with progressively increasing relaxation time scales |
| Terminal behavior | Abrupt regime decrease followed by partial recovery |
| Regularity | One-sided transients and sharp smooth transitions |
| Main challenge | Recovering the systematic growth in relaxation time |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $b_0$ | Baseline level | 0.10 |
| $m$ | Baseline slope | 0.04 |
| $K$ | Number of relaxation events | 3 |
| $\mathbf{c}$ | Event centers | $(0.16,\,0.38,\,0.60)$ |
| $\mathbf{a}$ | Event amplitudes | $(0.35,\,0.33,\,0.30)$ |
| $\boldsymbol{\tau}$ | Relaxation time scales | $(0.025,\,0.060,\,0.120)$ |
| $A_T$ | Terminal-transition magnitude | 0.48 |
| $c_T$ | Terminal-transition center | 0.83 |
| $w_T$ | Terminal-transition width | 0.006 |
| $A_R$ | Recovery magnitude | 0.20 |
| $c_R$ | Recovery center | 0.89 |
| $w_R$ | Recovery width | 0.025 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF190_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF190_python.md)



## Recommended Uses

- Early-warning morphology
- Relaxation-time estimation
- Transition preservation

## Provenance

This is a deterministic benchmark surrogate inspired by dynamical systems measurement morphology. It is not a calibrated physical or clinical simulator.

[← Previous: SolitonCollision](TF189_SolitonCollision.md) · [Category 10 catalog](index.md) · [Next: BatteryKnee →](TF191_BatteryKnee.md)

