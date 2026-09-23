# QuantumRamseyDrift

## Overview

The **QuantumRamseyDrift** signal is a Ramsey-like oscillation with nonlinear phase drift, decreasing visibility, and a localized calibration phase change.

## Mathematical Definition

Let $S(x;c,w)=[1+e^{-(x-c)/w}]^{-1}$. Define

$$
\phi(x)=2\pi[10x+1.8x^2+0.10\sin(4\pi x)],\qquad
v(x)=0.92-0.28x,
$$

and $j(x)=0.55S(x;0.64,0.004)$. Then

$$
f(x)=v(x)\cos[\phi(x)+j(x)].
$$

[QuantumRamseyDrift signal](../../assets/images/TF101_QuantumRamseyDrift.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Nonstationary oscillation with phase change |
| Visibility | Decreases linearly across the record |
| Calibration change | Localized near $x=0.64$ |
| Main challenge | Preserving phase under smooth drift and abrupt recalibration |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $10,1.8$ | Linear and quadratic phase coefficients | As shown |
| $0.55$ | Calibration phase-change magnitude | 0.55 |
| $0.004$ | Calibration transition width | 0.004 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF101_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF101_python.md)



## Recommended Uses

- Phase-preserving denoising
- Oscillatory drift recovery
- Calibration-change localization

## Provenance

**Status:** Ramsey-measurement-inspired deterministic quantum-technology surrogate.

---

[Category 7 Catalog](index.md) | [Next: QuantumLeakageBurst →](TF102_QuantumLeakageBurst.md)
