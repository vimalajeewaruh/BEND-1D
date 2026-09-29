# EpidemicSeasonal

## Overview

The **EpidemicSeasonal** signal combines a repeating endemic background with a large localized outbreak. A later sustained level decrease represents an intervention or other reduction in transmission.

## Mathematical Definition

Define the seasonal component

```math
S(x)=b_0+A_S\sin(2\pi f_Sx+\delta_S),
```

the outbreak component

```math
O(x)=A_O\exp\left[
-\frac12\left(\frac{x-\mu_O}{s_O}\right)^2
\right],
```

and the intervention component

```math
I(x)=-A_I\left[1+e^{-k_I(x-x_I)}\right]^{-1}.
```

The complete signal is

```math
f(x)=S(x)+O(x)+I(x).
```

[View EpidemicSeasonal signal](../../assets/images/TF056_EpidemicSeasonal.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Seasonality with outbreak and regime shift |
| Seasonal frequency | $f_S$ |
| Outbreak center | $x=\mu_O$ |
| Intervention center | $x=x_I$ |
| Main challenge | Separating expected seasonality from outbreak and intervention |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $b_0$ | Baseline level | 0.30 |
| $A_S$ | Seasonal amplitude | 0.10 |
| $f_S$ | Seasonal frequency | 4 |
| $\delta_S$ | Seasonal phase shift | -0.8 |
| $A_O$ | Outbreak magnitude | 0.95 |
| $\mu_O$ | Outbreak center | 0.54 |
| $s_O$ | Outbreak width | 0.060 |
| $A_I$ | Intervention magnitude | 0.18 |
| $x_I$ | Intervention center | 0.63 |
| $k_I$ | Intervention sharpness | 70 |


## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF056_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF056_python.md)



## Recommended Uses

- Seasonal epidemiological denoising
- Outbreak preservation
- Intervention-change detection
- Background-versus-event separation

## Provenance

**Status:** Seasonal-epidemic-inspired deterministic public-health surrogate.

---

[← Previous: Pharmacokinetic](TF055_Pharmacokinetic.md) | [Category 4 Catalog](index.md) | [Next: PollutionEpisode →](TF057_PollutionEpisode.md)

