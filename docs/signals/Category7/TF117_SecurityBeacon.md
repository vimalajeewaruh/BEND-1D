# SecurityBeacon


## Overview

The **SecurityBeacon** signal combines four irregular traffic bursts with a weak 18-cycle periodic component and slower background variation.

## Mathematical Definition

Define the Gaussian function

```math
g(x;c,w)=
\exp\left[
-\frac12\left(\frac{x-c}{w}\right)^2
\right].
```

Let the traffic-burst centers be

```math
\mathcal{C}
=
(0.18,\,0.42,\,0.67,\,0.83).
```

Define the slowly varying background

```math
B(x)=
b_0+A_B\sin(2\pi f_Bx).
```

Define the traffic-burst component

```math
T(x)=
A_T
\sum_{c\in\mathcal{C}}
g(x;c,w_T).
```

Define the weak beacon component

```math
Q(x)=
A_Q\sin(2\pi f_Qx).
```

The signal is

```math
f(x)=B(x)+T(x)+Q(x).
```


[View SecurityBeacon signal](../../assets/images/TF117_SecurityBeacon.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Irregular bursts plus weak periodic component |
| Background | Slow oscillatory variation with frequency $f_B$ |
| Traffic events | Four broad localized bursts centered at $\mathcal{C}$ |
| Beacon | Low-amplitude periodic component with frequency $f_Q$ |
| Main challenge | Preserving hidden periodicity within ordinary-looking activity |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $b_0$ | Baseline level | 0.20 |
| $A_B$ | Background oscillation amplitude | 0.05 |
| $f_B$ | Background oscillation frequency | 2 |
| $K$ | Number of traffic bursts | 4 |
| $\mathcal{C}$ | Traffic-burst centers | $(0.18,\,0.42,\,0.67,\,0.83)$ |
| $A_T$ | Traffic-burst amplitude | 0.18 |
| $w_T$ | Traffic-burst width | 0.020 |
| $A_Q$ | Beacon amplitude | 0.045 |
| $f_Q$ | Beacon frequency | 18 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF117_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF117_python.md)



## Recommended Uses

- Network-telemetry denoising
- Weak-periodicity recovery
- Beacon-detection benchmarking

## Provenance

**Status:** Cybersecurity-beacon-traffic-inspired deterministic surrogate.

---

[← Previous: SideChannelPower](TF116_SideChannelPower.md) | [Category 7 Catalog](index.md) | [Next: GPUThermalThrottle →](TF118_GPUThermalThrottle.md)
