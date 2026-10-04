# RegularityQuilt


## Overview

The **RegularityQuilt** signal consists of five adjacent compact bumps that meet continuously at zero but have different powers and signs, placing several local smoothness classes within a single record.

## Mathematical Definition

For $k=1,\ldots,K$, consider the interval $[a_k,b_k]$ and define the local coordinate

```math
s_k(x)=
\frac{x-a_k}{b_k-a_k}.
```

For $a_k\leq x\leq b_k$, define

```math
f(x)=
A_k
\left[
4s_k(x)\left(1-s_k(x)\right)
\right]^{p_k}.
```

The interval endpoints are

```math
\mathbf{a}
=
(0,\,0.2,\,0.4,\,0.6,\,0.8),
```

and

```math
\mathbf{b}
=
(0.2,\,0.4,\,0.6,\,0.8,\,1).
```

The corresponding powers are

```math
\mathbf{p}
=
(4,\,3,\,2,\,1.5,\,0.5),
```

and the amplitudes are

```math
\mathbf{A}
=
(1,\,-0.85,\,0.90,\,-0.80,\,0.65).
```

[View Regularity Quilt](../../assets/images/TF230_RegularityQuilt.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Regularity stress test |
| Structure | Five adjacent compact beta-shaped bumps |
| Sign behavior | Alternating positive and negative bump amplitudes |
| Smoothness behavior | Local boundary regularity changes according to $p_k$ |
| Boundary behavior | Adjacent components meet continuously at zero |
| Regularity | Region-dependent boundary regularity |
| Main challenge | Applying one shrinkage policy across heterogeneous smoothness |

## Parameters

| Symbol | Meaning | Default |
|---|---|---:|
| $K$ | Number of compact bumps | 5 |
| $\mathbf{a}$ | Left interval endpoints | $(0,\,0.2,\,0.4,\,0.6,\,0.8)$ |
| $\mathbf{b}$ | Right interval endpoints | $(0.2,\,0.4,\,0.6,\,0.8,\,1)$ |
| $\mathbf{p}$ | Bump powers | $(4,\,3,\,2,\,1.5,\,0.5)$ |
| $\mathbf{A}$ | Bump amplitudes | $(1,\,-0.85,\,0.90,\,-0.80,\,0.65)$ |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF230_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF230_python.md)




## Recommended Uses

- Spatially adaptive denoising
- Mixed-regularity recovery
- Boundary-smoothness diagnostics

## Provenance

This is a deliberately artificial controlled stress test. Its normalization and sampling conventions are part of the definition.

[← Previous: CancellationNeedle](TF229_CancellationNeedle.md) · [Category 10 catalog](index.md) · [Benchmarking role →](benchmarking-role.md)

