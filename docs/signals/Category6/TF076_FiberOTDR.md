# FiberOTDR


## Overview

The **FiberOTDR** signal models smoothly decaying optical backscatter, four narrow connector or defect reflections, and an abrupt attenuation step immediately after the largest reflection.

## Mathematical Definition

Define the Gaussian reflection profile

```math
g(x;c,w)=
\exp\left[
-\frac12\left(\frac{x-c}{w}\right)^2
\right].
```

Define the smooth step

```math
s(x;c,w)=
\left[1+e^{-(x-c)/w}\right]^{-1}.
```

Define the backscatter decay

```math
B(x)=A_Be^{-\alpha x}.
```

Define the sparse reflection component

```math
R(x)=\sum_{k=1}^{K}a_k g(x;c_k,w_k).
```

Define the attenuation-loss step

```math
L(x)=-A_Ls(x;c_L,w_L).
```

Define the weak oscillatory component

```math
O(x)=A_O\sin(2\pi f_Ox).
```

The signal is

```math
f(x)=B(x)+R(x)+L(x)+O(x).
```

The reflection centers, amplitudes, and widths are

```math
\mathbf{c}=(0.17,\,0.43,\,0.69,\,0.865),
```

```math
\mathbf{a}=(0.08,\,0.14,\,0.24,\,0.11),
```

```math
\mathbf{w}=(0.0035,\,0.0045,\,0.0030,\,0.0040).
```

[View FiberOTDR signal](../../assets/images/TF076_FiberOTDR.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Decay, sparse peaks, and level step |
| Local features | $K$ very narrow reflections |
| Structural change | Loss step near $x=c_L$ |
| Main challenge | Preserving weak reflectors while locating the attenuation step |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $K$ | Number of reflections | 4 |
| $A_B$ | Backscatter amplitude | 1.02 |
| $\alpha$ | Backscatter decay rate | 1.25 |
| $\mathbf{c}$ | Reflection centers | As specified |
| $\mathbf{a}$ | Reflection amplitudes | As specified |
| $\mathbf{w}$ | Reflection widths | As specified |
| $A_L$ | Loss-step magnitude | 0.18 |
| $c_L$ | Loss-step center | 0.705 |
| $w_L$ | Loss-step width | 0.0025 |
| $A_O$ | Oscillation amplitude | 0.010 |
| $f_O$ | Oscillation frequency | 4 |
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
