# FrequencyCrossing


## Overview

The **FrequencyCrossing** stress test combines an increasing-frequency chirp and a decreasing-frequency chirp whose instantaneous frequencies cross.

## Mathematical Definition

Define the increasing-frequency chirp phase

```math
\phi_u(x)=
2\pi(f_u x+\beta_u x^2).
```

Define the decreasing-frequency chirp phase

```math
\phi_d(x)=
2\pi(f_d x+\beta_d x^2).
```

Define the amplitude envelope

```math
A(x)=
A_0+
A_E
\exp\left[
-\frac12\left(\frac{x-c_E}{w_E}\right)^2
\right].
```

Define the two chirp components

```math
C_u(x)=
A_u\sin\phi_u(x),
```

```math
C_d(x)=
A_d\sin\left[\phi_d(x)+\delta_d\right].
```

The signal is

```math
f(x)=
A(x)\left[C_u(x)+C_d(x)\right].
```

[View FrequencyCrossing signal](../../assets/images/TF147_FrequencyCrossing.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Two chirps with crossing instantaneous frequencies |
| Increasing chirp | Frequency increases according to $\beta_u$ |
| Decreasing chirp | Frequency decreases according to $\beta_d$ |
| Amplitude envelope | Smooth enhancement centered at $c_E$ |
| Interference | Local reinforcement and cancellation between the two chirps |
| Main challenge | Avoiding false interpretation of interference as signal disappearance |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $f_u$ | Initial frequency of increasing chirp | 8 |
| $\beta_u$ | Quadratic phase coefficient of increasing chirp | 20 |
| $f_d$ | Initial frequency of decreasing chirp | 28 |
| $\beta_d$ | Quadratic phase coefficient of decreasing chirp | -20 |
| $A_0$ | Baseline envelope level | 0.75 |
| $A_E$ | Envelope enhancement amplitude | 0.25 |
| $c_E$ | Envelope center | 0.50 |
| $w_E$ | Envelope width | 0.30 |
| $A_u$ | Increasing-chirp amplitude | 0.25 |
| $A_d$ | Decreasing-chirp amplitude | 0.25 |
| $\delta_d$ | Relative phase offset | 0.35 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF147_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF147_python.md)


## Recommended Uses

- Crossing-frequency recovery
- Phase-sensitive denoising
- Interference preservation

## Provenance

**Status:** Deliberately artificial MishMash stress test.

---

[← Previous: MultiscaleComb](TF146_MultiscaleComb.md) | [Category 8 Catalog](index.md) | [Next: PhaseResetBurst →](TF148_PhaseResetBurst.md)
