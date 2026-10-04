# HiddenNeedle


## Overview

The **HiddenNeedle** signal embeds a very narrow low-amplitude peak and a small negative shoulder inside a dominant broad Gaussian feature.

## Mathematical Definition

Define the Gaussian function

```math
g(x;c,w)=
\exp\left[
-\frac12\left(\frac{x-c}{w}\right)^2
\right].
```

Define the broad dominant feature

```math
B(x)=A_Bg(x;c_B,w_B).
```

Define the narrow needle feature

```math
N(x)=A_Ng(x;c_N,w_N).
```

Define the negative shoulder

```math
S(x)=-A_Sg(x;c_S,w_S).
```

The signal is

```math
f(x)=B(x)+N(x)+S(x).
```

[View HiddenNeedle signal](../../assets/images/TF123_HiddenNeedle.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Weak narrow structure inside broad dominant feature |
| Dominant feature | Broad positive component centered at $c_B$ |
| Needle | Weak, very narrow positive feature centered at $c_N$ |
| Shoulder | Small negative feature centered at $c_S$ |
| Main challenge | Global error can remain small even if the needle disappears |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $A_B$ | Broad-feature amplitude | 0.80 |
| $c_B$ | Broad-feature center | 0.52 |
| $w_B$ | Broad-feature width | 0.20 |
| $A_N$ | Needle amplitude | 0.085 |
| $c_N$ | Needle center | 0.565 |
| $w_N$ | Needle width | 0.0035 |
| $A_S$ | Shoulder magnitude | 0.04 |
| $c_S$ | Shoulder center | 0.61 |
| $w_S$ | Shoulder width | 0.016 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF123_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF123_python.md)



## Recommended Uses

- Oversmoothing detection
- Weak-needle preservation
- Feature-aware risk evaluation

## Provenance

**Status:** Deliberately artificial weak-feature stress test.

---

[← Previous: PeakForest](TF122_PeakForest.md) | [Category 7 Catalog](index.md) | [Next: NestedWavePackets →](TF124_NestedWavePackets.md)
