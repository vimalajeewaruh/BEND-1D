# ModeBeatingDecay


## Overview

The **ModeBeatingDecay** signal contains two closely spaced damped modes that produce a slowly varying beat envelope, together with a weaker higher-frequency mode that decays more rapidly.

## Mathematical Definition

Define the two closely spaced primary modes by

```math
M_1(x)=
A_1 e^{-\alpha_1 x}
\sin(2\pi f_1x),
```

and

```math
M_2(x)=
A_2 e^{-\alpha_1 x}
\sin(2\pi f_2x+\delta_2).
```

Define the weaker higher-frequency mode by

```math
M_3(x)=
A_3 e^{-\alpha_3 x}
\sin(2\pi f_3x+\delta_3).
```

The signal is

```math
f(x)=
M_1(x)+M_2(x)+M_3(x).
```

[View Mode Beating Decay](../../assets/images/TF197_ModeBeatingDecay.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Structural dynamics |
| Structure | Three damped sinusoids with two closely spaced primary frequencies |
| Beat behavior | Interference between $f_1$ and $f_2$ produces a slowly varying amplitude envelope |
| Decay behavior | Primary modes share decay rate $\alpha_1$, while the higher-frequency mode decays more rapidly |
| Regularity | Smooth oscillation with evolving spectral composition |
| Main challenge | Retaining the extended beat pattern and weak third mode |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $A_1$ | First-mode amplitude | 1 |
| $f_1$ | First-mode frequency | 15 |
| $A_2$ | Second-mode amplitude | 0.93 |
| $f_2$ | Second-mode frequency | 16.4 |
| $\delta_2$ | Second-mode phase offset | 0.15 |
| $\alpha_1$ | Primary-mode decay rate | 2.4 |
| $A_3$ | Third-mode amplitude | 0.28 |
| $f_3$ | Third-mode frequency | 33 |
| $\delta_3$ | Third-mode phase offset | 0.6 |
| $\alpha_3$ | Third-mode decay rate | 5.8 |


## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF197_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF197_python.md)




## Recommended Uses

- Beat-envelope preservation
- Modal decay estimation
- Close-frequency denoising

## Provenance

This is a deterministic benchmark surrogate inspired by structural dynamics measurement morphology. It is not a calibrated physical simulator.

[← Previous: CavitationCollapse](TF196_CavitationCollapse.md) · [Category 10 catalog](index.md) · [Next: ValveChatter →](TF198_ValveChatter.md)

