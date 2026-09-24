# DesaturationRecovery


## Overview

Two oxygen-desaturation-like episodes fall rapidly and recover much more slowly. The second begins from a different local baseline because the events overlap.

## Mathematical Definition

For $u_k=(x-c_k)_+$,
$$
f(x)=1-\sum_{k=1}^{2}I(x\ge c_k)a_k
(1-e^{-u_k/t_{f,k}})e^{-u_k/t_{s,k}},
$$
with the parameter vectors given below.

[DesaturationRecovery signal](../../assets/images/TF205_DesaturationRecovery.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Pulse oximetry |
| Structure | Unit baseline minus two asymmetric causal depressions |
| Regularity | Continuous with fast fall and slow nonlinear return |
| Main challenge | Recover minima and long recovery tails without bias |

## Parameters

| Parameter | Value |
|---|---|
| Event centers | $0.34,0.67$ |
| Depths | $0.54,0.34$ |
| Fast scales | $0.012,0.018$ |
| Slow scales | $0.19,0.14$ |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF205_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF205_python.md)



## Recommended Uses

- Desaturation-minimum preservation
- Overlapping recovery estimation
- Asymmetric dip denoising

## Provenance

This is a deterministic benchmark surrogate inspired by pulse oximetry measurement morphology. It is not a calibrated physical or clinical simulator.

[← Previous: CoughFlowBurst](TF204_CoughFlowBurst.md) · [Category 10 catalog](index.md) · [Next: OJIPFluorescence →](TF206_OJIPFluorescence.md)

