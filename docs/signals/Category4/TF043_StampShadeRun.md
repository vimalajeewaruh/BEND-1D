# StampShadeRun

## Overview

The **StampShadeRun** signal represents a color coordinate, optical density, or similar shade measurement observed through a stamp-printing run. A meaningful batch change is embedded in otherwise smooth press and ink drift, with weak repeatable production oscillations.

## Mathematical Definition

Define

$$
b(x)=0.20+0.34x+0.035\sin(4.4\pi x),
$$

$$
J(x)=\frac{0.18}{1+e^{-180(x-0.47)}},
$$

$$
d(x)=-0.22(x-0.47)_+,
\qquad (u)_+=\max(u,0),
$$

and

$$
r(x)=0.018\sin(34\pi x)(0.35+0.65x).
$$

The complete signal is

$$
f(x)=b(x)+J(x)+d(x)+r(x).
$$

[StampShadeRun signal](../../assets/images/TF043_StampShadeRun.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Smooth drift with embedded batch shift |
| Batch-change location | $x=0.47$ |
| Production structure | Weak amplitude-varying oscillation |
| Post-change behavior | Renewed drift with a different slope |
| Main challenge | Preserving an abrupt intervention within smooth drift |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $0.47$ | Batch-change location | 0.47 |
| $180$ | Batch-transition sharpness | 180 |
| $17$ | Production-oscillation frequency | 17 |

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

