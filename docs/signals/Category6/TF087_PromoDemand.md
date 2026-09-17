# PromoDemand


## Overview

The **PromoDemand** signal combines secular growth, seasonality, a temporary promotion lift, a sharp stockout depression during the promotion, and decaying post-promotion carry-over.

## Mathematical Definition

Let $s(x;c,w)=[1+e^{-(x-c)/w}]^{-1}$. Then

$$
\begin{aligned}
f(x)={}&0.34+0.055x+0.065\sin(10\pi x-0.4)+0.025\sin(20\pi x)\\
&+0.36[s(x;0.34,0.010)-s(x;0.58,0.016)]\\
&-0.25[s(x;0.48,0.006)-s(x;0.535,0.006)]\\
&+0.15I(x\ge0.58)e^{-8(x-0.58)}.
\end{aligned}
$$

[PromoDemand signal](../../assets/images/TF087_PromoDemand.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Seasonal trend with nested intervention effects |
| Promotion | Approximately 0.34–0.58 |
| Stockout | Approximately 0.48–0.535 |
| Main challenge | Separating trend, seasonality, promotion, and operational disruption |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $0.36$ | Promotion lift | 0.36 |
| $-0.25$ | Stockout effect | -0.25 |
| $8$ | Carry-over decay rate | 8 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF087_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF087_python.md)



## Recommended Uses

- Demand-series denoising
- Promotion-effect preservation
- Nested stockout detection

## Provenance

**Status:** Retail-demand-inspired deterministic surrogate.

---

[← Previous: QuasarFlare](TF086_QuasarFlare.md) | [Category 6 Catalog](index.md) | [Next: ProductLaunch →](TF088_ProductLaunch.md)
