# QuantumLeakageBurst


## Overview

The **QuantumLeakageBurst** signal combines a nearly stable low-amplitude readout, three leakage-like excursions, and a finite-duration level shift.

## Mathematical Definition

Define the smooth step

```math
S(x;c,w)=\left[1+e^{-(x-c)/w}\right]^{-1}.
```

Define the Gaussian function

```math
g(x;c,w)=
\exp\left[
-\frac12\left(\frac{x-c}{w}\right)^2
\right].
```

Define the low-amplitude background

```math
B(x)=b_0+A_B\sin(2\pi f_Bx).
```

Let the leakage-event centers be

```math
\mathcal{C}=(0.24,\,0.47,\,0.71).
```

Define the leakage component

```math
L(x)=
A_L
\sum_{c\in\mathcal{C}}
g(x;c,w_L).
```

Define the finite-duration level shift

```math
Q(x)=
A_Q
\left[
S(x;c_1,w_1)-S(x;c_2,w_2)
\right].
```

The signal is

```math
f(x)=B(x)+L(x)+Q(x).
```


[View QuantumLeakageBurst signal](../../assets/images/TF102_QuantumLeakageBurst.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Sparse excursions plus finite level shift |
| Background | Low-amplitude oscillation around baseline $b_0$ |
| Leakage events | Centered at the locations in $\mathcal{C}$ |
| Shift interval | Approximately from $c_1$ to $c_2$ |
| Main challenge | Preserving small transients in a low-amplitude background |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $b_0$ | Baseline level | 0.08 |
| $A_B$ | Background oscillation amplitude | 0.02 |
| $f_B$ | Background oscillation frequency | 4 |
| $\mathcal{C}$ | Leakage-event centers | $(0.24,\,0.47,\,0.71)$ |
| $A_L$ | Leakage-burst amplitude | 0.20 |
| $w_L$ | Leakage-burst width | 0.020 |
| $A_Q$ | Level-shift amplitude | 0.10 |
| $c_1$ | Level-shift onset location | 0.54 |
| $w_1$ | Level-shift onset width | 0.004 |
| $c_2$ | Level-shift offset location | 0.64 |
| $w_2$ | Level-shift offset width | 0.006 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF102_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF102_python.md)



## Recommended Uses

- Quantum-readout denoising
- Small-excursion recovery
- Short state-change preservation

## Provenance

**Status:** Quantum-leakage-monitoring-inspired deterministic surrogate.

---

[← Previous: QuantumRamseyDrift](TF101_QuantumRamseyDrift.md) | [Category 7 Catalog](index.md) | [Next: FusionELMSawtooth →](TF103_FusionELMSawtooth.md)
