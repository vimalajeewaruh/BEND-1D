# BridgeStrainEvent

## Overview

The **BridgeStrainEvent** signal combines slow thermal drift, four repeated vehicle-load-like responses, a small slip transition, and damped structural vibration.

## Mathematical Definition

Let $S(x;c,w)=[1+e^{-(x-c)/w}]^{-1}$, $g(x;c,w)=e^{-((x-c)/w)^2/2}$, and $u=(x-0.62)_+$. Then

$$
\begin{aligned}
f(x)={}&0.18+0.16x+0.05\sin(3\pi x)
+0.16\sum_{c\in\{0.18,0.34,0.52,0.76\}}g(x;c,0.025)\\
&+0.10S(x;0.62,0.004)+0.10I(x\ge0.62)e^{-12u}\sin(2\pi\,28u).
\end{aligned}
$$

[BridgeStrainEvent signal](../../assets/images/TF140_BridgeStrainEvent.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Drift, repeated loads, slip, and damped vibration |
| Load responses | Four broad positive events |
| Structural event | Slip and ringing beginning near $x=0.62$ |
| Main challenge | Distinguishing local structural change from ordinary drift |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $0.16$ | Vehicle-load amplitude | 0.16 |
| $0.10$ | Slip magnitude | 0.10 |
| $12,28$ | Ringing decay and cycle frequency | As shown |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF0140_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF0140_python.md)


## Recommended Uses

- Structural-health-monitoring denoising
- Slip-event localization
- Drift and vibration separation

## Provenance

**Status:** Bridge-strain-monitoring-inspired deterministic surrogate.

---

[← Previous: TerahertzLayerEcho](TF139_TerahertzLayerEcho.md) | [Category 8 Catalog](index.md) | [Next: MishMashAlpha →](TF141_MishMashAlpha.md)
