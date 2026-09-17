# InventoryStockout


## Overview

The **InventoryStockout** signal follows a smooth increasing trajectory, enters a low nearly flat stockout interval, then jumps at replenishment and gradually returns toward ordinary behavior.

## Mathematical Definition

Let $s(x;c,w)=[1+e^{-(x-c)/w}]^{-1}$ and $W(x)=s(x;0.42,0.006)-s(x;0.61,0.006)$. Define

$$
b(x)=0.26+0.34x+0.035\sin(8\pi x),\qquad q(x)=0.18+0.010\sin(26\pi x).
$$

Then

$$
f(x)=b(x)[1-W(x)]+q(x)W(x)+0.20s(x;0.61,0.005)-0.13s(x;0.72,0.040).
$$

[InventoryStockout signal](../../assets/images/TF091_InventoryStockout.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Trend interrupted by finite plateau |
| Stockout interval | Approximately 0.42–0.61 |
| Replenishment | Sharp upward transition near 0.61 |
| Main challenge | Preserving plateau boundaries and post-stockout adjustment |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $0.42,0.61$ | Stockout boundaries | As shown |
| $0.20$ | Replenishment jump | 0.20 |
| $0.13$ | Later adjustment magnitude | 0.13 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF091_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF091_python.md)



## Recommended Uses

- Plateau and boundary recovery
- Inventory-series denoising
- Replenishment-change preservation

## Provenance

**Status:** Inventory-and-demand-inspired deterministic surrogate.

---

[← Previous: MarketFlashCrash](TF090_MarketFlashCrash.md) | [Category 6 Catalog](index.md) | [Next: PercussiveAttackDecay →](TF092_PercussiveAttackDecay.md)
