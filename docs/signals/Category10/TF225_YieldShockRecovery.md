# YieldShockRecovery


## Overview

The **YieldShockRecovery** signal contains a drifting baseline with two shocks of opposite sign, each followed by a mixture of fast and slow exponential mean reversion.

## Mathematical Definition

Define the drifting baseline by

```math
B(x)=b_0+mx.
```

For $k=1,\ldots,K$ and $x\geq c_k$, let

```math
u_k=x-c_k,
```

and define the causal biexponential shock by

```math
S_k(x)=
a_k
\left[
\rho e^{-u_k/\tau_{1,k}}
+
(1-\rho)e^{-u_k/\tau_{2,k}}
\right],
```

with $S_k(x)=0$ for $x<c_k$.

Let the shock times be

```math
\mathbf{c}
=
(0.43,\,0.76),
```

the shock amplitudes be

```math
\mathbf{a}
=
(0.72,\,-0.32),
```

the fast recovery scales be

```math
\boldsymbol{\tau}_1
=
(0.055,\,0.040),
```

and the slow recovery scales be

```math
\boldsymbol{\tau}_2
=
(0.24,\,0.14).
```

The signal is

```math
f(x)=
B(x)+
\sum_{k=1}^{K}S_k(x).
```

[View Yield Shock Recovery](../../assets/images/TF225_YieldShockRecovery.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Fixed income |
| Structure | Linear trend plus two signed causal biexponential shocks |
| Baseline behavior | Gradual linear upward drift |
| Shock behavior | Two abrupt shocks of opposite sign occurring at $c_1$ and $c_2$ |
| Recovery behavior | Each shock combines fast and slow exponential mean-reversion components |
| Regularity | Abrupt value changes with long smooth tails |
| Main challenge | Preserving jumps while estimating two recovery scales |

## Parameters

| Symbol | Meaning | Default |
|---|---|---:|
| $b_0$ | Baseline level | 0.18 |
| $m$ | Baseline drift slope | 0.10 |
| $K$ | Number of shocks | 2 |
| $\mathbf{c}$ | Shock times | $(0.43,\,0.76)$ |
| $\mathbf{a}$ | Shock amplitudes | $(0.72,\,-0.32)$ |
| $\rho$ | Fast-component weight | 0.72 |
| $1-\rho$ | Slow-component weight | 0.28 |
| $\boldsymbol{\tau}_1$ | Fast recovery scales | $(0.055,\,0.040)$ |
| $\boldsymbol{\tau}_2$ | Slow recovery scales | $(0.24,\,0.14)$ |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF226_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF226_python.md)



## Recommended Uses

- Jump-and-recovery denoising
- Signed shock preservation
- Multirate mean-reversion estimation

## Provenance

This is a deterministic benchmark surrogate inspired by fixed income measurement morphology. It is not a calibrated physical or financial simulator.

[← Previous: LiquidityDrought](TF224_LiquidityDrought.md) · [Category 10 catalog](index.md) · [Next: AnalyticNearPole →](TF226_AnalyticNearPole.md)

