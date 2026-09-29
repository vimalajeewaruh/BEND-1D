# StampShadeRun

## Overview

The **StampShadeRun** signal represents a color coordinate, optical density, or similar shade measurement observed through a stamp-printing run. A meaningful batch change is embedded in otherwise smooth press and ink drift, with weak repeatable production oscillations.

## Mathematical Definition

Define

$$
b(x)=b_0+\beta x+A_b\sin(\omega_bx),
$$

$$
J(x)=\frac{A_J}{1+e^{-k(x-x_c)}},
$$

$$
d(x)=-\gamma(x-x_c)_+,
\qquad
(u)_+=\max(u,0),
$$

and

$$
r(x)=A_r\sin(\omega_rx)(a_r+b_rx).
$$

The complete signal is

$$
f(x)=b(x)+J(x)+d(x)+r(x).
$$


[View StampShadeRun signal](../../assets/images/TF043_StampShadeRun.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Smooth drift with embedded batch shift |
| Batch-change location | $x=x_c$ |
| Production structure | Weak amplitude-varying oscillation |
| Post-change behavior | Renewed drift with a different slope |
| Main challenge | Preserving an abrupt intervention within smooth drift |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $b_0$ | Baseline level | 0.20 |
| $\beta$ | Baseline drift slope | 0.34 |
| $A_b$ | Baseline oscillation amplitude | 0.035 |
| $\omega_b$ | Baseline angular frequency | $4.4\pi$ |
| $x_c$ | Batch-change location | 0.47 |
| $A_J$ | Batch-shift amplitude | 0.18 |
| $k$ | Batch-transition sharpness | 180 |
| $\gamma$ | Post-change slope correction | 0.22 |
| $A_r$ | Production-oscillation amplitude | 0.018 |
| $\omega_r$ | Production angular frequency | $34\pi$ |
| $a_r$ | Oscillation-envelope intercept | 0.35 |
| $b_r$ | Oscillation-envelope slope | 0.65 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF043_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF043_python.md)



## Recommended Uses

- Production-drift denoising
- Batch-change detection
- Weak periodic-error preservation
- Intervention-within-trend evaluation

## Provenance

**Status:** Stamp-production-inspired deterministic measurement surrogate.

---

[Category 4 Catalog](index.md) | [Next: PerforationDrift →](TF044_PerforationDrift.md)

