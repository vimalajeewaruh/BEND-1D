# InternalSolitons

## Overview

The **InternalSolitons** signal is a packet of unequal internal solitary depression waves. The leading event is strongest, and later waves become progressively weaker and narrower. It tests whether small secondary structures are retained near a dominant event.

## Mathematical Definition

The centers, amplitudes, and widths are

$$
c=(0.28,0.405,0.515,0.612,0.700),
$$

$$
A=(1.00,0.78,0.61,0.47,0.34),
$$

$$
s=(0.028,0.024,0.022,0.020,0.018).
$$

Avoiding special-function notation, each depression pulse is written as

$$
P_k(x)=-\frac{A_k}{\cosh^2\!\left((x-c_k)/s_k\right)}.
$$

The complete signal is

$$
f(x)=0.025\sin(2.4\pi x)+\sum_{k=1}^{5}P_k(x).
$$

[InternalSolitons signal](../../assets/images/TF039_InternalSolitons.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Ranked packet of localized depression pulses |
| Number of pulses | 5 |
| Amplitudes | Progressively decreasing |
| Widths | Progressively narrowing |
| Main challenge | Retaining weak secondary waves near a dominant event |

## Parameters

| Parameter | Meaning | Default |
|---|---|---|
| $N$ | Number of samples | 1024 |
| $c$ | Pulse centers | $(0.28,0.405,0.515,0.612,0.700)$ |
| $A$ | Pulse amplitudes | $(1.00,0.78,0.61,0.47,0.34)$ |
| $s$ | Pulse widths | $(0.028,0.024,0.022,0.020,0.018)$ |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF039_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF039_python.md)



## Recommended Uses

- Unequal-pulse preservation
- Weak-neighbor recovery
- Oceanographic transient denoising
- Ranked multiscale-event analysis

## Provenance

**Status:** Internal-solitary-wave-inspired deterministic oceanographic surrogate.

---

[← Previous: VortexLockIn](TF038_VortexLockIn.md) | [Category 3 Catalog](index.md) | [Next: WhaleClicks →](TF040_WhaleClicks.md)

