# QuantumRamseyDrift

## Overview

The **QuantumRamseyDrift** signal is a Ramsey-like oscillation with nonlinear phase drift, decreasing visibility, and a localized calibration phase change.

## Mathematical Definition

Define the smooth step

```math
S(x;c,w)=\left[1+e^{-(x-c)/w}\right]^{-1}.
```

Define the nonlinear phase

```math
\phi(x)=
2\pi
\left[
f_0x+\beta x^2+
A_m\sin(2\pi f_mx)
\right].
```

Define the decreasing visibility

```math
v(x)=v_0-m_vx.
```

Define the calibration phase change

```math
j(x)=A_jS(x;c_j,w_j).
```

The signal is

```math
f(x)=v(x)\cos\left[\phi(x)+j(x)\right].
```

[View QuantumRamseyDrift signal](../../assets/images/TF101_QuantumRamseyDrift.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Nonstationary oscillation with phase change |
| Phase drift | Nonlinear phase governed by $f_0$, $\beta$, $A_m$, and $f_m$ |
| Visibility | Decreases linearly from $v_0$ at rate $m_v$ |
| Calibration change | Localized near $c_j$ with transition width $w_j$ |
| Main challenge | Preserving phase under smooth drift and abrupt recalibration |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $f_0$ | Base phase frequency | 10 |
| $\beta$ | Quadratic phase coefficient | 1.8 |
| $A_m$ | Phase-modulation magnitude | 0.10 |
| $f_m$ | Phase-modulation frequency | 2 |
| $v_0$ | Initial visibility | 0.92 |
| $m_v$ | Visibility decay rate | 0.28 |
| $A_j$ | Calibration phase-change magnitude | 0.55 |
| $c_j$ | Calibration-change location | 0.64 |
| $w_j$ | Calibration transition width | 0.004 |

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
