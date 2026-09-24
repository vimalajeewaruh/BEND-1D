# ElevatorRide


## Overview

The acceleration trace contains a positive plateau, near-zero cruise, a negative braking plateau, and a short damped settling oscillation.

## Mathematical Definition

With $L(x;c,w)=[1+e^{-(x-c)/w}]^{-1}$ and $u=(x-0.80)_+$,
$$
\begin{aligned}
f(x)={}&0.62[L(x;0.08,0.008)-L(x;0.22,0.008)]\\
&-0.58[L(x;0.68,0.008)-L(x;0.80,0.008)]\\
&+I(x\ge0.80)0.18e^{-22u}\sin(60\pi u).
\end{aligned}
$$

[ElevatorRide signal](../../assets/images/TF216_ElevatorRide.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Everyday mechanics |
| Structure | Opposing finite logistic plateaus plus causal ring-down |
| Regularity | Flat regions joined by sharp smooth transitions |
| Main challenge | Preserve plateau edges and weak final settling |

## Parameters

| Parameter | Value |
|---|---|
| Acceleration interval | $0.08$–$0.22$ |
| Braking interval | $0.68$–$0.80$ |
| Settling frequency/decay | $30/22$ |

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

