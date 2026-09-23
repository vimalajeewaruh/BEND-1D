# MultiscaleComb


## Overview

The **MultiscaleComb** stress test combines broad periodic peaks, narrower peaks, and still narrower alternating-sign spikes at three simultaneous resolution scales.

## Mathematical Definition

Let $g(x;c,w)=e^{-((x-c)/w)^2/2}$ and

$$
\mathcal C_1=(0.10,0.30,0.50,0.70,0.90),
$$

$$
\mathcal C_2=(0.15,0.25,\ldots,0.95),\qquad
\mathcal C_3=(0.18,0.23,\ldots,0.93).
$$

Then

$$
f(x)=0.25\sum_{c\in\mathcal C_1}g(x;c,0.030)
+0.16\sum_{c\in\mathcal C_2}g(x;c,0.010)
+0.07\sum_{k=1}^{16}(-1)^k g(x;c_{3k},0.003).
$$

[MultiscaleComb signal](../../assets/images/TF146_MultiscaleComb.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Three-scale peak comb |
| Widths | 0.030, 0.010, and 0.003 |
| Fine scale | Alternating-sign spikes |
| Main challenge | Simultaneous recovery at three resolution scales |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $0.25,0.16,0.07$ | Scale-specific amplitudes | As shown |
| $0.030,0.010,0.003$ | Peak widths | As shown |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF0146_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF0146_python.md)



## Recommended Uses

- Three-scale resolution testing
- Alternating-spike preservation
- Adaptive bandwidth evaluation

## Provenance

**Status:** Deliberately artificial MishMash stress test.

---

[← Previous: DerivativeZoo](TF145_DerivativeZoo.md) | [Category 8 Catalog](index.md) | [Next: FrequencyCrossing →](TF147_FrequencyCrossing.md)
