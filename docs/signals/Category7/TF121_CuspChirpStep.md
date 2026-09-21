# CuspChirpStep


## Overview

The **CuspChirpStep** signal is an artificial stress test combining a cusp, accelerating chirp, smooth trend, and small sharp step in one record.

## Mathematical Definition

Let $S(x;c,w)=[1+e^{-(x-c)/w}]^{-1}$. Then

$$
f(x)=0.45\sqrt{|x-0.30|}+0.22\sin[2\pi(8x+18x^2)]+0.28S(x;0.68,0.004)+0.10x.
$$

[CuspChirpStep signal](../../assets/images/TF121_CuspChirpStep.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Cusp, chirp, step, and trend |
| Cusp | At $x=0.30$ |
| Step | Near $x=0.68$ |
| Main challenge | Reconciling features that favor different smoothing scales |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $0.45$ | Cusp amplitude | 0.45 |
| $18$ | Quadratic chirp coefficient | 18 |
| $0.28$ | Step magnitude | 0.28 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF0121_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF0121_python.md)



## Recommended Uses

- Mixed-regularity stress testing
- Cusp and step preservation
- Chirp phase recovery

## Provenance

**Status:** Deliberately artificial multiregularity stress test.

---

[← Previous: InferenceQueueCollapse](TF120_InferenceQueueCollapse.md) | [Category 7 Catalog](index.md) | [Next: PeakForest →](TF122_PeakForest.md)
