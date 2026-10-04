# GPUThermalThrottle


## Overview

The **GPUThermalThrottle** signal rises smoothly toward a high-load thermal state, drops sharply at throttling, and develops controller-driven oscillation around the reduced operating level.

## Mathematical Definition

Define the smooth step

```math
S(x;c,w)=\left[1+e^{-(x-c)/w}\right]^{-1}.
```

Define the thermal-rise component

```math
R(x)=A_R S(x;c_R,w_R).
```

Define the throttling drop

```math
D(x)=-A_D S(x;c_D,w_D).
```

Define the post-throttle controller oscillation

```math
O(x)=
A_O\sin(2\pi f_Ox)
S(x;c_D,w_O).
```

The signal is

```math
f(x)=b_0+R(x)+D(x)+O(x).
```


[View GPUThermalThrottle signal](../../assets/images/TF118_GPUThermalThrottle.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Smooth rise, sharp throttle, and post-transition oscillation |
| Load/thermal rise | Begins around $c_R$ with transition width $w_R$ |
| Throttling | Sharp decrease near $c_D$ |
| Controller response | Oscillation with frequency $f_O$ emerges after throttling |
| Main challenge | Preserving the controller oscillation after the regime change |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $b_0$ | Baseline level | 0.20 |
| $A_R$ | Pre-throttle rise magnitude | 0.55 |
| $c_R$ | Thermal-rise location | 0.28 |
| $w_R$ | Thermal-rise transition width | 0.060 |
| $A_D$ | Throttle-drop magnitude | 0.22 |
| $c_D$ | Throttling location | 0.64 |
| $w_D$ | Throttle transition width | 0.008 |
| $A_O$ | Controller-oscillation amplitude | 0.06 |
| $f_O$ | Controller-oscillation frequency | 8 |
| $w_O$ | Controller-oscillation onset width | 0.010 |

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
