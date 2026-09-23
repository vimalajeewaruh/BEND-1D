# MishMashBeta


## Overview

The **MishMashBeta** stress test combines smooth low-frequency oscillations, Doppler-like compression, a finite plateau, an isolated negative spike, and a weak shoulder.

## Mathematical Definition

Let $u=\max(x,0.02)$ and $S(x;c,w)=[1+e^{-(x-c)/w}]^{-1}$. Then

$$
\begin{aligned}
f(x)={}&0.22\sin(6\pi x)+0.10\cos(10\pi x)\\
&+0.14\sqrt{u(1-u)}\sin\!\left(\frac{2\pi\,1.15}{u+0.05}\right)\\
&+0.20[S(x;0.38,0.008)-S(x;0.60,0.008)]\\
&-0.30e^{-((x-0.73)/0.005)^2/2}+0.09e^{-((x-0.82)/0.025)^2/2}.
\end{aligned}
$$

[MishMashBeta signal](../../assets/images/TF142_MishMashBeta.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Oscillation, compression, plateau, spike, and shoulder |
| Plateau | Approximately 0.38–0.60 |
| Narrow spike | Negative event near $x=0.73$ |
| Main challenge | Incompatible frequency and localization geometries |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $1.15$ | Compressed-oscillation phase scale | 1.15 |
| $0.20$ | Plateau magnitude | 0.20 |
| $0.005$ | Negative-spike width | 0.005 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF142_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF142_python.md)



## Recommended Uses

- Adversarial denoising evaluation
- Spike and plateau preservation
- Nonuniform-frequency recovery

## Provenance

**Status:** Deliberately artificial MishMash stress test.

---

[← Previous: MishMashAlpha](TF141_MishMashAlpha.md) | [Category 8 Catalog](index.md) | [Next: DoubletOnCliff →](TF143_DoubletOnCliff.md)
