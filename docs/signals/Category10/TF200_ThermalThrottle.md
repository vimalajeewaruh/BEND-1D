# ThermalThrottle



## Overview

The **ThermalThrottle** signal represents a smooth thermal rise that is interrupted after a threshold by rapid, nearly discrete throttling cycles and a smaller harmonic controller response.

## Mathematical Definition

Define the smooth logistic transition

```math
L(x;c,w)=
\left[1+e^{-(x-c)/w}\right]^{-1}.
```

Define the saturating thermal trend by

```math
T(x)=
b_0+
A_T\left(1-e^{-\alpha_Tx}\right).
```

Define the throttle gate by

```math
g(x)=
L(x;c_T,w_T).
```

Define the square-wave-like throttling state by

```math
q(x)=
\frac{1}{2}
\left[
1+
\mathrm{sign}
\left(
\sin\left[2\pi f_Q(x-c_T)\right]
\right)
\right].
```

Define the throttling component by

```math
Q(x)=
-A_Qg(x)q(x).
```

Define the harmonic controller response by

```math
H(x)=
A_Hg(x)
\sin\left[
2\pi f_H(x-c_T)
\right].
```

The signal is

```math
f(x)=
T(x)+Q(x)+H(x).
```

[View Thermal Throttle](../../assets/images/TF200_ThermalThrottle.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Computing systems |
| Structure | Saturating thermal trend plus gated square-wave-like throttling and harmonic response |
| Thermal behavior | Smooth exponential rise toward saturation |
| Throttle behavior | Rapid nearly discrete switching beginning near $c_T$ |
| Controller response | Smaller harmonic oscillation active after the throttle onset |
| Regularity | Smooth thermal state with repeated controller discontinuities |
| Main challenge | Preserving switching without turning the thermal state into steps |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $b_0$ | Initial thermal level | 0.12 |
| $A_T$ | Thermal-rise magnitude | 0.78 |
| $\alpha_T$ | Thermal-rise rate | 4 |
| $c_T$ | Throttle onset | 0.44 |
| $w_T$ | Throttle-gate width | 0.01 |
| $A_Q$ | Throttle depth | 0.16 |
| $f_Q$ | Throttle frequency | 12 |
| $A_H$ | Harmonic-response amplitude | 0.045 |
| $f_H$ | Harmonic-response frequency | 24 |

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

