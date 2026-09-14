# AFMForceCurve

## Overview

The **AFMForceCurve** signal represents approach, adhesion, contact, nonlinear loading, and disengagement in atomic-force microscopy. It combines smooth nonlinear behavior with physically meaningful contact and snap-off transitions.

## Mathematical Definition

The signal is defined piecewise as

$$
f(x)=
\begin{cases}
0.018+0.025x
-0.070\exp\!\left[-\dfrac12\left(\dfrac{x-0.305}{0.014}\right)^2\right],
& x<0.33,\\[8pt]
0.025+0.025x+3.35(x-0.33)^{1.42}+0.020\sin(18\pi x),
& 0.33\leq x<0.78,\\[8pt]
0.030+0.015(x-0.78)-0.115e^{-24(x-0.78)},
& x\geq0.78.
\end{cases}
$$

[AFMForceCurve signal](../../assets/images/TF065_AFMForceCurve.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Piecewise nonlinear loading with transitions |
| Adhesion feature | Centered at $x=0.305$ |
| Contact onset | $x=0.33$ |
| Snap-off location | $x=0.78$ |
| Main challenge | Preserving adhesion, contact, and rupture locations |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $1.42$ | Contact-loading exponent | 1.42 |
| $3.35$ | Contact-loading scale | 3.35 |
| $24$ | Post-snap decay rate | 24 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF065_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF065_python.md)



## Recommended Uses

- AFM force-curve denoising
- Contact-point detection
- Snap-off preservation
- Nonlinear loading recovery

## Provenance

**Status:** Atomic-force-microscopy-inspired deterministic measurement surrogate.

---

[← Previous: XRDPeaks](TF064_XRDPeaks.md) | [Category 5 Catalog](index.md) | [Next: BatteryDischarge →](TF066_BatteryDischarge.md)

