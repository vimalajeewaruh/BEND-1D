# MarketFlashCrash


## Overview

The **MarketFlashCrash** signal combines gradual price-like movement, an abrupt loss, rapid partial rebound, a smaller aftershock, and slow normalization.

## Mathematical Definition

Let $s(x;c,w)=[1+e^{-(x-c)/w}]^{-1}$ and $g(x;c,w)=e^{-((x-c)/w)^2/2}$. Then

$$
\begin{aligned}
f(x)={}&1+0.10x+0.025\sin(6\pi x)-0.62s(x;0.535,0.004)\\
&+0.44s(x;0.585,0.009)-0.13g(x;0.665,0.015)\\
&+0.16I(x\ge0.585)[1-e^{-4.5(x-0.585)}].
\end{aligned}
$$

[MarketFlashCrash signal](../../assets/images/TF090_MarketFlashCrash.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Abrupt crash and asymmetric recovery |
| Crash | Near $x=0.535$ |
| Recovery | Partial rebound near 0.585 plus slow normalization |
| Main challenge | Preserving downside and rebound without ringing artifacts |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $-0.62$ | Crash magnitude | -0.62 |
| $0.44$ | Rapid rebound magnitude | 0.44 |
| $0.665$ | Aftershock center | 0.665 |

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
