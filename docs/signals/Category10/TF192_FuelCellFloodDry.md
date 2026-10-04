# FuelCellFloodDry


## Overview

The **FuelCellFloodDry** signal represents three operating cycles containing rapid performance loss followed by slower recovery, with unequal amplitudes and recovery time scales.

## Mathematical Definition

Let the event centers, loss amplitudes, fast time scales, and slow time scales be

```math
\mathbf{c}
=
(0.20,\,0.50,\,0.76),
```

```math
\mathbf{a}
=
(0.36,\,0.48,\,0.32),
```

```math
\mathbf{t}_f
=
(0.010,\,0.012,\,0.008),
```

and

```math
\mathbf{t}_s
=
(0.095,\,0.135,\,0.080).
```

For each $k=1,\ldots,K$, let

```math
u_k=x-c_k.
```

For $x\geq c_k$, define the asymmetric causal loss component by

```math
P_k(x)=
-a_k
\left(
1-e^{-u_k/t_{f,k}}
\right)
e^{-u_k/t_{s,k}},
```

with $P_k(x)=0$ for $x<c_k$.

Define the baseline component by

```math
B(x)=
b_0+
A_B\sin(2\pi f_Bx).
```

The signal is

```math
f(x)=
B(x)+
\sum_{k=1}^{K}P_k(x).
```

[View Fuel Cell Flood Dry](../../assets/images/TF192_FuelCellFloodDry.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Energy systems |
| Structure | Baseline plus three negative asymmetric causal pulses |
| Event behavior | Rapid performance losses followed by slower recoveries |
| Time-scale behavior | Distinct fast activation and slow recovery scales for each event |
| Regularity | Smooth but sharply activated and multirate |
| Main challenge | Preserving both rapid losses and long recovery tails |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $b_0$ | Baseline level | 0.82 |
| $A_B$ | Baseline oscillation amplitude | 0.03 |
| $f_B$ | Baseline oscillation frequency | 2 |
| $K$ | Number of loss-recovery events | 3 |
| $\mathbf{c}$ | Event centers | $(0.20,\,0.50,\,0.76)$ |
| $\mathbf{a}$ | Loss amplitudes | $(0.36,\,0.48,\,0.32)$ |
| $\mathbf{t}_f$ | Fast time scales | $(0.010,\,0.012,\,0.008)$ |
| $\mathbf{t}_s$ | Slow recovery time scales | $(0.095,\,0.135,\,0.080)$ |


## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF192_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF192_python.md)




## Recommended Uses

- Asymmetric event denoising
- Cycle-to-cycle comparison
- Tail-preserving recovery

## Provenance

This is a deterministic benchmark surrogate inspired by energy systems measurement morphology. It is not a calibrated physical simulator.

[← Previous: BatteryKnee](TF191_BatteryKnee.md) · [Category 10 catalog](index.md) · [Next: GNSSMultipathFade →](TF193_GNSSMultipathFade.md)

