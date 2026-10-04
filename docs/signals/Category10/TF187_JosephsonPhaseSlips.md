# JosephsonPhaseSlips


## Overview

The **JosephsonPhaseSlips** signal contains a persistent carrier interrupted by three abrupt phase slips of different sign and magnitude. The events change the oscillatory phase rather than its amplitude.

## Mathematical Definition

Let the phase-slip locations be

```math
\mathbf{c}
=
(0.28,\,0.53,\,0.78),
```

with corresponding phase-slip magnitudes

```math
\boldsymbol{\Delta}
=
(0.75\pi,\,-1.05\pi,\,0.60\pi).
```

Before the first phase slip, define

```math
\phi(x)=2\pi f_0x,
\qquad x<c_1.
```

After the first phase slip,

```math
\phi(x)=2\pi f_0x+\Delta_1,
\qquad c_1\leq x<c_2.
```

After the second phase slip,

```math
\phi(x)=2\pi f_0x+\Delta_1+\Delta_2,
\qquad c_2\leq x<c_3.
```

After the third phase slip,

```math
\phi(x)=2\pi f_0x+\Delta_1+\Delta_2+\Delta_3,
\qquad x\geq c_3.
```

The signal combines the fundamental carrier and its second harmonic:

```math
f(x)=
A_1\sin\left[\phi(x)\right]
+
A_2\sin\left[2\phi(x)+\delta_2\right].
```

[View Josephson Phase Slips](../../assets/images/TF187_JosephsonPhaseSlips.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Superconducting devices |
| Primary family | Oscillation with abrupt phase slips |
| Structure | Fundamental and second harmonic sharing the same discontinuous phase |
| Phase events | Three slips with different signs and magnitudes |
| Amplitude behavior | Persistent carrier amplitude across all phase-slip events |
| Regularity | Piecewise smooth with phase discontinuities |
| Main challenge | Retaining phase slips without damping the carrier |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $f_0$ | Carrier frequency | 12 |
| $\mathbf{c}$ | Phase-slip locations | $(0.28,\,0.53,\,0.78)$ |
| $\boldsymbol{\Delta}$ | Phase-slip magnitudes | $(0.75\pi,\,-1.05\pi,\,0.60\pi)$ |
| $A_1$ | Fundamental amplitude | 0.75 |
| $A_2$ | Second-harmonic amplitude | 0.12 |
| $\delta_2$ | Second-harmonic phase offset | 0.4 |
## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF187_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF187_python.md)



## Recommended Uses

- Phase-discontinuity recovery
- Carrier-preserving denoising
- Abrupt phase-event localization

## Provenance

This is a deterministic benchmark surrogate inspired by superconducting devices measurement morphology. It is not a calibrated physical or clinical simulator.

[← Previous: QubitRamseyWander](TF186_QubitRamseyWander.md) · [Category 10 catalog](index.md) · [Next: TokamakELMTrain →](TF188_TokamakELMTrain.md)

