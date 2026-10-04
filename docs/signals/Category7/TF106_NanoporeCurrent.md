# NanoporeCurrent

## Overview

The **NanoporeCurrent** signal consists of six unequal current levels with different dwell times, plus a brief positive secondary state and a very narrow blockage.

## Mathematical Definition

Let the level boundaries be

```math
\mathbf{b}
=
(0,\,0.16,\,0.31,\,0.50,\,0.67,\,0.82,\,1),
```

and the corresponding current levels be

```math
\boldsymbol{\ell}
=
(0.72,\,0.50,\,0.64,\,0.39,\,0.58,\,0.46).
```

For $k=1,\ldots,K$, define

```math
L(x)=\ell_k
```

for $b_k\leq x<b_{k+1}$, with $L(1)=\ell_K$.

Define the brief positive secondary state

```math
P(x)=
A_P
\exp\left[
-\frac12
\left(
\frac{x-c_P}{w_P}
\right)^2
\right].
```

Define the narrow blockage

```math
N(x)=
-A_N
\exp\left[
-\frac12
\left(
\frac{x-c_N}{w_N}
\right)^2
\right].
```

The signal is

```math
f(x)=L(x)+P(x)+N(x).
```

[View NanoporeCurrent signal](../../assets/images/TF106_NanoporeCurrent.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Piecewise levels with brief local states |
| Dwell structure | $K$ unequal intervals defined by $\mathbf{b}$ |
| Secondary state | Brief positive feature centered at $c_P$ |
| Shortest feature | Narrow negative blockage centered at $c_N$ |
| Main challenge | Segmenting steps without erasing very short states |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $K$ | Number of current levels | 6 |
| $\mathbf{b}$ | Level boundaries | $(0,\,0.16,\,0.31,\,0.50,\,0.67,\,0.82,\,1)$ |
| $\boldsymbol{\ell}$ | Current levels | $(0.72,\,0.50,\,0.64,\,0.39,\,0.58,\,0.46)$ |
| $A_P$ | Positive secondary-state amplitude | 0.05 |
| $c_P$ | Positive secondary-state center | 0.545 |
| $w_P$ | Positive secondary-state width | 0.008 |
| $A_N$ | Blockage magnitude | 0.10 |
| $c_N$ | Blockage center | 0.735 |
| $w_N$ | Blockage width | 0.004 |
## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF106_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF106_python.md)



## Recommended Uses

- Nanopore-current denoising
- Piecewise-level segmentation
- Brief-state preservation

## Provenance

**Status:** Nanopore-current-inspired deterministic genomics surrogate.

---

[← Previous: CalciumTransientTrain](TF105_CalciumTransientTrain.md) | [Category 7 Catalog](index.md) | [Next: CopyNumberGenome →](TF107_CopyNumberGenome.md)
