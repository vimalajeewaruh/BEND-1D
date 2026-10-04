# SpaceWeatherStorm


## Overview

The **SpaceWeatherStorm** signal has a quiet periodic background, sudden commencement, deep storm depression, three substorm-like excursions, and prolonged recovery.

## Mathematical Definition

Define the smooth step

```math
S(x;c,w)=\left[1+e^{-(x-c)/w}\right]^{-1}.
```

Define the Gaussian function

```math
g(x;c,w)=
\exp\left[
-\frac12
\left(\frac{x-c}{w}\right)^2
\right].
```

Define the quiet periodic background

```math
B(x)=b_0+A_B\sin(2\pi f_Bx).
```

Define the sudden commencement

```math
C(x)=A_C S(x;c_C,w_C).
```

Define the storm depression

```math
D(x)=-A_D S(x;c_D,w_D).
```

For $x\geq c_R$, define the prolonged recovery component as

```math
R(x)=
A_R
\left[
1-e^{-k_R(x-c_R)}
\right],
```

with $R(x)=0$ for $x<c_R$.

Let the substorm-event centers be

```math
\mathcal{C}=(0.52,\,0.61,\,0.69).
```

Define the substorm-like excursions

```math
Q(x)=
-A_Q
\sum_{c\in\mathcal{C}}
g(x;c,w_Q).
```

The signal is

```math
f(x)=B(x)+C(x)+D(x)+R(x)+Q(x).
```

[View SpaceWeatherStorm signal](../../assets/images/TF113_SpaceWeatherStorm.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Sudden change, deep depression, excursions, and recovery |
| Background | Quiet periodic variation around baseline $b_0$ |
| Commencement | Positive change near $c_C$ |
| Storm onset | Broad negative transition near $c_D$ |
| Recovery | Prolonged recovery beginning at $c_R$ |
| Substorm events | Three negative excursions centered at $\mathcal{C}$ |
| Main challenge | Preserving substorm features throughout a long recovery |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $b_0$ | Baseline level | 0.10 |
| $A_B$ | Background oscillation amplitude | 0.025 |
| $f_B$ | Background oscillation frequency | 3 |
| $A_C$ | Sudden-commencement magnitude | 0.20 |
| $c_C$ | Sudden-commencement location | 0.30 |
| $w_C$ | Sudden-commencement transition width | 0.006 |
| $A_D$ | Storm-depression magnitude | 0.75 |
| $c_D$ | Storm-depression location | 0.38 |
| $w_D$ | Storm-depression transition width | 0.018 |
| $A_R$ | Recovery magnitude | 0.55 |
| $c_R$ | Recovery onset location | 0.47 |
| $k_R$ | Recovery rate | 3.5 |
| $\mathcal{C}$ | Substorm-event centers | $(0.52,\,0.61,\,0.69)$ |
| $A_Q$ | Substorm-excursion magnitude | 0.10 |
| $w_Q$ | Substorm-excursion width | 0.012 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF113_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF113_python.md)



## Recommended Uses

- Space-weather time-series denoising
- Storm-onset and recovery preservation
- Weak-substorm detection

## Provenance

**Status:** Geomagnetic-storm-inspired deterministic space-weather surrogate.

---

[← Previous: CryogenicPulse](TF112_CryogenicPulse.md) | [Category 7 Catalog](index.md) | [Next: GNSSMultipathSlip →](TF114_GNSSMultipathSlip.md)
