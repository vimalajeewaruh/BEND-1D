# OJIPFluorescence


## Overview

The **OJIPFluorescence** signal contains three nested saturation kinetics with well-separated characteristic time scales, producing an O–J–I–P-like polyphasic rise with small local curvature corrections.

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

For $k=1,\ldots,K$, define the stretched-exponential rise component by

```math
R_k(x)=
A_k
\left[
1-
\exp\left(
-\left(\frac{x}{\tau_k}\right)^{p_k}
\right)
\right].
```

Let

```math
\mathbf{A}
=
(0.28,\,0.25,\,0.38),
```

```math
\boldsymbol{\tau}
=
(0.012,\,0.075,\,0.32),
```

and

```math
\mathbf{p}
=
(1.25,\,1.15,\,1.55).
```

Define the local curvature corrections by

```math
C(x)=
A_{C1}G(x;c_{C1},w_{C1})
-
A_{C2}G(x;c_{C2},w_{C2}).
```

The signal is

```math
f(x)=
b_0+
\sum_{k=1}^{K}R_k(x)
+
C(x).
```

[View OJIP Fluorescence](../../assets/images/TF206_OJIPFluorescence.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Plant physiology |
| Structure | Sum of stretched-exponential rises plus two weak Gaussian corrections |
| Rise behavior | Three nested saturation processes with distinct characteristic time scales |
| Local behavior | Small positive and negative corrections modify intermediate curvature |
| Regularity | Smooth with several distinct knees |
| Main challenge | Preserving weak intermediate phases without piecewise flattening |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $b_0$ | Initial fluorescence level | 0.08 |
| $K$ | Number of saturation components | 3 |
| $\mathbf{A}$ | Rise amplitudes | $(0.28,\,0.25,\,0.38)$ |
| $\boldsymbol{\tau}$ | Characteristic time scales | $(0.012,\,0.075,\,0.32)$ |
| $\mathbf{p}$ | Stretching powers | $(1.25,\,1.15,\,1.55)$ |
| $A_{C1}$ | Positive correction amplitude | 0.035 |
| $c_{C1}$ | Positive correction center | 0.085 |
| $w_{C1}$ | Positive correction width | 0.018 |
| $A_{C2}$ | Negative correction amplitude | 0.025 |
| $c_{C2}$ | Negative correction center | 0.20 |
| $w_{C2}$ | Negative correction width | 0.032 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF206_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF206_python.md)


## Recommended Uses

- Polyphasic-rise denoising
- Knee preservation
- Multirate kinetic smoothing

## Provenance

This is a deterministic benchmark surrogate inspired by plant physiology measurement morphology. It is not a calibrated physical or clinical simulator.

[← Previous: DesaturationRecovery](TF205_DesaturationRecovery.md) · [Category 10 catalog](index.md) · [Next: StomatalClosure →](TF207_StomatalClosure.md)

