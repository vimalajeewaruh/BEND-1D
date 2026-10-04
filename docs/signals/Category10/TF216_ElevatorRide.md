# ElevatorRide


## Overview

The **ElevatorRide** signal contains a positive acceleration plateau, a near-zero cruising interval, a negative braking plateau, and a short damped settling oscillation.

## Mathematical Definition

Define the logistic transition

```math
L(x;c,w)=
\left[1+e^{-(x-c)/w}\right]^{-1}.
```

Define the positive acceleration plateau by

```math
A(x)=
A_A
\left[
L(x;c_{A1},w_A)
-
L(x;c_{A2},w_A)
\right].
```

Define the negative braking plateau by

```math
B(x)=
-A_B
\left[
L(x;c_{B1},w_B)
-
L(x;c_{B2},w_B)
\right].
```

For $x\geq c_{B2}$, let

```math
u=x-c_{B2},
```

and define the settling oscillation by

```math
R(x)=
A_R e^{-\alpha_Ru}
\sin(2\pi f_Ru),
```

with $R(x)=0$ for $x<c_{B2}$.

The signal is

```math
f(x)=
A(x)+B(x)+R(x).
```

[View Elevator Ride](../../assets/images/TF216_ElevatorRide.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Everyday mechanics |
| Structure | Opposing finite logistic plateaus plus causal ring-down |
| Acceleration behavior | Positive plateau between $c_{A1}$ and $c_{A2}$ |
| Braking behavior | Negative plateau between $c_{B1}$ and $c_{B2}$ |
| Settling behavior | Short damped oscillation beginning after braking |
| Regularity | Flat regions joined by sharp smooth transitions |
| Main challenge | Preserving plateau edges and weak final settling |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $A_A$ | Acceleration-plateau amplitude | 0.62 |
| $c_{A1}$ | Acceleration onset | 0.08 |
| $c_{A2}$ | Acceleration termination | 0.22 |
| $w_A$ | Acceleration transition width | 0.008 |
| $A_B$ | Braking-plateau magnitude | 0.58 |
| $c_{B1}$ | Braking onset | 0.68 |
| $c_{B2}$ | Braking termination | 0.80 |
| $w_B$ | Braking transition width | 0.008 |
| $A_R$ | Settling amplitude | 0.18 |
| $\alpha_R$ | Settling decay rate | 22 |
| $f_R$ | Settling frequency | 30 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF216_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF216_python.md)



## Recommended Uses

- Plateau-edge preservation
- Inertial-sensor denoising
- Weak settling-oscillation recovery

## Provenance

This is a deterministic benchmark surrogate inspired by everyday mechanics measurement morphology. It is not a calibrated physical or environmental simulator.

[← Previous: TrafficStopGo](TF215_TrafficStopGo.md) · [Category 10 catalog](index.md) · [Next: ThermostatCycle →](TF217_ThermostatCycle.md)

