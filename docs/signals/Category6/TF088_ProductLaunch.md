# ProductLaunch


## Overview

The **ProductLaunch** signal follows a smooth sigmoidal adoption trend with a narrow viral burst, later saturation adjustment, and mild terminal decay.

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

Define the sigmoidal adoption component

```math
A(x)=A_As(x;c_A,w_A).
```

Define the localized viral-burst component

```math
V(x)=A_Vg(x;c_V,w_V).
```

Define the late saturation adjustment

```math
S(x)=-A_Ss(x;c_S,w_S).
```

Define the late linear-decay component

```math
D(x)=-m_D(x-c_D)_+.
```

The signal is

```math
f(x)=b_0+A(x)+V(x)+S(x)+D(x).
```

[View ProductLaunch signal](../../assets/images/TF088_ProductLaunch.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Sigmoidal adoption plus localized burst |
| Adoption midpoint | $x=c_A$ |
| Viral excursion | Narrow peak near $x=c_V$ |
| Late behavior | Saturation adjustment near $x=c_S$ followed by mild decay after $x=c_D$ |
| Main challenge | Preserving a short launch burst on a long adoption trend |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $b_0$ | Baseline level | 0.08 |
| $A_A$ | Adoption amplitude | 0.68 |
| $c_A$ | Adoption midpoint | 0.37 |
| $w_A$ | Adoption transition width | 0.055 |
| $A_V$ | Viral-burst amplitude | 0.28 |
| $c_V$ | Viral-burst center | 0.52 |
| $w_V$ | Viral-burst width | 0.028 |
| $A_S$ | Saturation-adjustment magnitude | 0.12 |
| $c_S$ | Saturation-adjustment midpoint | 0.74 |
| $w_S$ | Saturation-adjustment width | 0.045 |
| $m_D$ | Late-decay slope | 0.10 |
| $c_D$ | Late-decay onset | 0.83 |

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
