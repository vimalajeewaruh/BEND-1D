# WindTurbineGustControl


## Overview

The **WindTurbineGustControl** signal combines two blade-related oscillations, a strong gust, a damped controller response, and a shifted operating level.

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

Define the periodic baseline

```math
B(x)=
b_0
+A_1\sin(2\pi f_1x)
+A_2\sin(2\pi f_2x).
```

Define the gust component

```math
G(x)=
A_Gg(x;c_G,w_G).
```

Let

```math
u=(x-c_R)_+.
```

For $x\geq c_R$, define the damped controller response

```math
R(x)=
A_Re^{-\alpha_Ru}
\sin(2\pi f_Ru),
```

with $R(x)=0$ for $x<c_R$.

Define the operating-level shift

```math
L(x)=
A_LS(x;c_L,w_L).
```

The signal is

```math
f(x)=B(x)+G(x)+R(x)+L(x).
```

[View WindTurbineGustControl signal](../../assets/images/TF134_WindTurbineGustControl.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Periodic baseline, gust, control response, and shift |
| Blade-related oscillations | Two periodic components with frequencies $f_1$ and $f_2$ |
| Gust | Broad positive event centered at $c_G$ |
| Controller response | Damped oscillation beginning at $c_R$ |
| Operating-level shift | Positive transition beginning near $c_L$ |
| Main challenge | Preserving smooth periodic behavior and abrupt forcing together |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $b_0$ | Baseline operating level | 0.25 |
| $A_1$ | First blade-oscillation amplitude | 0.08 |
| $f_1$ | First blade-oscillation frequency | 6 |
| $A_2$ | Second blade-oscillation amplitude | 0.03 |
| $f_2$ | Second blade-oscillation frequency | 18 |
| $A_G$ | Gust amplitude | 0.48 |
| $c_G$ | Gust center | 0.49 |
| $w_G$ | Gust width | 0.035 |
| $c_R$ | Controller-response onset | 0.50 |
| $A_R$ | Controller-response amplitude | 0.20 |
| $\alpha_R$ | Controller-response decay rate | 9 |
| $f_R$ | Controller-response frequency | 15 |
| $A_L$ | Operating-level shift magnitude | 0.12 |
| $c_L$ | Operating-level shift location | 0.56 |
| $w_L$ | Operating-level shift width | 0.020 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF134_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF134_python.md)



## Recommended Uses

- Wind-turbine telemetry denoising
- Gust-event recovery
- Controller-response preservation

## Provenance

**Status:** Wind-turbine-gust-control-inspired deterministic surrogate.

---

[← Previous: ATACChromatinAccessibility](TF133_ATACChromatinAccessibility.md) | [Category 8 Catalog](index.md) | [Next: EVFastCharge →](TF135_EVFastCharge.md)
