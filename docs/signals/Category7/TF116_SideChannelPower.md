# SideChannelPower


## Overview

The **SideChannelPower** signal contains repeated damped computation-like transients and one intentionally weak localized perturbation near the fifth operation.

## Mathematical Definition

## Overview

The **SideChannelPower** signal contains repeated damped computation-like transients and one intentionally weak localized perturbation near the fifth operation.

## Mathematical Definition

Define the Gaussian function

```math
g(x;c,w)=
\exp\left[
-\frac12\left(\frac{x-c}{w}\right)^2
\right].
```

Let the nominal operation times be

```math
\mathcal{C}
=
(0.10,\,0.21,\,0.32,\,0.43,\,0.54,\,0.65,\,0.76,\,0.87).
```

Define the low-amplitude background

```math
B(x)=b_0+A_B\sin(2\pi f_Bx).
```

For each $c\in\mathcal{C}$, define

```math
u_c=(x-c)_+.
```

For $x\geq c$, define the damped computation-like transient

```math
T_c(x)=
A_Te^{-\alpha_Tu_c}
\sin(2\pi f_Tu_c),
```

with $T_c(x)=0$ for $x<c$.

The complete transient component is

```math
T(x)=
\sum_{c\in\mathcal{C}}T_c(x).
```

Define the weak localized perturbation

```math
P(x)=A_Pg(x;c_P,w_P).
```

The signal is

```math
f(x)=B(x)+T(x)+P(x).
```

[View SideChannelPower signal](../../assets/images/TF116_SideChannelPower.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Repeated damped computation transients |
| Repetition | $K$ nominal operation times specified by $\mathcal{C}$ |
| Transients | Rapidly decaying oscillatory responses following each operation |
| Weak perturbation | Narrow positive feature centered at $c_P$ |
| Main challenge | Detecting a small operation-specific change in structured activity |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $b_0$ | Baseline level | 0.10 |
| $A_B$ | Background oscillation amplitude | 0.018 |
| $f_B$ | Background oscillation frequency | 3 |
| $K$ | Number of nominal operations | 8 |
| $\mathcal{C}$ | Nominal operation times | $(0.10,\,0.21,\,0.32,\,0.43,\,0.54,\,0.65,\,0.76,\,0.87)$ |
| $A_T$ | Computation-transient amplitude | 0.24 |
| $\alpha_T$ | Transient decay rate | 60 |
| $f_T$ | Transient frequency | 75 |
| $A_P$ | Weak-perturbation amplitude | 0.055 |
| $c_P$ | Weak-perturbation center | 0.54 |
| $w_P$ | Weak-perturbation width | 0.010 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF116_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF116_python.md)



## Recommended Uses

- Side-channel-trace denoising
- Repeated-transient alignment
- Weak-perturbation detection

## Provenance

**Status:** Computation-power-side-channel-inspired deterministic surrogate.

---

[← Previous: HyperspectralMineral](TF115_HyperspectralMineral.md) | [Category 7 Catalog](index.md) | [Next: SecurityBeacon →](TF117_SecurityBeacon.md)
