# EpidemicSeasonal

## Overview

The **EpidemicSeasonal** signal combines a repeating endemic background with a large localized outbreak. A later sustained level decrease represents an intervention or other reduction in transmission.

## Mathematical Definition

Define

$$
S(x)=0.30+0.10\sin(8\pi x-0.8),
$$

$$
O(x)=0.95\exp\!\left[-\frac12\left(\frac{x-0.54}{0.060}\right)^2\right],
$$

and

$$
I(x)=-\frac{0.18}{1+e^{-70(x-0.63)}}.
$$

The complete signal is

$$
f(x)=S(x)+O(x)+I(x).
$$

[EpidemicSeasonal signal](../../assets/images/TF056_EpidemicSeasonal.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Seasonality with outbreak and regime shift |
| Seasonal frequency | 4 |
| Outbreak center | $x=0.54$ |
| Intervention center | $x=0.63$ |
| Main challenge | Separating expected seasonality from outbreak and intervention |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $0.060$ | Outbreak width | 0.060 |
| $0.95$ | Outbreak magnitude | 0.95 |
| $70$ | Intervention sharpness | 70 |


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

