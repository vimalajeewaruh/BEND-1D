# DASFiberEvent


## Overview

The **DASFiberEvent** signal combines a weak background, localized chirped wave packet with gradual fading, and a smaller high-frequency secondary echo.

## Mathematical Definition

Define the weak background component

```math
B(x)=A_B\sin(2\pi f_Bx)+mx.
```

Define the localized chirped wave packet

```math
P(x)=
A_P
\exp\left[
-\frac12\left(\frac{x-c_P}{w_P}\right)^2
\right]
\sin\left[
2\pi(f_Px+\beta_Px^2)
\right].
```

Define the gradual fading factor

```math
F(x)=1-\gamma x.
```

Define the secondary echo

```math
E(x)=
A_E
\exp\left[
-\frac12\left(\frac{x-c_E}{w_E}\right)^2
\right]
\sin(2\pi f_Ex).
```

The signal is

```math
f(x)=B(x)+F(x)P(x)+E(x).
```

[view DASFiberEvent signal](../../assets/images/TF126_DASFiberEvent.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Localized chirp with fading and echo |
| Background | Weak oscillation with a small linear trend |
| Main packet | Centered at $c_P$ with width $w_P$ |
| Chirp | Local frequency increases according to $\beta_P$ |
| Fading | Main-packet amplitude gradually decreases through $F(x)$ |
| Secondary echo | Narrow high-frequency packet centered at $c_E$ |
| Main challenge | Preserving changing local frequency in a low-amplitude record |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $A_B$ | Background oscillation amplitude | 0.035 |
| $f_B$ | Background oscillation frequency | 3 |
| $m$ | Background trend slope | 0.015 |
| $A_P$ | Main-packet amplitude | 0.28 |
| $c_P$ | Main-packet center | 0.46 |
| $w_P$ | Main-packet width | 0.075 |
| $f_P$ | Main-packet base frequency | 18 |
| $\beta_P$ | Quadratic chirp coefficient | 14 |
| $\gamma$ | Main-packet fading rate | 0.25 |
| $A_E$ | Echo amplitude | 0.10 |
| $c_E$ | Echo center | 0.64 |
| $w_E$ | Echo width | 0.025 |
| $f_E$ | Echo frequency | 45 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF126_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF126_python.md)



## Recommended Uses

- Distributed-acoustic-sensing denoising
- Localized-chirp preservation
- Weak-echo recovery

## Provenance

**Status:** Distributed-acoustic-sensing-inspired deterministic surrogate.

---

[Category 8 Catalog](index.md) | [Next: PhotoacousticAline →](TF127_PhotoacousticAline.md)
