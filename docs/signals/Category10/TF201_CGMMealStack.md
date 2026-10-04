# CGMMealStack


## Overview

The **CGMMealStack** signal contains four asymmetric meal responses that begin before previous responses return to baseline, producing shoulders and partially hidden peaks rather than isolated events.

## Mathematical Definition

Let the meal times, amplitudes, and response time scales be

```math
\mathbf{c}
=
(0.16,\,0.36,\,0.54,\,0.69),
```

```math
\mathbf{a}
=
(0.48,\,0.62,\,0.45,\,0.70),
```

and

```math
\boldsymbol{\tau}
=
(0.075,\,0.095,\,0.080,\,0.110).
```

For each $k=1,\ldots,K$, let

```math
u_k=x-c_k.
```

For $x\geq c_k$, define the causal meal-response component by

```math
r_k(x)=
\frac{u_k}{\tau_k}
\exp\left(
1-\frac{u_k}{\tau_k}
\right),
```

with $r_k(x)=0$ for $x<c_k$.

Define the baseline by

```math
B(x)=
b_0+
A_B\sin(2\pi f_Bx).
```

The signal is

```math
f(x)=
B(x)+
\sum_{k=1}^{K}a_kr_k(x).
```

[View CGM Meal Stack](../../assets/images/TF201_CGMMealStack.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Biomedical monitoring |
| Structure | Baseline plus overlapping gamma-like causal responses |
| Event behavior | Four asymmetric responses with rapid onset and slower decay |
| Overlap behavior | Responses overlap to create shoulders and partially hidden peaks |
| Regularity | Continuous with sharp causal onsets and long tails |
| Main challenge | Resolving stacked events and preserving shoulders |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $b_0$ | Baseline level | 0.20 |
| $A_B$ | Baseline oscillation amplitude | 0.03 |
| $f_B$ | Baseline oscillation frequency | 1 |
| $K$ | Number of meal responses | 4 |
| $\mathbf{c}$ | Meal times | $(0.16,\,0.36,\,0.54,\,0.69)$ |
| $\mathbf{a}$ | Response amplitudes | $(0.48,\,0.62,\,0.45,\,0.70)$ |
| $\boldsymbol{\tau}$ | Response time scales | $(0.075,\,0.095,\,0.080,\,0.110)$ |


## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF201_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF201_python.md)


## Recommended Uses

- Overlapping-event recovery
- Shoulder preservation
- Continuous-monitoring denoising

## Provenance

This is a deterministic benchmark surrogate inspired by biomedical monitoring measurement morphology. It is not a calibrated physical or clinical simulator.

[← Previous: ThermalThrottle](TF200_ThermalThrottle.md) · [Category 10 catalog](index.md) · [Next: SleepSpindleKComplex →](TF202_SleepSpindleKComplex.md)

