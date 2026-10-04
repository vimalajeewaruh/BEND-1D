# ValveChatter


## Overview

The **ValveChatter** signal contains a finite interval of rapid near-square switching embedded in a slow trend, followed by a damped mechanical ring-down.

## Mathematical Definition

Define the smooth logistic transition

```math
L(x;c,w)=
\left[1+e^{-(x-c)/w}\right]^{-1}.
```

Define the chatter gate by

```math
g(x)=
L(x;c_1,w_g)-L(x;c_2,w_g).
```

Define the slow baseline trend by

```math
B(x)=b_0+mx.
```

Define the localized chatter component by

```math
C(x)=
A_C g(x)
\tanh\left[
\gamma_C
\sin\left(
2\pi f_C(x-c_1)
\right)
\right].
```

For $x\geq c_2$, let

```math
u=x-c_2,
```

and define the mechanical ring-down by

```math
R(x)=
A_R e^{-\alpha_Ru}
\sin(2\pi f_Ru),
```

with $R(x)=0$ for $x<c_2$.

The signal is

```math
f(x)=
B(x)+C(x)+R(x).
```

[View Valve Chatter](../../assets/images/TF198_ValveChatter.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Control systems |
| Structure | Smooth gate, saturated sinusoidal chatter, and causal ring-down |
| Chatter behavior | Rapid near-square switching localized between $c_1$ and $c_2$ |
| Ring-down behavior | Damped mechanical oscillation beginning at $c_2$ |
| Regularity | Localized rapid switching with smooth recovery |
| Main challenge | Retaining persistent high-frequency switching without staircasing the trend |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $b_0$ | Baseline level | 0.12 |
| $m$ | Baseline slope | 0.18 |
| $c_1$ | Chatter onset | 0.30 |
| $c_2$ | Chatter termination | 0.58 |
| $w_g$ | Gate transition width | 0.003 |
| $A_C$ | Chatter amplitude | 0.48 |
| $\gamma_C$ | Chatter saturation parameter | 2.7 |
| $f_C$ | Chatter frequency | 47 |
| $A_R$ | Ring-down amplitude | 0.34 |
| $\alpha_R$ | Ring-down decay rate | 18 |
| $f_R$ | Ring-down frequency | 34 |


## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF198_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF198_python.md)




## Recommended Uses

- Switching-signal denoising
- Chatter localization
- Post-switch ring-down recovery

## Provenance

This is a deterministic benchmark surrogate inspired by control systems measurement morphology. It is not a calibrated physical simulator.

[← Previous: ModeBeatingDecay](TF197_ModeBeatingDecay.md) · [Category 10 catalog](index.md) · [Next: NetworkCongestionBurst →](TF199_NetworkCongestionBurst.md)

