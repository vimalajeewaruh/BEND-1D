# MultiscaleComb


## Overview

The **MultiscaleComb** stress test combines broad periodic peaks, narrower peaks, and still narrower alternating-sign spikes at three simultaneous resolution scales.

## Mathematical Definition

Define the Gaussian function

```math
g(x;c,w)=
\exp\left[
-\frac12\left(\frac{x-c}{w}\right)^2
\right].
```

Let the three sets of peak locations be

```math
\mathcal C_1=
(0.10,\,0.30,\,0.50,\,0.70,\,0.90),
```

```math
\mathcal C_2=
(0.15,\,0.25,\,\ldots,\,0.95),
```

and

```math
\mathcal C_3=
(0.18,\,0.23,\,\ldots,\,0.93).
```

Define the broad-scale comb

```math
P_1(x)=
A_1\sum_{c\in\mathcal C_1}g(x;c,w_1).
```

Define the intermediate-scale comb

```math
P_2(x)=
A_2\sum_{c\in\mathcal C_2}g(x;c,w_2).
```

Define the fine-scale alternating comb

```math
P_3(x)=
A_3\sum_{k=1}^{K_3}
(-1)^k g(x;c_{3k},w_3).
```

The signal is

```math
f(x)=P_1(x)+P_2(x)+P_3(x).
```

[View MultiscaleComb signal](../../assets/images/TF146_MultiscaleComb.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Three-scale peak comb |
| Broad scale | Peaks at locations in $\mathcal C_1$ with width $w_1$ |
| Intermediate scale | Peaks at locations in $\mathcal C_2$ with width $w_2$ |
| Fine scale | Alternating-sign spikes at locations in $\mathcal C_3$ with width $w_3$ |
| Main challenge | Simultaneous recovery at three resolution scales |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $\mathcal C_1$ | Broad-scale peak locations | $(0.10,\,0.30,\,0.50,\,0.70,\,0.90)$ |
| $\mathcal C_2$ | Intermediate-scale peak locations | $(0.15,\,0.25,\,\ldots,\,0.95)$ |
| $\mathcal C_3$ | Fine-scale spike locations | $(0.18,\,0.23,\,\ldots,\,0.93)$ |
| $A_1$ | Broad-scale amplitude | 0.25 |
| $A_2$ | Intermediate-scale amplitude | 0.16 |
| $A_3$ | Fine-scale amplitude | 0.07 |
| $w_1$ | Broad-scale peak width | 0.030 |
| $w_2$ | Intermediate-scale peak width | 0.010 |
| $w_3$ | Fine-scale spike width | 0.003 |
| $K_3$ | Number of fine-scale spikes | 16 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF146_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF146_python.md)



## Recommended Uses

- Three-scale resolution testing
- Alternating-spike preservation
- Adaptive bandwidth evaluation

## Provenance

**Status:** Deliberately artificial MishMash stress test.

---

[← Previous: DerivativeZoo](TF145_DerivativeZoo.md) | [Category 8 Catalog](index.md) | [Next: FrequencyCrossing →](TF147_FrequencyCrossing.md)
