# NetworkCongestionBurst


## Overview

The **NetworkCongestionBurst** signal represents a smooth load increase approaching saturation, followed by a gated sawtooth queue-burst train and a final release.

## Mathematical Definition

Define the smooth logistic transition

```math
L(x;c,w)=
\left[1+e^{-(x-c)/w}\right]^{-1}.
```

Define the evolving load baseline by

```math
b(x)=
b_0
+
A_L L(x;c_L,w_L)
-
A_R L(x;c_R,w_R).
```

Define the burst gate by

```math
g(x)=
L(x;c_1,w_g)
-
L(x;c_2,w_g).
```

Define the sawtooth phase by

```math
q(x)=
f_S(x-c_1).
```

The bounded sawtooth is

```math
r(x)=
2\left[
q(x)-\lfloor q(x)\rfloor
\right]-1.
```

Define the queue-burst component by

```math
Q(x)=
A_Q g(x)r(x).
```

The signal is

```math
f(x)=
b(x)+Q(x).
```

[View Network Congestion Burst](../../assets/images/TF199_NetworkCongestionBurst.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Networks |
| Structure | Two logistic load transitions plus a gated bounded sawtooth train |
| Load behavior | Smooth increase toward saturation followed by a final release |
| Burst behavior | Repeated sawtooth queue bursts localized between $c_1$ and $c_2$ |
| Regularity | Smooth trend combined with repeated nonsmooth resets |
| Main challenge | Separating queue bursts from the evolving load curve |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $b_0$ | Baseline load level | 0.15 |
| $A_L$ | Load-increase magnitude | 0.78 |
| $c_L$ | Load-increase center | 0.22 |
| $w_L$ | Load-increase width | 0.065 |
| $A_R$ | Final-release magnitude | 0.62 |
| $c_R$ | Final-release center | 0.82 |
| $w_R$ | Final-release width | 0.035 |
| $c_1$ | Burst-gate onset | 0.46 |
| $c_2$ | Burst-gate termination | 0.78 |
| $w_g$ | Burst-gate transition width | 0.010 |
| $A_Q$ | Queue-burst amplitude | 0.17 |
| $f_S$ | Sawtooth rate | 18 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF199_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF199_python.md)


## Recommended Uses

- Congestion-burst recovery
- Trend-plus-reset denoising
- Saturation transition preservation

## Provenance

This is a deterministic benchmark surrogate inspired by networks measurement morphology. It is not a calibrated physical simulator.

[← Previous: ValveChatter](TF198_ValveChatter.md) · [Category 10 catalog](index.md) · [Next: ThermalThrottle →](TF200_ThermalThrottle.md)

