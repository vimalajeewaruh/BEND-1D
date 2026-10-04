# FalseFlat


## Overview

The **FalseFlat** stress test places two large peaks at the ends while the apparently quiet center contains a weak oscillation and a tiny finite level change.

## Mathematical Definition

Define the smooth step

```math
S(x;c,w)=
\left[1+e^{-(x-c)/w}\right]^{-1}.
```

Define the Gaussian function

```math
g(x;c,w)=
\exp\left[
-\frac12\left(\frac{x-c}{w}\right)^2
\right].
```

Define the two dominant end peaks

```math
P(x)=
A_1g(x;c_1,w_1)
+
A_2g(x;c_2,w_2).
```

Define the central oscillatory window

```math
W_O(x)=
S(x;c_{O1},w_O)
-
S(x;c_{O2},w_O).
```

The weak central oscillation is

```math
O(x)=
A_O\sin(2\pi f_Ox)W_O(x).
```

Define the finite central level change

```math
L(x)=
A_L
\left[
S(x;c_{L1},w_L)
-
S(x;c_{L2},w_L)
\right].
```

The signal is

```math
f(x)=P(x)+O(x)+L(x).
```

[View FalseFlat signal](../../assets/images/TF152_FalseFlat.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | High-energy ends with low-energy central structure |
| End peaks | Two dominant broad peaks centered at $c_1$ and $c_2$ |
| Central oscillation | Weak oscillation active approximately from $c_{O1}$ to $c_{O2}$ |
| Tiny level change | Finite elevated region approximately from $c_{L1}$ to $c_{L2}$ |
| Scale contrast | Central features have much smaller amplitudes than the end peaks |
| Main challenge | Global AMSE may hide complete loss of central features |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $A_1$ | Left end-peak amplitude | 0.55 |
| $c_1$ | Left end-peak center | 0.17 |
| $w_1$ | Left end-peak width | 0.09 |
| $A_2$ | Right end-peak amplitude | 0.62 |
| $c_2$ | Right end-peak center | 0.84 |
| $w_2$ | Right end-peak width | 0.08 |
| $A_O$ | Central oscillation amplitude | 0.035 |
| $f_O$ | Central oscillation frequency | 19 |
| $c_{O1}$ | Oscillation-window onset | 0.35 |
| $c_{O2}$ | Oscillation-window offset | 0.66 |
| $w_O$ | Oscillation-window transition width | 0.02 |
| $A_L$ | Central level-change magnitude | 0.045 |
| $c_{L1}$ | Level-change onset | 0.49 |
| $c_{L2}$ | Level-change offset | 0.60 |
| $w_L$ | Level-change transition width | 0.003 |
## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF152_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF152_python.md)




## Recommended Uses

- Feature-aware risk evaluation
- Low-energy structure preservation
- Global-AMSE failure demonstrations

## Provenance

**Status:** Deliberately artificial MishMash stress test.

---

[← Previous: PeakOnPeak](TF151_PeakOnPeak.md) | [Category 8 Catalog](index.md) | [Next: SymmetryBreak →](TF153_SymmetryBreak.md)
