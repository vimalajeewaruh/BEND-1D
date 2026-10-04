# TokamakELMTrain


## Overview

The **TokamakELMTrain** signal contains a sequence of slow ramp-and-crash cycles with unequal narrow precursor or edge-localized events. It combines gradual buildup, repeated resets, and localized peaks within a single benchmark.

## Mathematical Definition

Define the phase-like ramp variable

```math
q(x)=
f_0x+
A_q\sin(2\pi f_qx).
```

Define its fractional part by

```math
r(x)=
q(x)-\lfloor q(x)\rfloor.
```

Define the Gaussian event profile

```math
G(x;c,w)=
\exp\left[
-\frac12
\left(
\frac{x-c}{w}
\right)^2
\right].
```

The modulated ramp component is

```math
R(x)=
A_R r(x)
\left[
1+A_M\sin(2\pi f_Mx)
\right].
```

Let the event centers be

```math
\mathbf{c}
=
(0.156,\,0.312,\,0.468,\,0.625,\,0.782,\,0.937),
```

with corresponding unequal amplitudes

```math
\mathbf{a}
=
(a_1,\ldots,a_K).
```

The localized event component is

```math
E(x)=
\sum_{k=1}^{K}
a_kG(x;c_k,w_E).
```

The signal is

```math
f(x)=
b_0+R(x)+E(x).
```

[View Tokamak ELM Train](../../assets/images/TF188_TokamakELMTrain.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Fusion plasma |
| Primary family | Repeated ramp-and-crash process with localized events |
| Structure | Modulated fractional-part ramp with $K$ Gaussian events |
| Ramp behavior | Gradual buildup followed by repeated abrupt resets |
| Local events | Unequal narrow peaks located near ramp transitions |
| Regularity | Piecewise smooth ramps with repeated discontinuities |
| Main challenge | Treating ramps, discontinuities, and narrow peaks simultaneously |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $b_0$ | Baseline level | 0.12 |
| $f_0$ | Nominal number of ramp cycles | 6.4 |
| $A_q$ | Ramp-timing modulation amplitude | 0.07 |
| $f_q$ | Ramp-timing modulation frequency | 1 |
| $A_R$ | Ramp amplitude | 0.78 |
| $A_M$ | Ramp amplitude-modulation depth | 0.10 |
| $f_M$ | Ramp amplitude-modulation frequency | 1.1 |
| $K$ | Number of localized events | 6 |
| $\mathbf{c}$ | Event centers | $(0.156,\,0.312,\,0.468,\,0.625,\,0.782,\,0.937)$ |
| $\mathbf{a}$ | Unequal event amplitudes | Specified in implementation |
| $w_E$ | Common event width | 0.006 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF188_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF188_python.md)



## Recommended Uses

- Ramp-and-crash denoising
- Narrow-event preservation
- Mixed regularity evaluation

## Provenance

This is a deterministic benchmark surrogate inspired by fusion plasma measurement morphology. It is not a calibrated physical or clinical simulator.

[← Previous: JosephsonPhaseSlips](TF187_JosephsonPhaseSlips.md) · [Category 10 catalog](index.md) · [Next: SolitonCollision →](TF189_SolitonCollision.md)

