# CompressionStorm

## Overview

The **CompressionStorm** stress test contains alternating events whose widths and spacing collapse toward the right boundary while an accelerating oscillation develops underneath.

## Mathematical Definition

Let $g(x;c,w)=e^{-((x-c)/w)^2/2}$ and

$$
c=(0.18,0.36,0.52,0.64,0.73,0.795,0.842,0.876,0.902,0.922,0.938).
$$

For $k=1,\ldots,11$, set $w_k=0.025(0.76)^{k-1}$ and $a_k=0.24(0.93)^{k-1}$. Then

$$
f(x)=0.05+\sum_{k=1}^{11}a_k(-1)^{k+1}g(x;c_k,w_k)
+0.12x^2\sin[2\pi(6x+45x^3)].
$$

[CompressionStorm signal](../../assets/images/TF154_CompressionStorm.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Compressed alternating peaks plus accelerating oscillation |
| Width contraction | Factor 0.76 per event |
| Amplitude contraction | Factor 0.93 per event |
| Main challenge | Event spacing and characteristic scale collapse simultaneously |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $0.76$ | Width contraction | 0.76 |
| $0.93$ | Amplitude contraction | 0.93 |
| $45$ | Cubic phase coefficient | 45 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF154_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF154_python.md)




## Recommended Uses

- Boundary-compression stress testing
- Shrinking-event resolution
- Accelerating-oscillation preservation

## Provenance

**Status:** Deliberately artificial MishMash stress test.

---

[← Previous: SymmetryBreak](TF153_SymmetryBreak.md) | [Category 8 Catalog](index.md) | [Next: GrandMishMash →](TF155_GrandMishMash.md)
