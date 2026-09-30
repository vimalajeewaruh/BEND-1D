# AFMForceCurve

## Overview

The **AFMForceCurve** signal represents approach, adhesion, contact, nonlinear loading, and disengagement in atomic-force microscopy. It combines smooth nonlinear behavior with physically meaningful contact and snap-off transitions.

## Mathematical Definition

Define the approach and adhesion component

```math
f_1(x)=b_1+m_1x
-A_A\exp\left[
-\frac12\left(\frac{x-\mu_A}{s_A}\right)^2
\right],
\qquad x<x_C.
```

Define the nonlinear contact-loading component

```math
f_2(x)=b_2+m_2x
+A_C(x-x_C)^p
+A_O\sin(\omega_Ox),
\qquad x_C\leq x<x_S.
```

Define the post-snap component

```math
f_3(x)=b_3+m_3(x-x_S)
-A_Se^{-k_S(x-x_S)},
\qquad x\geq x_S.
```

The signal is defined by $f_1(x)$, $f_2(x)$, and $f_3(x)$ over their respective intervals.

[View AFMForceCurve signal](../../assets/images/TF065_AFMForceCurve.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Piecewise nonlinear loading with transitions |
| Adhesion feature | Centered at $x=\mu_A$ |
| Contact onset | $x=x_C$ |
| Snap-off location | $x=x_S$ |
| Main challenge | Preserving adhesion, contact, and rupture locations |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $b_1$ | Approach baseline | 0.018 |
| $m_1$ | Approach slope | 0.025 |
| $A_A$ | Adhesion magnitude | 0.070 |
| $\mu_A$ | Adhesion center | 0.305 |
| $s_A$ | Adhesion width | 0.014 |
| $x_C$ | Contact onset | 0.33 |
| $b_2$ | Contact baseline | 0.025 |
| $m_2$ | Contact linear slope | 0.025 |
| $A_C$ | Contact-loading scale | 3.35 |
| $p$ | Contact-loading exponent | 1.42 |
| $A_O$ | Contact oscillation amplitude | 0.020 |
| $\omega_O$ | Contact oscillation angular frequency | $18\pi$ |
| $x_S$ | Snap-off location | 0.78 |
| $b_3$ | Post-snap baseline | 0.030 |
| $m_3$ | Post-snap slope | 0.015 |
| $A_S$ | Post-snap exponential magnitude | 0.115 |
| $k_S$ | Post-snap decay rate | 24 |

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

