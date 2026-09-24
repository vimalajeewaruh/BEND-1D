# RegularityQuilt


## Overview

Five adjacent compact bumps meet continuously at zero but use different powers and signs, placing several local smoothness classes in one record.

## Mathematical Definition

For the interval $[a_k,b_k]$, set

$$
s=\frac{x-a_k}{b_k-a_k}
$$

and

$$
f(x)=A_k[4s(1-s)]^{p_k},
\qquad a_k\le x\le b_k.
$$

The rows $(a_k,b_k,p_k,A_k)$ are

$$
(0,.2,4,1),\quad
(.2,.4,3,-.85),\quad
(.4,.6,2,.90),\quad
(.6,.8,1.5,-.80),\quad
(.8,1,.5,.65).
$$

[RegularityQuilt signal](../../assets/images/TF230_RegularityQuilt.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Regularity stress test |
| Structure | Piecewise compact beta-shaped bumps |
| Regularity | Region-dependent boundary regularity |
| Main challenge | Apply one shrinkage policy across heterogeneous smoothness |

## Parameters

| Parameter | Value |
|---|---|
| Intervals | Five equal subintervals |
| Powers | $4,3,2,1.5,0.5$ |
| Amplitudes | $1,-0.85,0.90,-0.80,0.65$ |

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

