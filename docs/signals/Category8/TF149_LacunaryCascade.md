# LacunaryCascade


## Overview

The **LacunaryCascade** stress test contains alternating events that become progressively narrower, smaller, and more tightly spaced, with deliberate gaps between scales.

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
(0.18,\,0.37,\,0.52,\,0.63,\,0.71,\,0.77,\,0.815,\,0.848,\,0.872,\,0.890).
```

For $k=1,\ldots,K$, define the geometrically decreasing amplitudes

```math
a_k=
A_0 r_A^{k-1},
```

and widths

```math
w_k=
w_0 r_w^{k-1}.
```

Define each alternating event as

```math
P_k(x)=
(-1)^{k+1}a_k g(x;c_k,w_k).
```

The signal is

```math
f(x)=
b_0+\sum_{k=1}^{K}P_k(x).
```

[View LacunaryCascade signal](../../assets/images/TF149_LacunaryCascade.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Alternating geometrically shrinking cascade |
| Event locations | Nonuniform centers specified by $\mathbf{c}$ |
| Amplitude scaling | Successive magnitudes contract by factor $r_A$ |
| Width scaling | Successive widths contract by factor $r_w$ |
| Sign pattern | Alternating positive and negative events |
| Main challenge | Strongly nonuniform event scales and spacing |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $b_0$ | Baseline level | 0.02 |
| $K$ | Number of cascade events | 10 |
| $\mathbf{c}$ | Event centers | $(0.18,\,0.37,\,0.52,\,0.63,\,0.71,\,0.77,\,0.815,\,0.848,\,0.872,\,0.890)$ |
| $A_0$ | Initial event amplitude | 0.30 |
| $r_A$ | Amplitude contraction factor | 0.87 |
| $w_0$ | Initial event width | 0.025 |
| $r_w$ | Width contraction factor | 0.70 |

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
