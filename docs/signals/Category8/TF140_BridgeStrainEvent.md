# BridgeStrainEvent

## Overview

The **BridgeStrainEvent** signal combines slow thermal drift, four repeated vehicle-load-like responses, a small slip transition, and damped structural vibration.

## Mathematical Definition

Define the smooth step

```math
S(x;c,w)=
\left[1+e^{-(x-c)/w}\right]^{-1}.
```

Define the Gaussian function

```math
g(x;c,w)=
\exp\left[
-\frac12\left(\frac{x-c}{w}\right)^2
\right].
```

Define the thermal-drift component

```math
B(x)=
b_0+mx+A_B\sin(2\pi f_Bx).
```

Define the repeated vehicle-load responses

```math
L(x)=
A_L\sum_{k=1}^{K}g(x;c_k,w_L).
```

The vehicle-load locations are

```math
\mathbf{c}
=
(0.18,\,0.34,\,0.52,\,0.76).
```

Define the slip transition

```math
S_L(x)=
A_SS(x;c_S,w_S).
```

Let

```math
u=(x-c_S)_+.
```

For $x\geq c_S$, define the damped structural vibration

```math
R(x)=
A_Re^{-\alpha_Ru}
\sin(2\pi f_Ru),
```

with $R(x)=0$ for $x<c_S$.

The signal is

```math
f(x)=B(x)+L(x)+S_L(x)+R(x).
```

[View BridgeStrainEvent signal](../../assets/images/TF140_BridgeStrainEvent.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Drift, repeated loads, slip, and damped vibration |
| Thermal drift | Linear trend with a low-frequency oscillatory component |
| Load responses | $K$ broad positive events at locations specified by $\mathbf{c}$ |
| Structural event | Slip transition and damped vibration beginning at $c_S$ |
| Main challenge | Distinguishing local structural change from ordinary drift |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $b_0$ | Baseline strain level | 0.18 |
| $m$ | Linear thermal-drift slope | 0.16 |
| $A_B$ | Thermal-oscillation amplitude | 0.05 |
| $f_B$ | Thermal-oscillation frequency | 1.5 |
| $K$ | Number of vehicle-load responses | 4 |
| $\mathbf{c}$ | Vehicle-load locations | $(0.18,\,0.34,\,0.52,\,0.76)$ |
| $A_L$ | Vehicle-load amplitude | 0.16 |
| $w_L$ | Vehicle-load width | 0.025 |
| $A_S$ | Slip magnitude | 0.10 |
| $c_S$ | Slip location | 0.62 |
| $w_S$ | Slip transition width | 0.004 |
| $A_R$ | Structural-vibration amplitude | 0.10 |
| $\alpha_R$ | Structural-vibration decay rate | 12 |
| $f_R$ | Structural-vibration frequency | 28 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF140_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF140_python.md)


## Recommended Uses

- Structural-health-monitoring denoising
- Slip-event localization
- Drift and vibration separation

## Provenance

**Status:** Bridge-strain-monitoring-inspired deterministic surrogate.

---

[← Previous: TerahertzLayerEcho](TF139_TerahertzLayerEcho.md) | [Category 8 Catalog](index.md) | [Next: MishMashAlpha →](TF141_MishMashAlpha.md)
