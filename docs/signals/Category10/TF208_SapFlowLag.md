# SapFlowLag


## Overview

The **SapFlowLag** signal contains two unequal diurnal hydraulic pulses that activate quickly and decay slowly against a weak background oscillation representing lagged forcing.

## Mathematical Definition

Let the pulse starts, amplitudes, rise time scales, and decay time scales be

```math
\mathbf{c}
=
(0.08,\,0.57),
```

```math
\mathbf{a}
=
(0.78,\,0.70),
```

```math
\mathbf{t}_r
=
(0.040,\,0.050),
```

and

```math
\mathbf{t}_d
=
(0.17,\,0.19).
```

For each $k=1,\ldots,K$, let

```math
u_k=x-c_k.
```

For $x\geq c_k$, define the causal hydraulic pulse by

```math
P_k(x)=
a_k
\left(
1-e^{-u_k/t_{r,k}}
\right)
e^{-u_k/t_{d,k}},
```

with $P_k(x)=0$ for $x<c_k$.

Define the background forcing by

```math
B(x)=
b_0+
A_B\sin(2\pi f_Bx+\delta_B).
```

The signal is

```math
f(x)=
B(x)+
\sum_{k=1}^{K}P_k(x).
```

[View Sap Flow Lag](../../assets/images/TF208_SapFlowLag.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Plant hydraulics |
| Structure | Two asymmetric causal pulses plus low-frequency forcing |
| Pulse behavior | Rapid activation followed by substantially slower decay |
| Cycle behavior | Two recurrent hydraulic responses with unequal amplitudes and time scales |
| Regularity | Smooth and recurrent but nonidentical |
| Main challenge | Preserving cycle-to-cycle differences and long lags |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $b_0$ | Baseline level | 0.12 |
| $A_B$ | Background oscillation amplitude | 0.03 |
| $f_B$ | Background oscillation frequency | 2 |
| $\delta_B$ | Background phase offset | $-0.4$ |
| $K$ | Number of hydraulic pulses | 2 |
| $\mathbf{c}$ | Pulse starts | $(0.08,\,0.57)$ |
| $\mathbf{a}$ | Pulse amplitudes | $(0.78,\,0.70)$ |
| $\mathbf{t}_r$ | Rise time scales | $(0.040,\,0.050)$ |
| $\mathbf{t}_d$ | Decay time scales | $(0.17,\,0.19)$ |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF208_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF208_python.md)



## Recommended Uses

- Diurnal-cycle denoising
- Hydraulic-lag preservation
- Unequal repeated-event recovery

## Provenance

This is a deterministic benchmark surrogate inspired by plant hydraulics measurement morphology. It is not a calibrated physical or clinical simulator.

[← Previous: StomatalClosure](TF207_StomatalClosure.md) · [Category 10 catalog](index.md) · [Next: LeafNyctinasty →](TF209_LeafNyctinasty.md)

