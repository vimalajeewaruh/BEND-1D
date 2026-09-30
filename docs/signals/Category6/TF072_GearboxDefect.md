# GearboxDefect

## Overview

The **GearboxDefect** signal contains persistent modulated vibration and recurring damped impacts that strengthen after the middle of the record.

## Mathematical Definition

Define the modulated carrier

```math
C(x)=
[1+A_m\sin(2\pi f_mx+\delta_m)]
[A_1\sin(2\pi f_1x)+A_2\sin(2\pi f_2x+\delta_2)].
```

Define the impact locations

```math
c_k=c_0+d(k-1),
\qquad k=1,\ldots,K.
```

The impact amplitude is $A_L$ when $c_k\leq x_0$ and $A_H$ when $c_k>x_0$.

With

```math
u_k=(x-c_k)_+,
```

define each impact response, for $x\geq c_k$, as

```math
R_k(x)=a_ke^{-\alpha u_k}\sin(2\pi f_Ru_k),
```

with $R_k(x)=0$ for $x<c_k$.

The signal is

```math
f(x)=C(x)+\sum_{k=1}^{K}R_k(x).
```

[View GearboxDefect signal](../../assets/images/TF072_GearboxDefect.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Modulated carrier with repeated impacts |
| Impact spacing | $d$ |
| Change | Stronger impacts after $x=x_0$ |
| Main challenge | Retaining sparse impacts inside persistent vibration |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $K$ | Number of impacts | 9 |
| $A_m$ | Carrier modulation amplitude | 0.28 |
| $f_m$ | Modulation frequency | 5 |
| $\delta_m$ | Modulation phase shift | -0.3 |
| $A_1,A_2$ | Carrier amplitudes | 0.32, 0.12 |
| $f_1,f_2$ | Carrier frequencies | 46, 92 |
| $\delta_2$ | Second-carrier phase shift | 0.4 |
| $c_0$ | First impact location | 0.12 |
| $d$ | Impact spacing | 0.105 |
| $x_0$ | Impact-amplitude change location | 0.5 |
| $A_L$ | Impact amplitude before change | 0.22 |
| $A_H$ | Impact amplitude after change | 0.38 |
| $\alpha$ | Impact decay rate | 75 |
| $f_R$ | Impact resonance frequency | 125 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF072_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF072_python.md)



## Recommended Uses

- Gearbox condition monitoring
- Embedded-impact preservation
- Deterioration-change detection

## Provenance

**Status:** Gearbox-defect-inspired deterministic mechanical surrogate.

---

[← Previous: PowerGridFault](TF071_PowerGridFault.md) | [Category 6 Catalog](index.md) | [Next: LidarMultiEcho →](TF073_LidarMultiEcho.md)

