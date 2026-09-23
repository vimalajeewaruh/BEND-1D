# DoubletOnCliff


## Overview

The **DoubletOnCliff** stress test places two nearby narrow peaks directly on a steep sigmoidal transition.

## Mathematical Definition

Let $S(x;c,w)=[1+e^{-(x-c)/w}]^{-1}$ and $g(x;c,w)=e^{-((x-c)/w)^2/2}$. Then

$$
f(x)=0.75S(x;0.53,0.015)+0.28g(x;0.505,0.008)+0.24g(x;0.548,0.008).
$$

[DoubletOnCliff signal](../../assets/images/TF143_DoubletOnCliff.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Close peak doublet on steep edge |
| Edge center | $x=0.53$ |
| Doublet centers | 0.505 and 0.548 |
| Main challenge | Maintaining peak resolution while recovering the underlying cliff |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $0.015$ | Edge width | 0.015 |
| $0.008$ | Common peak width | 0.008 |
| $0.28,0.24$ | Peak amplitudes | As shown |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF0143_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF0143_python.md)


## Recommended Uses

- Edge-and-peak resolution testing
- Close-doublet preservation
- Local scale-adaptation evaluation

## Provenance

**Status:** Deliberately artificial MishMash stress test.

---

[← Previous: MishMashBeta](TF142_MishMashBeta.md) | [Category 8 Catalog](index.md) | [Next: NeedleInChirp →](TF144_NeedleInChirp.md)
