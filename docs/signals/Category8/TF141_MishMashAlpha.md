# MishMashAlpha

## Overview

The **MishMashAlpha** artificial stress test combines a linear trend, square-root cusp, narrow bump, sharp step, and accelerating chirp.

## Mathematical Definition

Let $S(x;c,w)=[1+e^{-(x-c)/w}]^{-1}$. Then

$$
\begin{aligned}
f(x)={}&0.18x+0.25S(x;0.68,0.004)+0.32\sqrt{|x-0.27|}\\
&+0.22e^{-((x-0.48)/0.012)^2/2}+0.18\sin[2\pi(7x+18x^2)].
\end{aligned}
$$

[MishMashAlpha signal](../../assets/images/TF141_MishMashAlpha.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Trend, cusp, bump, step, and chirp |
| Local singularity | Cusp at $x=0.27$ |
| Abrupt feature | Step near $x=0.68$ |
| Main challenge | Each component favors a different smoothing scale |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $0.32$ | Cusp amplitude | 0.32 |
| $0.012$ | Bump width | 0.012 |
| $18$ | Quadratic chirp coefficient | 18 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF141_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF141_python.md)


## Recommended Uses

- Mixed-regularity stress testing
- Cusp and step preservation
- Adaptive-scale evaluation

## Provenance

**Status:** Deliberately artificial MishMash stress test.

---

[← Previous: BridgeStrainEvent](TF140_BridgeStrainEvent.md) | [Category 8 Catalog](index.md) | [Next: MishMashBeta →](TF142_MishMashBeta.md)
