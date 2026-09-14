# BatteryDischarge

## Overview

The **BatteryDischarge** signal has a long voltage plateau, weak phase-transition shoulder, and steep terminal drop. It tests whether subtle curvature changes and a dominant terminal cliff can be preserved together.

## Mathematical Definition

Define

$$
P(x)=1.05-0.075x-0.020x^2,
$$

$$
D(x)=-\frac{0.060}{1+e^{-55(x-0.36)}},
\qquad
R(x)=\frac{0.036}{1+e^{-48(x-0.50)}},
$$

$$
S(x)=0.018\exp\!\left[-\frac12\left(\frac{x-0.62}{0.050}\right)^2\right],
$$

$$
T(x)=-\frac{0.55}{1+e^{-48(x-0.885)}},
$$

and

$$
M(x)=0.006\sin(12\pi x)e^{-1.2x}.
$$

The signal is

$$
f(x)=P(x)+D(x)+R(x)+S(x)+T(x)+M(x).
$$

[BatteryDischarge signal](../../assets/images/TF066_BatteryDischarge.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Long plateau with shoulder and terminal cliff |
| Phase-transition region | Approximately $x=0.36$–$0.50$ |
| Weak shoulder | Centered at $x=0.62$ |
| Terminal drop | Centered at $x=0.885$ |
| Main challenge | Preserving weak plateau curvature and rapid final decline |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $0.050$ | Shoulder width | 0.050 |
| $48$ | Terminal-drop sharpness | 48 |
| $0.55$ | Terminal-drop magnitude | 0.55 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF066_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF066_python.md)



## Recommended Uses

- Battery-curve denoising
- Phase-transition shoulder preservation
- Terminal-cliff detection
- Plateau-curvature recovery

## Provenance

**Status:** Battery-discharge-inspired deterministic electrochemical surrogate.

---

[← Previous: AFMForceCurve](TF065_AFMForceCurve.md) | [Category 5 Catalog](index.md) | [Next: FluorescenceBleach →](TF067_FluorescenceBleach.md)

