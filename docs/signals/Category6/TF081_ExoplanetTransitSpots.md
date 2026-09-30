# ExoplanetTransitSpots


## Overview

The **ExoplanetTransitSpots** signal contains weak stellar variability, a broad transit depression with finite ingress and egress, limb features, and a much smaller spot-crossing bump inside the transit.

## Mathematical Definition

Define the smooth step

```math
s(x;c,w)=\left[1+e^{-(x-c)/w}\right]^{-1},
```

and the Gaussian feature

```math
g(x;c,w)=
\exp\left[
-\frac12\left(\frac{x-c}{w}\right)^2
\right].
```

Define the transit window

```math
W(x)=s(x;c_1,w_T)-s(x;c_2,w_T).
```

Define the stellar baseline variation

```math
B(x)=b_0+A_B\sin(2\pi f_Bx).
```

Define the broad transit depression

```math
T(x)=-A_TW(x).
```

Define the ingress and egress features

```math
E(x)=
-A_Eg(x;\mu_1,s_E)
-A_Eg(x;\mu_2,s_E).
```

Define the spot-crossing anomaly

```math
P(x)=A_Pg(x;\mu_P,s_P).
```

The signal is

```math
f(x)=B(x)+T(x)+E(x)+P(x).
```

[View ExoplanetTransitSpots signal](../../assets/images/TF081_ExoplanetTransitSpots.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Broad depression with weak internal anomaly |
| Transit interval | Approximately $c_1<x<c_2$ |
| Edge features | Weak depressions centered at $\mu_1$ and $\mu_2$ |
| Small feature | Positive spot-crossing bump near $x=\mu_P$ |
| Main challenge | Preserving a weak anomaly relative to the transit depth |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $b_0$ | Baseline flux level | 1 |
| $A_B$ | Baseline oscillation amplitude | 0.012 |
| $f_B$ | Baseline oscillation frequency | 1.2 |
| $A_T$ | Transit depth | 0.20 |
| $c_1,c_2$ | Transit boundaries | 0.34, 0.68 |
| $w_T$ | Transit-boundary transition width | 0.008 |
| $A_E$ | Edge-feature amplitude | 0.035 |
| $\mu_1,\mu_2$ | Edge-feature centers | 0.37, 0.65 |
| $s_E$ | Edge-feature width | 0.022 |
| $A_P$ | Spot-crossing amplitude | 0.050 |
| $\mu_P$ | Spot-crossing center | 0.535 |
| $s_P$ | Spot-crossing width | 0.016 |

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
