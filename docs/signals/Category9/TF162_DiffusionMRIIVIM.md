# Diffusion MRI IVIM


## Overview

This smooth biexponential decay is a simplified intravoxel-incoherent-motion (IVIM) signal. A small, rapidly decaying component creates extra curvature near the left boundary, while a dominant slower component determines the long tail.

## Mathematical Definition

For $0\le x\le1$,

$$
f(x)=0.12e^{-15x}+0.88e^{-2.15x}.
$$

[Diffusion MRI IVIM](../../assets/images/TF162_DiffusionMRIIVIM.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Multirate smooth decay |
| Signal type | Positive biexponential curve |
| Local feature | Fast component near $x=0$ |
| Tail | Dominant slow exponential |
| Main challenge | Preserve weak boundary curvature without fitting noise |

## Parameters

| Component | Weight | Decay rate |
|---|---:|---:|
| Fast | $0.12$ | $15$ |
| Slow | $0.88$ | $2.15$ |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF0162_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF0162_python.md)



## Recommended Uses

- Multiexponential smoothing
- Boundary-bias assessment
- Recovery of weak fast-decay components

## Provenance

This deterministic curve is an application-oriented IVIM surrogate. Its parameters are illustrative and are not tied to a particular scanner, tissue, or acquisition protocol.

[← Previous: Capnogram Breaths](TF161_CapnogramBreaths.md) · [Category 9 catalog](index.md) · [Next: Auditory Brainstem Response →](TF163_AuditoryBrainstemResponse.md)
