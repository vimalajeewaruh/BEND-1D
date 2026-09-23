# NestedWavePackets


## Overview

The **NestedWavePackets** signal explicitly nests a broad low-frequency packet, a shorter intermediate-frequency packet, and a very short high-frequency burst.

## Mathematical Definition

Let $g(x;c,w)=e^{-((x-c)/w)^2/2}$. Then

$$
\begin{aligned}
f(x)={}&0.30g(x;0.50,0.22)\sin(16\pi x)\\
&+0.24g(x;0.56,0.080)\sin(56\pi x)\\
&+0.17g(x;0.59,0.022)\sin(170\pi x).
\end{aligned}
$$

[NestedWavePackets signal](../../assets/images/TF124_NestedWavePackets.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Explicitly nested oscillatory packets |
| Packet widths | 0.22, 0.080, and 0.022 |
| Cycle frequencies | 8, 28, and 85 |
| Main challenge | Retaining the shortest packet without fragmenting broad structure |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $0.30,0.24,0.17$ | Packet amplitudes | As shown |
| $0.50,0.56,0.59$ | Packet centers | As shown |
| $8,28,85$ | Packet cycle frequencies | As shown |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF124_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF124_python.md)


## Recommended Uses

- Multiscale packet denoising
- Local frequency preservation
- Nested-structure recovery

## Provenance

**Status:** Deliberately artificial nested-wave-packet stress test.

---

[← Previous: HiddenNeedle](TF123_HiddenNeedle.md) | [Category 7 Catalog](index.md) | [Next: CancellationTrap →](TF125_CancellationTrap.md)
