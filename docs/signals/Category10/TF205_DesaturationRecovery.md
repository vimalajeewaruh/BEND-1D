# DesaturationRecovery


## Overview

The **DesaturationRecovery** signal contains two oxygen-desaturation-like episodes that fall rapidly and recover much more slowly. The second event begins from a different local baseline because the two responses overlap.

## Mathematical Definition

Let the event centers, depths, fast time scales, and slow time scales be

```math
\mathbf{c}
=
(0.34,\,0.67),
```

```math
\mathbf{a}
=
(0.54,\,0.34),
```

```math
\mathbf{t}_f
=
(0.012,\,0.018),
```

and

```math
\mathbf{t}_s
=
(0.19,\,0.14).
```

For each $k=1,\ldots,K$, let

```math
u_k=x-c_k.
```

For $x\geq c_k$, define the asymmetric desaturation response by

```math
D_k(x)=
a_k
\left(
1-e^{-u_k/t_{f,k}}
\right)
e^{-u_k/t_{s,k}},
```

with $D_k(x)=0$ for $x<c_k$.

The signal is

```math
f(x)=
b_0-
\sum_{k=1}^{K}D_k(x).
```

[View Desaturation Recovery](../../assets/images/TF205_DesaturationRecovery.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Pulse oximetry |
| Structure | Unit baseline minus two asymmetric causal depressions |
| Event behavior | Rapid desaturation followed by substantially slower recovery |
| Overlap behavior | The second event begins before complete recovery from the first |
| Regularity | Continuous with fast fall and slow nonlinear return |
| Main challenge | Recovering minima and long recovery tails without bias |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $b_0$ | Baseline level | 1 |
| $K$ | Number of desaturation events | 2 |
| $\mathbf{c}$ | Event centers | $(0.34,\,0.67)$ |
| $\mathbf{a}$ | Desaturation depths | $(0.54,\,0.34)$ |
| $\mathbf{t}_f$ | Fast time scales | $(0.012,\,0.018)$ |
| $\mathbf{t}_s$ | Slow recovery time scales | $(0.19,\,0.14)$ |
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

