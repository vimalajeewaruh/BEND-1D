# GPUThermalThrottle


## Overview

The **GPUThermalThrottle** signal rises smoothly toward a high-load thermal state, drops sharply at throttling, and develops controller-driven oscillation around the reduced operating level.

## Mathematical Definition

Let $S(x;c,w)=[1+e^{-(x-c)/w}]^{-1}$. Then

$$
f(x)=0.20+0.55S(x;0.28,0.060)-0.22S(x;0.64,0.008)+0.06\sin(16\pi x)S(x;0.64,0.010).
$$

[GPUThermalThrottle signal](../../assets/images/TF118_GPUThermalThrottle.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Smooth rise, sharp throttle, and post-transition oscillation |
| Load/thermal rise | Begins around $x=0.28$ |
| Throttling | Sharp decrease near $x=0.64$ |
| Main challenge | Preserving the controller oscillation after the regime change |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $0.55$ | Pre-throttle rise | 0.55 |
| $-0.22$ | Throttle drop | -0.22 |
| $0.06$ | Controller-oscillation amplitude | 0.06 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF118_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF118_python.md)


## Recommended Uses

- GPU telemetry smoothing
- Throttling-transition localization
- Controller-oscillation preservation

## Provenance

**Status:** GPU-thermal-throttling-inspired deterministic infrastructure surrogate.

---

[← Previous: SecurityBeacon](TF117_SecurityBeacon.md) | [Category 7 Catalog](index.md) | [Next: MoELoadImbalance →](TF119_MoELoadImbalance.md)
