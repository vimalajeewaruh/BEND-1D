# FalseFlat


## Overview

The **FalseFlat** stress test places two large peaks at the ends while the apparently quiet center contains a weak oscillation and a tiny finite level change.

## Mathematical Definition

Let $S(x;c,w)=[1+e^{-(x-c)/w}]^{-1}$ and $g(x;c,w)=e^{-((x-c)/w)^2/2}$. Then

$$
\begin{aligned}
f(x)={}&0.55g(x;0.17,0.09)+0.62g(x;0.84,0.08)\\
&+0.035\sin(38\pi x)[S(x;0.35,0.02)-S(x;0.66,0.02)]\\
&+0.045[S(x;0.49,0.003)-S(x;0.60,0.003)].
\end{aligned}
$$

[FalseFlat signal](../../assets/images/TF152_FalseFlat.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | High-energy ends with low-energy central structure |
| Central oscillation | Active approximately 0.35–0.66 |
| Tiny level change | Approximately 0.49–0.60 |
| Main challenge | Global AMSE may hide complete loss of central features |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $0.55,0.62$ | End-peak amplitudes | As shown |
| $0.035$ | Central oscillation amplitude | 0.035 |
| $0.045$ | Central level-change magnitude | 0.045 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF0152_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF0152_python.md)




## Recommended Uses

- Feature-aware risk evaluation
- Low-energy structure preservation
- Global-AMSE failure demonstrations

## Provenance

**Status:** Deliberately artificial MishMash stress test.

---

[← Previous: PeakOnPeak](TF151_PeakOnPeak.md) | [Category 8 Catalog](index.md) | [Next: SymmetryBreak →](TF153_SymmetryBreak.md)
