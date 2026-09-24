# ThermalThrottle



## Overview

A smooth thermal rise is interrupted after threshold by rapid, nearly discrete throttling cycles and a smaller harmonic controller response.

## Mathematical Definition

Let $L(x;c,w)=[1+e^{-(x-c)/w}]^{-1}$,
$$
T(x)=0.12+0.78(1-e^{-4x}),\qquad g(x)=L(x;0.44,0.01),
$$
and
$$
q(x)=\frac12[1+\mathrm{sign}\{\sin(24\pi(x-0.44))\}].
$$
Then
$$
f(x)=T(x)-0.16g(x)q(x)+0.045g(x)\sin\{48\pi(x-0.44)\}.
$$

[ThermalThrottle signal](../../assets/images/TF200_ThermalThrottle.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Computing systems |
| Structure | Saturating trend plus gated square-wave-like control |
| Regularity | Smooth state with repeated controller discontinuities |
| Main challenge | Preserve switching without turning the thermal state into steps |

## Parameters

| Parameter | Value |
|---|---|
| Throttle onset | $0.44$ |
| Throttle frequency | $12$ cycles/unit |
| Throttle depth | $0.16$ |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF200_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF200_python.md)



## Recommended Uses

- Controller-switch preservation
- Thermal-trend smoothing
- Mixed smooth/discrete recovery

## Provenance

This is a deterministic benchmark surrogate inspired by computing systems measurement morphology. It is not a calibrated physical simulator.

[← Previous: NetworkCongestionBurst](TF199_NetworkCongestionBurst.md) · [Category 10 catalog](index.md) · [Next: CGMMealStack →](TF201_CGMMealStack.md)

