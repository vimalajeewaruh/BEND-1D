# EVFastCharge


## Overview

The **EVFastCharge** signal contains a long nonlinear rise, an intermediate charging-regime change, thermal derating, small control ripple, and final saturation.

## Mathematical Definition

Define the smooth step

```math
S(x;c,w)=
\left[1+e^{-(x-c)/w}\right]^{-1}.
```

Define the primary charging rise

```math
R(x)=
A_R S(x;c_R,w_R).
```

Define the intermediate charging-regime change

```math
C(x)=
A_C S(x;c_C,w_C).
```

Define the thermal derating component

```math
D(x)=
-A_D S(x;c_D,w_D).
```

Define the control ripple

```math
P(x)=
A_P\sin(2\pi f_Px)S(x;c_P,w_P).
```

Define the final saturation component

```math
F(x)=
A_F S(x;c_F,w_F).
```

The signal is

```math
f(x)=
b_0+R(x)+C(x)+D(x)+P(x)+F(x).
```

[View EVFastCharge signal](../../assets/images/TF135_EVFastCharge.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Smooth rise with multiple regime changes and ripple |
| Initial charging rise | Broad positive transition centered at $c_R$ |
| Regime change | Additional positive transition centered at $c_C$ |
| Derating | Negative transition centered at $c_D$ |
| Control ripple | Small oscillation activated near $c_P$ |
| Saturation | Final positive transition centered at $c_F$ |
| Main challenge | Retaining subtle transitions within a dominant smooth trend |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $b_0$ | Baseline charging level | 0.18 |
| $A_R$ | Primary-rise magnitude | 0.55 |
| $c_R$ | Primary-rise center | 0.20 |
| $w_R$ | Primary-rise width | 0.10 |
| $A_C$ | Regime-change magnitude | 0.22 |
| $c_C$ | Regime-change center | 0.58 |
| $w_C$ | Regime-change width | 0.035 |
| $A_D$ | Derating magnitude | 0.12 |
| $c_D$ | Derating center | 0.72 |
| $w_D$ | Derating width | 0.010 |
| $A_P$ | Control-ripple amplitude | 0.015 |
| $f_P$ | Control-ripple frequency | 18 |
| $c_P$ | Control-ripple onset center | 0.25 |
| $w_P$ | Control-ripple onset width | 0.03 |
| $A_F$ | Final saturation magnitude | 0.07 |
| $c_F$ | Final saturation center | 0.88 |
| $w_F$ | Final saturation width | 0.025 |


## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF135_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF135_python.md)



## Recommended Uses

- EV charging-curve smoothing
- Regime-transition preservation
- Low-amplitude ripple recovery

## Provenance

**Status:** Electric-vehicle-fast-charging-inspired deterministic surrogate.

---

[← Previous: WindTurbineGustControl](TF134_WindTurbineGustControl.md) | [Category 8 Catalog](index.md) | [Next: GridInverterOscillation →](TF136_GridInverterOscillation.md)
