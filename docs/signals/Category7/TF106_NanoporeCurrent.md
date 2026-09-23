# NanoporeCurrent

## Overview

The **NanoporeCurrent** signal consists of six unequal current levels with different dwell times, plus a brief positive secondary state and a very narrow blockage.

## Mathematical Definition

Let

$$
b=(0,0.16,0.31,0.50,0.67,0.82,1),\qquad
\ell=(0.72,0.50,0.64,0.39,0.58,0.46).
$$

Define $L(x)=\ell_k$ for $b_k\le x<b_{k+1}$, using $L(1)=\ell_6$. Then

$$
f(x)=L(x)+0.05e^{-((x-0.545)/0.008)^2/2}-0.10e^{-((x-0.735)/0.004)^2/2}.
$$

[NanoporeCurrent signal](../../assets/images/TF106_NanoporeCurrent.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Piecewise levels with brief local states |
| Dwell structure | Six unequal intervals |
| Shortest feature | Negative blockage near $x=0.735$ |
| Main challenge | Segmenting steps without erasing very short states |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $b_k$ | Level boundaries | As above |
| $\ell_k$ | Current levels | As above |
| $0.004$ | Blockage width | 0.004 |

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
