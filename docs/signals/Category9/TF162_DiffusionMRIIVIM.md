# Diffusion MRI IVIM


## Overview

The **DiffusionMRIIVIM** signal is a smooth biexponential decay representing a simplified intravoxel-incoherent-motion (IVIM) signal. A small, rapidly decaying component creates extra curvature near the left boundary, while a dominant slower component determines the long tail.

## Mathematical Definition

Define the fast-decaying component

```math
F(x)=A_F e^{-\lambda_F x}.
```

Define the slow-decaying component

```math
S(x)=A_S e^{-\lambda_S x}.
```

The signal is

```math
f(x)=F(x)+S(x),
\qquad 0\leq x\leq1.
```

[View Diffusion MRI IVIM](../../assets/images/TF162_DiffusionMRIIVIM.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Multirate smooth decay |
| Signal type | Positive biexponential curve |
| Local feature | Weak fast-decaying component near $x=0$ |
| Tail | Dominant slow exponential component |
| Relative contribution | Fast component has smaller amplitude but larger decay rate |
| Main challenge | Preserving weak boundary curvature without fitting noise |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $A_F$ | Fast-component weight | 0.12 |
| $\lambda_F$ | Fast-component decay rate | 15 |
| $A_S$ | Slow-component weight | 0.88 |
| $\lambda_S$ | Slow-component decay rate | 2.15 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF162_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF162_python.md)



## Recommended Uses

- Multiexponential smoothing
- Boundary-bias assessment
- Recovery of weak fast-decay components

## Provenance

This deterministic curve is an application-oriented IVIM surrogate. Its parameters are illustrative and are not tied to a particular scanner, tissue, or acquisition protocol.

[← Previous: Capnogram Breaths](TF161_CapnogramBreaths.md) · [Category 9 catalog](index.md) · [Next: Auditory Brainstem Response →](TF163_AuditoryBrainstemResponse.md)
