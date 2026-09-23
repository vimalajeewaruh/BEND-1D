# LacunaryCascade


## Overview

The **LacunaryCascade** stress test contains alternating events that become progressively narrower, smaller, and more tightly spaced, with deliberate gaps between scales.

## Mathematical Definition

Let $g(x;c,w)=e^{-((x-c)/w)^2/2}$ and

$$
c=(0.18,0.37,0.52,0.63,0.71,0.77,0.815,0.848,0.872,0.890).
$$

For $k=1,\ldots,10$, set

$$
a_k=0.30(0.87)^{k-1},\qquad w_k=0.025(0.70)^{k-1}.
$$

Then

$$
f(x)=0.02+\sum_{k=1}^{10}a_k(-1)^{k+1}g(x;c_k,w_k).
$$

[LacunaryCascade signal](../../assets/images/TF149_LacunaryCascade.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Alternating geometrically shrinking cascade |
| Amplitude ratio | 0.87 per event |
| Width ratio | 0.70 per event |
| Main challenge | Strongly nonuniform event scales and spacing |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $c_k$ | Event centers | As above |
| $0.87$ | Amplitude contraction | 0.87 |
| $0.70$ | Width contraction | 0.70 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF149_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF149_python.md)


## Recommended Uses

- Nonuniform-scale stress testing
- Compressed-event resolution
- Alternating-feature preservation

## Provenance

**Status:** Deliberately artificial MishMash stress test.

---

[← Previous: PhaseResetBurst](TF148_PhaseResetBurst.md) | [Category 8 Catalog](index.md) | [Next: SmoothRoughSmooth →](TF150_SmoothRoughSmooth.md)
