# EVFastCharge


## Overview

The **EVFastCharge** signal contains a long nonlinear rise, an intermediate charging-regime change, thermal derating, small control ripple, and final saturation.

## Mathematical Definition

Let $S(x;c,w)=[1+e^{-(x-c)/w}]^{-1}$. Then

$$
\begin{aligned}
f(x)={}&0.18+0.55S(x;0.20,0.10)+0.22S(x;0.58,0.035)\\
&-0.12S(x;0.72,0.010)+0.015\sin(36\pi x)S(x;0.25,0.03)\\
&+0.07S(x;0.88,0.025).
\end{aligned}
$$

[EVFastCharge signal](../../assets/images/TF135_EVFastCharge.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Smooth rise with multiple regime changes and ripple |
| Derating | Negative transition near $x=0.72$ |
| Saturation | Final increase near $x=0.88$ |
| Main challenge | Retaining subtle transitions within a dominant smooth trend |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $0.20,0.58$ | Rise and regime-change centers | As shown |
| $-0.12$ | Derating magnitude | -0.12 |
| $0.015$ | Control-ripple amplitude | 0.015 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF0135_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF0135_python.md)



## Recommended Uses

- EV charging-curve smoothing
- Regime-transition preservation
- Low-amplitude ripple recovery

## Provenance

**Status:** Electric-vehicle-fast-charging-inspired deterministic surrogate.

---

[← Previous: WindTurbineGustControl](TF134_WindTurbineGustControl.md) | [Category 8 Catalog](index.md) | [Next: GridInverterOscillation →](TF136_GridInverterOscillation.md)
