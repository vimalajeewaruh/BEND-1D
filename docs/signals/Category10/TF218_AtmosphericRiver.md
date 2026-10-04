# AtmosphericRiver


## Overview

The **AtmosphericRiver** signal contains a long asymmetric moisture pulse with two smaller positive frontal peaks and a narrow negative feature embedded in its extended decay.

## Mathematical Definition

Define the Gaussian profile

```math
G(x;c,w)=
\exp\left[
-\frac{1}{2}
\left(
\frac{x-c}{w}
\right)^2
\right].
```

For $x\geq c_M$, let

```math
u=x-c_M,
```

and define the main moisture pulse by

```math
h(x)=
\left(
\frac{u}{\tau_M}
\right)^{p_M}
\exp\left(
p_M-\frac{u}{\tau_M}
\right),
```

with $h(x)=0$ for $x<c_M$.

Define the normalized moisture envelope by

```math
M(x)=
\frac{h(x)}
{\max_i h(x_i)}.
```

Define the two positive frontal features by

```math
P(x)=
A_{P1}G(x;c_{P1},w_{P1})
+
A_{P2}G(x;c_{P2},w_{P2}).
```

Define the narrow negative feature by

```math
N(x)=
-A_NG(x;c_N,w_N).
```

The signal is

```math
f(x)=
b_0+
A_MM(x)+
P(x)+
N(x).
```

[View Atmospheric River](../../assets/images/TF218_AtmosphericRiver.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Climate |
| Structure | Normalized gamma-like envelope plus embedded Gaussian features |
| Main-event behavior | Broad asymmetric moisture pulse with an extended decay |
| Frontal behavior | Two smaller positive peaks embedded within the dominant event |
| Negative behavior | Narrow negative feature occurring on the decaying portion |
| Regularity | Smooth, broad, and multiscale |
| Main challenge | Preserving small fronts inside a dominant long event |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $b_0$ | Baseline level | 0.12 |
| $A_M$ | Main-pulse amplitude | 0.82 |
| $c_M$ | Main-pulse onset | 0.12 |
| $\tau_M$ | Main-pulse time scale | 0.16 |
| $p_M$ | Main-pulse shape power | 2 |
| $A_{P1}$ | First positive-front amplitude | 0.16 |
| $c_{P1}$ | First positive-front center | 0.43 |
| $w_{P1}$ | First positive-front width | 0.025 |
| $A_{P2}$ | Second positive-front amplitude | 0.12 |
| $c_{P2}$ | Second positive-front center | 0.58 |
| $w_{P2}$ | Second positive-front width | 0.032 |
| $A_N$ | Negative-feature magnitude | 0.07 |
| $c_N$ | Negative-feature center | 0.71 |
| $w_N$ | Negative-feature width | 0.018 |
## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF218_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF218_python.md)



## Recommended Uses

- Broad-event denoising
- Embedded-front preservation
- Asymmetric climate-pulse recovery

## Provenance

This is a deterministic benchmark surrogate inspired by climate measurement morphology. It is not a calibrated physical or environmental simulator.

[← Previous: ThermostatCycle](TF217_ThermostatCycle.md) · [Category 10 catalog](index.md) · [Next: HeatwaveFrontBreak →](TF219_HeatwaveFrontBreak.md)

