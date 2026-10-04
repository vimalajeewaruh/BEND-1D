# GridInverterOscillation


## Overview

The **GridInverterOscillation** signal combines a load disturbance, decaying oscillation with changing instantaneous frequency, and later controller intervention.

## Mathematical Definition

Define the smooth step

```math
S(x;c,w)=
\left[1+e^{-(x-c)/w}\right]^{-1}.
```

Define the background trend

```math
B(x)=b_0+mx.
```

Define the load disturbance

```math
L(x)=
A_LS(x;c_L,w_L).
```

Let

```math
u=(x-c_L)_+.
```

For $x\geq c_L$, define the decaying chirped oscillation

```math
R(x)=
A_Re^{-\alpha_Ru}
\sin\left[
2\pi(f_Ru+\beta_Ru^2)
\right],
```

with $R(x)=0$ for $x<c_L$.

Define the controller intervention

```math
C(x)=
-A_CS(x;c_C,w_C).
```

The signal is

```math
f(x)=B(x)+L(x)+R(x)+C(x).
```

[View GridInverterOscillation signal](../../assets/images/TF136_GridInverterOscillation.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Load step, decaying chirp, and controller intervention |
| Background | Gradual linear trend with slope $m$ |
| Disturbance | Positive load transition centered at $c_L$ |
| Transient response | Decaying chirped oscillation beginning at $c_L$ |
| Frequency evolution | Changing instantaneous frequency governed by $\beta_R$ |
| Intervention | Negative transition centered at $c_C$ |
| Main challenge | Preserving transient phase and the later control change |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $b_0$ | Baseline operating level | 0.30 |
| $m$ | Background trend slope | 0.02 |
| $A_L$ | Load-disturbance magnitude | 0.16 |
| $c_L$ | Load-disturbance location | 0.30 |
| $w_L$ | Load-disturbance transition width | 0.006 |
| $A_R$ | Transient-oscillation amplitude | 0.34 |
| $\alpha_R$ | Oscillation decay rate | 5 |
| $f_R$ | Initial transient frequency | 10 |
| $\beta_R$ | Quadratic phase coefficient | 4 |
| $A_C$ | Controller-shift magnitude | 0.10 |
| $c_C$ | Controller-intervention location | 0.64 |
| $w_C$ | Controller-intervention width | 0.010 |
## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF136_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF136_python.md)


## Recommended Uses

- Grid-inverter telemetry denoising
- Phase-preserving transient recovery
- Controller-intervention localization

## Provenance

**Status:** Grid-inverter-disturbance-inspired deterministic surrogate.

---

[← Previous: EVFastCharge](TF135_EVFastCharge.md) | [Category 8 Catalog](index.md) | [Next: SatelliteReactionWheel →](TF137_SatelliteReactionWheel.md)
