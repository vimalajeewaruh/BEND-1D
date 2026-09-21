# MoELoadImbalance


## Overview

The **MoELoadImbalance** signal begins near a balanced operating level, enters a sustained routing-imbalance interval, exhibits redistributive oscillation, and then recovers.

## Mathematical Definition

Let $S(x;c,w)=[1+e^{-(x-c)/w}]^{-1}$. Then

$$
\begin{aligned}
f(x)={}&0.42+0.025\sin(8\pi x)\\
&+0.28[S(x;0.38,0.012)-S(x;0.70,0.018)]\\
&+0.08\sin(24\pi x)[S(x;0.42,0.015)-S(x;0.68,0.015)].
\end{aligned}
$$

[MoELoadImbalance signal](../../assets/images/TF119_MoELoadImbalance.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Finite level imbalance with internal oscillation |
| Imbalance interval | Approximately 0.38–0.70 |
| Redistribution | 12-cycle oscillation within the interval |
| Main challenge | Recovering both regime duration and internal routing dynamics |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $0.28$ | Imbalance magnitude | 0.28 |
| $0.08$ | Redistribution amplitude | 0.08 |
| $12$ | Redistribution cycle count | 12 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF0119_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF0119_python.md)



## Recommended Uses

- AI-infrastructure telemetry smoothing
- Routing-regime detection
- Internal-oscillation preservation

## Provenance

**Status:** Mixture-of-experts-load-routing-inspired deterministic surrogate.

---

[← Previous: GPUThermalThrottle](TF118_GPUThermalThrottle.md) | [Category 7 Catalog](index.md) | [Next: InferenceQueueCollapse →](TF120_InferenceQueueCollapse.md)
