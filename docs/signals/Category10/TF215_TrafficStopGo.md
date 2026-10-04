# TrafficStopGo


## Overview

The **TrafficStopGo** signal represents a slowly varying cruising level repeatedly interrupted by rapid speed loss and slower recovery, with unequal event depths and time scales.

## Mathematical Definition

Let the event centers and depths be

```math
\mathbf{c}
=
(0.18,\,0.38,\,0.59,\,0.78),
```

and

```math
\mathbf{a}
=
(0.48,\,0.38,\,0.55,\,0.44).
```

For each $k=1,\ldots,K$, let

```math
u_k=x-c_k.
```

For $x\geq c_k$, define the asymmetric stop–go event by

```math
D_k(x)=
a_k
\left(
1-e^{-u_k/t_{f,k}}
\right)
e^{-u_k/t_{s,k}},
```

with $D_k(x)=0$ for $x<c_k$.

Define the slowly varying cruising baseline by

```math
B(x)=
b_0+
A_B\sin(2\pi f_Bx).
```

The signal is

```math
f(x)=
B(x)-
\sum_{k=1}^{K}D_k(x).
```

[View Traffic Stop-Go](../../assets/images/TF215_TrafficStopGo.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Transportation |
| Structure | Low-frequency baseline minus four asymmetric causal pulses |
| Event behavior | Rapid speed loss followed by slower recovery |
| Cycle behavior | Recurrent events with unequal depths and time scales |
| Regularity | Smooth, recurrent, and irregular |
| Main challenge | Preserving cycle asymmetry and event-to-event variation |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $b_0$ | Cruising baseline level | 0.72 |
| $A_B$ | Baseline oscillation amplitude | 0.05 |
| $f_B$ | Baseline oscillation frequency | 0.8 |
| $K$ | Number of stop–go events | 4 |
| $\mathbf{c}$ | Event centers | $(0.18,\,0.38,\,0.59,\,0.78)$ |
| $\mathbf{a}$ | Event depths | $(0.48,\,0.38,\,0.55,\,0.44)$ |
| $\mathbf{t}_f$ | Fast time scales | $0.012$–$0.020$ |
| $\mathbf{t}_s$ | Slow recovery time scales | $0.08$–$0.11$ |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF215_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF215_python.md)



## Recommended Uses

- Stop-and-go waveform denoising
- Repeated-event preservation
- Asymmetric recovery estimation

## Provenance

This is a deterministic benchmark surrogate inspired by transportation measurement morphology. It is not a calibrated physical or environmental simulator.

[← Previous: DrumModePacket](TF214_DrumModePacket.md) · [Category 10 catalog](index.md) · [Next: ElevatorRide →](TF216_ElevatorRide.md)

