# FiberOTDR


## Overview

The **FiberOTDR** signal models smoothly decaying optical backscatter, four narrow connector or defect reflections, and an abrupt attenuation step immediately after the largest reflection.

## Mathematical Definition

Let $g(x;c,w)=\exp[-\tfrac12((x-c)/w)^2]$ and $s(x;c,w)=[1+e^{-(x-c)/w}]^{-1}$. Then

$$
f(x)=1.02e^{-1.25x}+\sum_{k=1}^{4}a_k g(x;c_k,w_k)-0.18s(x;0.705,0.0025)+0.010\sin(8\pi x),
$$

where

$$
c=(0.17,0.43,0.69,0.865),\quad
a=(0.08,0.14,0.24,0.11),\quad
w=(0.0035,0.0045,0.0030,0.0040).
$$

[FiberOTDR signal](../../assets/images/TF076_FiberOTDR.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Decay, sparse peaks, and level step |
| Local features | Four very narrow reflections |
| Structural change | Loss step near $x=0.705$ |
| Main challenge | Preserving weak reflectors while locating the attenuation step |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $1.25$ | Backscatter decay rate | 1.25 |
| $0.18$ | Loss-step magnitude | 0.18 |
| $c_k,a_k,w_k$ | Reflection centers, amplitudes, and widths | As above |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF076_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF076_python.md)



## Recommended Uses

- OTDR trace denoising
- Sparse-reflector recovery
- Attenuation-step localization

## Provenance

**Status:** Optical-fiber-diagnostics-inspired deterministic surrogate.

---

[← Previous: MeltPoolInstability](TF075_MeltPoolInstability.md) | [Category 6 Catalog](index.md) | [Next: NetworkTrafficBursts →](TF077_NetworkTrafficBursts.md)
