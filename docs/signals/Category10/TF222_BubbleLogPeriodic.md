# BubbleLogPeriodic


## Overview

The **BubbleLogPeriodic** signal represents a speculative-bubble surrogate with accelerating log-periodic oscillations approaching a critical time, followed by an abrupt crash and partial recovery with weak damped ringing.

## Mathematical Definition

Let the critical time be $x_c$ and define, for $x<x_c$,

```math
t=\max(x_c-x,\varepsilon).
```

The pre-crash component is

```math
B(x)=
b_C
-
A_C t^m
\left[
1+
A_L\cos\left(
\omega_L\log t+\delta_L
\right)
\right].
```

For $x\geq x_c$, let

```math
u=x-x_c.
```

Define the post-crash recovery by

```math
R(x)=
b_R+
A_R
\left(
1-e^{-u/\tau_R}
\right).
```

Define the weak post-crash ringing by

```math
Q(x)=
A_Qe^{-\alpha_Qu}
\sin(2\pi f_Qu).
```

The signal is $f(x)=B(x)$ for $x<x_c$, and

```math
f(x)=R(x)+Q(x)
```

for $x\geq x_c$.

[View Bubble Log-Periodic](../../assets/images/TF222_BubbleLogPeriodic.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Finance |
| Structure | Critical power law with log-periodicity and post-crash recovery |
| Pre-crash behavior | Accelerating log-periodic oscillations approaching $x_c$ |
| Crash behavior | Abrupt regime change at the critical time $x_c$ |
| Recovery behavior | Partial exponential recovery with weak damped ringing |
| Regularity | Frequency compression followed by a discontinuous regime change |
| Main challenge | Preserving accelerating oscillations immediately before the crash |

## Parameters

| Symbol | Meaning | Default |
|---|---|---:|
| $x_c$ | Critical time | 0.83 |
| $\varepsilon$ | Lower bound for $t$ | $10^{-5}$ |
| $b_C$ | Pre-crash reference level | 1 |
| $A_C$ | Critical power-law amplitude | 1.05 |
| $m$ | Critical power | 0.55 |
| $A_L$ | Log-periodic modulation depth | 0.14 |
| $\omega_L$ | Log-periodic angular frequency | 8.5 |
| $\delta_L$ | Log-periodic phase offset | 0.4 |
| $b_R$ | Post-crash baseline | 0.24 |
| $A_R$ | Recovery magnitude | 0.42 |
| $\tau_R$ | Recovery time scale | 0.12 |
| $A_Q$ | Ringing amplitude | 0.03 |
| $\alpha_Q$ | Ringing decay rate | 12 |
| $f_Q$ | Ringing frequency | 18 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF222_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF222_python.md)




## Recommended Uses

- Critical-time signal denoising
- Crash localization
- Log-periodic precursor preservation

## Provenance

This is a deterministic benchmark surrogate inspired by finance measurement morphology. It is not a calibrated physical or financial simulator.

[← Previous: ENSOEnvelope](TF221_ENSOEnvelope.md) · [Category 10 catalog](index.md) · [Next: IntradayVolatilityU →](TF223_IntradayVolatilityU.md)

