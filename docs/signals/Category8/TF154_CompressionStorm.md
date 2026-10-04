# CompressionStorm

## Overview

The **CompressionStorm** stress test contains alternating events whose widths and spacing collapse toward the right boundary while an accelerating oscillation develops underneath.

## Mathematical Definition

Define the Gaussian function

```math
g(x;c,w)=
\exp\left[
-\frac12\left(\frac{x-c}{w}\right)^2
\right].
```

Let the event centers be

```math
\mathbf{c}
=
(0.18,\,0.36,\,0.52,\,0.64,\,0.73,\,0.795,\,0.842,\,0.876,\,0.902,\,0.922,\,0.938).
```

For $k=1,\ldots,K$, define the geometrically decreasing widths

```math
w_k=
w_0 r_w^{k-1},
```

and amplitudes

```math
a_k=
A_0 r_A^{k-1}.
```

Define the alternating compressed-event component

```math
P(x)=
\sum_{k=1}^{K}
(-1)^{k+1}a_k g(x;c_k,w_k).
```

Define the accelerating oscillatory component

```math
C(x)=
A_Cx^2
\sin\left[
2\pi(f_0x+\beta x^3)
\right].
```

The signal is

```math
f(x)=b_0+P(x)+C(x).
```

[View CompressionStorm signal](../../assets/images/TF154_CompressionStorm.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Compressed alternating peaks plus accelerating oscillation |
| Event locations | Increasingly dense toward the right boundary |
| Width scaling | Successive widths contract by factor $r_w$ |
| Amplitude scaling | Successive magnitudes contract by factor $r_A$ |
| Sign pattern | Alternating positive and negative events |
| Oscillation | Increasing amplitude and accelerating phase |
| Main challenge | Event spacing and characteristic scale collapse simultaneously |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $b_0$ | Baseline level | 0.05 |
| $K$ | Number of compressed events | 11 |
| $\mathbf{c}$ | Event centers | $(0.18,\,0.36,\,0.52,\,0.64,\,0.73,\,0.795,\,0.842,\,0.876,\,0.902,\,0.922,\,0.938)$ |
| $w_0$ | Initial event width | 0.025 |
| $r_w$ | Width contraction factor | 0.76 |
| $A_0$ | Initial event amplitude | 0.24 |
| $r_A$ | Amplitude contraction factor | 0.93 |
| $A_C$ | Oscillation amplitude scale | 0.12 |
| $f_0$ | Oscillation base frequency | 6 |
| $\beta$ | Cubic phase coefficient | 45 |

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
