# CancellationNeedle


## Overview

Two order-one broad components nearly cancel, leaving a fragile background on which a narrow biphasic feature is placed.

## Mathematical Definition

With $G(x;c,w)=e^{-((x-c)/w)^2/2}$,
$$
g_1=1.10G(x;0.50,0.18)+0.22\sin(4\pi x),\qquad
g_2=1.004g_1+0.018G(x;0.44,0.10),
$$
$$
\eta=G(x;0.635,0.006)-0.62G(x;0.648,0.009).
$$
If $r=g_1-0.995g_2+0.16\eta$, then
$f_i=r(x_i)/\max_j|r(x_j)|$.

[CancellationNeedle signal](../../assets/images/TF229_CancellationNeedle.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Interference |
| Structure | Near-cancellation residual plus weak biphasic needle |
| Regularity | Smooth but numerically delicate and highly localized |
| Main challenge | Preserve a weak feature when total signal is a small residual |

## Parameters

| Parameter | Value |
|---|---|
| Broad center/width | $0.50/0.18$ |
| Needle centers | $0.635,0.648$ |
| Needle weight | $0.16$ |
| Output | Max-normalized |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF229_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF229_python.md)




## Recommended Uses

- Weak-needle preservation
- Cancellation-residual denoising
- Global-error failure diagnostics

## Provenance

This is a deliberately artificial controlled stress test. Its normalization and sampling conventions are part of the definition.

[← Previous: LogPeriodicCusp](TF228_LogPeriodicCusp.md) · [Category 10 catalog](index.md) · [Next: RegularityQuilt →](TF230_RegularityQuilt.md)

