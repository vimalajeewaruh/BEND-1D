# TrainingLossSchedule


## Overview

The **TrainingLossSchedule** signal combines fast and slow optimization decay, three discrete schedule-related improvements, and three transient loss spikes.

## Mathematical Definition

Let $s(x;c,w)=[1+e^{-(x-c)/w}]^{-1}$ and $g(x;c,w)=e^{-((x-c)/w)^2/2}$. Then

$$
\begin{aligned}
f(x)={}&1.35e^{-5.8x}+0.24e^{-0.65x}+0.065\\
&-0.065s(x;0.34,0.006)-0.045s(x;0.58,0.006)-0.028s(x;0.78,0.005)\\
&+0.12g(x;0.27,0.010)+0.075g(x;0.47,0.008)+0.050g(x;0.705,0.006).
\end{aligned}
$$

[TrainingLossSchedule signal](../../assets/images/TF080_TrainingLossSchedule.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Multirate decay with steps and spikes |
| Schedule changes | Near 0.34, 0.58, and 0.78 |
| Transients | Three narrow positive spikes |
| Main challenge | Separating genuine schedule changes from optimization roughness |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $5.8,0.65$ | Fast and slow decay rates | As shown |
| $0.34,0.58,0.78$ | Schedule locations | As shown |
| $0.27,0.47,0.705$ | Spike centers | As shown |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF080_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF080_python.md)



## Recommended Uses

- Optimization-curve denoising
- Change-point preservation
- Transient-spike analysis

## Provenance

**Status:** Machine-learning-optimization-inspired deterministic surrogate.

---

[← Previous: CacheThrash](TF079_CacheThrash.md) | [Category 6 Catalog](index.md) | [Next: ExoplanetTransitSpots →](TF081_ExoplanetTransitSpots.md)
