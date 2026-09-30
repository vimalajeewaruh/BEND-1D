# MarketFlashCrash


## Overview

The **MarketFlashCrash** signal combines gradual price-like movement, an abrupt loss, rapid partial rebound, a smaller aftershock, and slow normalization.

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

Define the background component

```math
B(x)=b_0+mx+A_B\sin(2\pi f_Bx).
```

Define the abrupt crash component

```math
C(x)=-A_Cs(x;c_C,w_C).
```

Define the rapid rebound component

```math
R(x)=A_Rs(x;c_R,w_R).
```

Define the post-crash aftershock

```math
H(x)=-A_Hg(x;c_H,w_H).
```

Define the slow normalization component, for $x\geq c_R$, as

```math
N(x)=A_N
\left[
1-e^{-\alpha_N(x-c_R)}
\right],
```

with $N(x)=0$ for $x<c_R$.

The signal is

```math
f(x)=B(x)+C(x)+R(x)+H(x)+N(x).
```


[View MarketFlashCrash signal](../../assets/images/TF090_MarketFlashCrash.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Abrupt crash and asymmetric recovery |
| Crash | Near $x=c_C$ |
| Recovery | Partial rebound near $x=c_R$ followed by slow normalization |
| Aftershock | Localized negative excursion centered at $x=c_H$ |
| Main challenge | Preserving downside and rebound without ringing artifacts |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $b_0$ | Baseline level | 1 |
| $m$ | Linear trend coefficient | 0.10 |
| $A_B$ | Background oscillation amplitude | 0.025 |
| $f_B$ | Background oscillation frequency | 3 |
| $A_C$ | Crash magnitude | 0.62 |
| $c_C$ | Crash location | 0.535 |
| $w_C$ | Crash transition width | 0.004 |
| $A_R$ | Rapid rebound magnitude | 0.44 |
| $c_R$ | Rebound location | 0.585 |
| $w_R$ | Rebound transition width | 0.009 |
| $A_H$ | Aftershock magnitude | 0.13 |
| $c_H$ | Aftershock center | 0.665 |
| $w_H$ | Aftershock width | 0.015 |
| $A_N$ | Slow-normalization magnitude | 0.16 |
| $\alpha_N$ | Slow-normalization rate | 4.5 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF090_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF090_python.md)



## Recommended Uses

- Abrupt-break denoising
- Asymmetric-recovery preservation
- Ringing-artifact assessment

## Provenance

**Status:** Flash-crash-morphology-inspired deterministic financial surrogate.

---

[← Previous: AdstockCampaign](TF089_AdstockCampaign.md) | [Category 6 Catalog](index.md) | [Next: InventoryStockout →](TF091_InventoryStockout.md)
