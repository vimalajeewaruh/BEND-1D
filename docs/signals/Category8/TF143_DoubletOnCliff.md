# DoubletOnCliff


## Overview

The **DoubletOnCliff** stress test places two nearby narrow peaks directly on a steep sigmoidal transition.

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

Define the steep cliff

```math
C(x)=
A_CS(x;c_C,w_C).
```

Define the peak doublet

```math
P(x)=
A_1g(x;c_1,w_P)
+
A_2g(x;c_2,w_P).
```

The signal is

```math
f(x)=C(x)+P(x).
```

[View DoubletOnCliff signal](../../assets/images/TF143_DoubletOnCliff.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Close peak doublet on steep edge |
| Cliff | Sharp sigmoidal transition centered at $c_C$ |
| Doublet | Two narrow peaks centered at $c_1$ and $c_2$ |
| Peak scale | Both peaks have common width $w_P$ |
| Main challenge | Maintaining peak resolution while recovering the underlying cliff |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $A_C$ | Cliff magnitude | 0.75 |
| $c_C$ | Cliff center | 0.53 |
| $w_C$ | Cliff transition width | 0.015 |
| $A_1$ | First peak amplitude | 0.28 |
| $c_1$ | First peak center | 0.505 |
| $A_2$ | Second peak amplitude | 0.24 |
| $c_2$ | Second peak center | 0.548 |
| $w_P$ | Common peak width | 0.008 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF143_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF143_python.md)


## Recommended Uses

- Edge-and-peak resolution testing
- Close-doublet preservation
- Local scale-adaptation evaluation

## Provenance

**Status:** Deliberately artificial MishMash stress test.

---

[← Previous: MishMashBeta](TF142_MishMashBeta.md) | [Category 8 Catalog](index.md) | [Next: NeedleInChirp →](TF144_NeedleInChirp.md)
