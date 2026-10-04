# PupilLightReflex


## Overview

The **PupilLightReflex** signal represents a pupil surrogate that constricts rapidly after a stimulus and redilates much more slowly, with a small late overshoot.

## Mathematical Definition

Define the Gaussian profile

```math
G(x;c,w)=
\exp\left[
-\frac{1}{2}
\left(
\frac{x-c}{w}
\right)^2
\right].
```

For $x\geq c_S$, let

```math
u=x-c_S,
```

and define the causal pupil response by

```math
r(x)=
\left(
1-e^{-u/\tau_R}
\right)
e^{-u/\tau_D},
```

with $r(x)=0$ for $x<c_S$.

Define the late overshoot by

```math
O(x)=
A_O G(x;c_O,w_O).
```

The signal is

```math
f(x)=
b_0-A_Rr(x)+O(x).
```

[View Pupil Light Reflex](../../assets/images/TF203_PupilLightReflex.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Biomedical optics |
| Structure | Asymmetric causal response plus Gaussian overshoot |
| Constriction behavior | Rapid response beginning at stimulus time $c_S$ |
| Recovery behavior | Much slower redilation governed by $\tau_D$ |
| Overshoot behavior | Small late positive Gaussian feature centered at $c_O$ |
| Regularity | Smooth with a sharp change in time scale at onset |
| Main challenge | Preserving rapid constriction and slow recovery simultaneously |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $b_0$ | Baseline pupil level | 1 |
| $c_S$ | Stimulus time | 0.25 |
| $A_R$ | Reflex-response amplitude | 0.72 |
| $\tau_R$ | Rapid rise time scale | 0.014 |
| $\tau_D$ | Slow decay time scale | 0.22 |
| $A_O$ | Late-overshoot amplitude | 0.10 |
| $c_O$ | Overshoot center | 0.68 |
| $w_O$ | Overshoot width | 0.07 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF203_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF203_python.md)



## Recommended Uses

- Asymmetric transient smoothing
- Onset localization
- Weak overshoot preservation

## Provenance

This is a deterministic benchmark surrogate inspired by biomedical optics measurement morphology. It is not a calibrated physical or clinical simulator.

[← Previous: SleepSpindleKComplex](TF202_SleepSpindleKComplex.md) · [Category 10 catalog](index.md) · [Next: CoughFlowBurst →](TF204_CoughFlowBurst.md)

