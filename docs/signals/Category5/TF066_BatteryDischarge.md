# BatteryDischarge

## Overview

The **BatteryDischarge** signal has a long voltage plateau, weak phase-transition shoulder, and steep terminal drop. It tests whether subtle curvature changes and a dominant terminal cliff can be preserved together.

## Mathematical Definition

Define the plateau component

```math
P(x)=b_0+b_1x+b_2x^2.
```

Define the phase-transition components

```math
D(x)=-A_D\left[1+e^{-k_D(x-x_D)}\right]^{-1},
```

```math
R(x)=A_R\left[1+e^{-k_R(x-x_R)}\right]^{-1}.
```

Define the weak shoulder

```math
S(x)=A_S\exp\left[
-\frac12\left(\frac{x-\mu_S}{s_S}\right)^2
\right].
```

Define the terminal-drop component

```math
T(x)=-A_T\left[1+e^{-k_T(x-x_T)}\right]^{-1}.
```

Define the weak oscillatory component

```math
M(x)=A_M\sin(\omega_Mx)e^{-\alpha_Mx}.
```

The signal is

```math
f(x)=P(x)+D(x)+R(x)+S(x)+T(x)+M(x).
```

[View BatteryDischarge signal](../../assets/images/TF066_BatteryDischarge.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Long plateau with shoulder and terminal cliff |
| Phase-transition region | Approximately $x=x_D$ to $x=x_R$ |
| Weak shoulder | Centered at $x=\mu_S$ |
| Terminal drop | Centered at $x=x_T$ |
| Main challenge | Preserving weak plateau curvature and rapid final decline |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $b_0$ | Plateau intercept | 1.05 |
| $b_1$ | Linear plateau coefficient | -0.075 |
| $b_2$ | Quadratic plateau coefficient | -0.020 |
| $A_D$ | Phase-transition drop magnitude | 0.060 |
| $k_D$ | Phase-transition drop sharpness | 55 |
| $x_D$ | Phase-transition drop center | 0.36 |
| $A_R$ | Phase-transition recovery magnitude | 0.036 |
| $k_R$ | Phase-transition recovery sharpness | 48 |
| $x_R$ | Phase-transition recovery center | 0.50 |
| $A_S$ | Shoulder amplitude | 0.018 |
| $\mu_S$ | Shoulder center | 0.62 |
| $s_S$ | Shoulder width | 0.050 |
| $A_T$ | Terminal-drop magnitude | 0.55 |
| $k_T$ | Terminal-drop sharpness | 48 |
| $x_T$ | Terminal-drop center | 0.885 |
| $A_M$ | Oscillation amplitude | 0.006 |
| $\omega_M$ | Oscillation angular frequency | $12\pi$ |
| $\alpha_M$ | Oscillation decay rate | 1.2 |

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

