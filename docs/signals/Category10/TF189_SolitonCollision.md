# SolitonCollision



## Overview

The **SolitonCollision** signal contains two smooth localized pulses flanking a strongly oscillatory central interaction region, requiring different treatment of adjacent low- and high-frequency structures.

## Mathematical Definition

Define the inverse-cosh-squared profile

```math
Q(z)=\frac{1}{\cosh^2(z)}.
```

Define the two outer pulses by

```math
P_1(x)=
A_O Q\left(
\frac{x-c_1}{w_O}
\right),
```

```math
P_2(x)=
A_O Q\left(
\frac{x-c_2}{w_O}
\right).
```

Define the oscillatory collision component by

```math
C(x)=
A_C Q\left(
\frac{x-c_C}{w_C}
\right)
\cos\left[
2\pi f_C(x-c_C)
\right].
```

The signal is

```math
f(x)=P_1(x)+P_2(x)+C(x).
```

[View Soliton Collision](../../assets/images/TF189_SolitonCollision.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Nonlinear physics |
| Structure | Two smooth outer pulses with a localized oscillatory collision component |
| Outer pulses | Equal-amplitude inverse-cosh-squared profiles centered at $c_1$ and $c_2$ |
| Collision region | Narrow inverse-cosh-squared envelope containing high-frequency oscillations |
| Regularity | Smooth with a concentrated central oscillation |
| Main challenge | Preserving the interaction fringes without distorting the outer pulses |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $A_O$ | Outer-pulse amplitude | 0.66 |
| $c_1$ | Left outer-pulse center | 0.40 |
| $c_2$ | Right outer-pulse center | 0.60 |
| $w_O$ | Outer-pulse width | 0.045 |
| $A_C$ | Collision-component amplitude | 0.82 |
| $c_C$ | Collision center | 0.50 |
| $w_C$ | Collision width | 0.030 |
| $f_C$ | Collision frequency | 29 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF189_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF189_python.md)



## Recommended Uses

- Collision-region denoising
- Localized fringe preservation
- Adjacent-scale adaptation

## Provenance

This is a deterministic benchmark surrogate inspired by nonlinear physics measurement morphology. It is not a calibrated physical or clinical simulator.

[← Previous: TokamakELMTrain](TF188_TokamakELMTrain.md) · [Category 10 catalog](index.md) · [Next: CriticalSlowing →](TF190_CriticalSlowing.md)

