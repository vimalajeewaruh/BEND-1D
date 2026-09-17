# ProductLaunch


## Overview

The **ProductLaunch** signal follows a smooth sigmoidal adoption trend with a narrow viral burst, later saturation adjustment, and mild terminal decay.

## Mathematical Definition

Let $s(x;c,w)=[1+e^{-(x-c)/w}]^{-1}$ and $g(x;c,w)=e^{-((x-c)/w)^2/2}$. Then

$$
f(x)=0.08+0.68s(x;0.37,0.055)+0.28g(x;0.52,0.028)-0.12s(x;0.74,0.045)-0.10(x-0.83)_+.
$$

[ProductLaunch signal](../../assets/images/TF088_ProductLaunch.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Sigmoidal adoption plus localized burst |
| Viral excursion | Narrow peak near $x=0.52$ |
| Late behavior | Saturation adjustment and mild decay |
| Main challenge | Preserving a short launch burst on a long adoption trend |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $0.37$ | Adoption midpoint | 0.37 |
| $0.52$ | Viral-burst center | 0.52 |
| $0.028$ | Viral-burst width | 0.028 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF088_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF088_python.md)



## Recommended Uses

- Adoption-curve denoising
- Local-burst preservation
- Trend and saturation recovery

## Provenance

**Status:** Product-adoption-inspired deterministic surrogate.

---

[← Previous: PromoDemand](TF087_PromoDemand.md) | [Category 6 Catalog](index.md) | [Next: AdstockCampaign →](TF089_AdstockCampaign.md)
