# PromoDemand


## Overview

The **PromoDemand** signal combines secular growth, seasonality, a temporary promotion lift, a sharp stockout depression during the promotion, and decaying post-promotion carry-over.

## Mathematical Definition

Define the smooth step

```math
s(x;c,w)=\left[1+e^{-(x-c)/w}\right]^{-1}.
```

Define the seasonal-trend component

```math
B(x)=
b_0+mx
+A_1\sin(2\pi f_1x+\delta_1)
+A_2\sin(2\pi f_2x).
```

Define the promotion effect

```math
P(x)=
A_P
\left[
s(x;c_{P1},w_{P1})
-
s(x;c_{P2},w_{P2})
\right].
```

Define the nested stockout effect

```math
S(x)=
-A_S
\left[
s(x;c_{S1},w_S)
-
s(x;c_{S2},w_S)
\right].
```

Define the post-promotion carry-over effect, for $x\geq c_{P2}$, as

```math
C(x)=
A_Ce^{-\alpha_C(x-c_{P2})},
```

with $C(x)=0$ for $x<c_{P2}$.

The signal is

```math
f(x)=B(x)+P(x)+S(x)+C(x).
```

[View PromoDemand signal](../../assets/images/TF087_PromoDemand.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Seasonal trend with nested intervention effects |
| Promotion | Approximately $c_{P1}<x<c_{P2}$ |
| Stockout | Approximately $c_{S1}<x<c_{S2}$ |
| Carry-over | Exponential recovery beginning at $x=c_{P2}$ |
| Main challenge | Separating trend, seasonality, promotion, and operational disruption |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $b_0$ | Baseline level | 0.34 |
| $m$ | Linear trend coefficient | 0.055 |
| $A_1,A_2$ | Seasonal amplitudes | 0.065, 0.025 |
| $f_1,f_2$ | Seasonal frequencies | 5, 10 |
| $\delta_1$ | First seasonal phase shift | -0.4 |
| $A_P$ | Promotion lift | 0.36 |
| $c_{P1},c_{P2}$ | Promotion boundaries | 0.34, 0.58 |
| $w_{P1},w_{P2}$ | Promotion transition widths | 0.010, 0.016 |
| $A_S$ | Stockout magnitude | 0.25 |
| $c_{S1},c_{S2}$ | Stockout boundaries | 0.48, 0.535 |
| $w_S$ | Stockout transition width | 0.006 |
| $A_C$ | Carry-over amplitude | 0.15 |
| $\alpha_C$ | Carry-over decay rate | 8 |

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
