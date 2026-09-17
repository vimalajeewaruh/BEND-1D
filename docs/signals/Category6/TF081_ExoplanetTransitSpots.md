# ExoplanetTransitSpots


## Overview

The **ExoplanetTransitSpots** signal contains weak stellar variability, a broad transit depression with finite ingress and egress, limb features, and a much smaller spot-crossing bump inside the transit.

## Mathematical Definition

Let $s(x;c,w)=[1+e^{-(x-c)/w}]^{-1}$, $g(x;c,w)=e^{-((x-c)/w)^2/2}$, and $W(x)=s(x;0.34,0.008)-s(x;0.68,0.008)$. Then

$$
f(x)=1+0.012\sin(2\pi\,1.2x)-0.20W(x)-0.035g(x;0.37,0.022)-0.035g(x;0.65,0.022)+0.050g(x;0.535,0.016).
$$

[ExoplanetTransitSpots signal](../../assets/images/TF081_ExoplanetTransitSpots.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Broad depression with weak internal anomaly |
| Transit interval | Approximately 0.34–0.68 |
| Small feature | Positive spot-crossing bump near $x=0.535$ |
| Main challenge | Preserving a weak anomaly relative to the transit depth |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $0.20$ | Transit depth | 0.20 |
| $0.050$ | Spot-crossing amplitude | 0.050 |
| $0.016$ | Spot-crossing width | 0.016 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF080_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF080_python.md)



## Recommended Uses

- Transit-light-curve denoising
- Weak-anomaly preservation
- Ingress and egress recovery

## Provenance

**Status:** Exoplanet-photometry-inspired deterministic surrogate.

---

[← Previous: TrainingLossSchedule](TF080_TrainingLossSchedule.md) | [Category 6 Catalog](index.md) | [Next: PulsarProfile →](TF082_PulsarProfile.md)
