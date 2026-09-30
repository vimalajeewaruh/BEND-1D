# InventoryStockout


## Overview

The **InventoryStockout** signal follows a smooth increasing trajectory, enters a low nearly flat stockout interval, then jumps at replenishment and gradually returns toward ordinary behavior.

## Mathematical Definition

Define the smooth step

```math
s(x;c,w)=\left[1+e^{-(x-c)/w}\right]^{-1}.
```

Define the finite stockout window

```math
W(x)=s(x;c_1,w_W)-s(x;c_2,w_W).
```

Define the normal inventory-demand trend

```math
b(x)=b_0+mx+A_B\sin(2\pi f_Bx).
```

Define the stockout plateau

```math
q(x)=q_0+A_Q\sin(2\pi f_Qx).
```

The windowed transition between the normal trend and the stockout plateau is

```math
P(x)=b(x)[1-W(x)]+q(x)W(x).
```

Define the replenishment effect

```math
R(x)=A_Rs(x;c_2,w_R).
```

Define the later post-stockout adjustment

```math
A(x)=-A_As(x;c_A,w_A).
```

The signal is

```math
f(x)=P(x)+R(x)+A(x).
```

[View InventoryStockout signal](../../assets/images/TF091_InventoryStockout.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Trend interrupted by finite plateau |
| Stockout interval | Approximately $c_1<x<c_2$ |
| Stockout behavior | Low plateau with weak internal oscillation |
| Replenishment | Sharp upward transition near $x=c_2$ |
| Later adjustment | Gradual downward adjustment near $x=c_A$ |
| Main challenge | Preserving plateau boundaries and post-stockout adjustment |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $b_0$ | Normal-trend baseline | 0.26 |
| $m$ | Normal-trend slope | 0.34 |
| $A_B$ | Normal-trend oscillation amplitude | 0.035 |
| $f_B$ | Normal-trend oscillation frequency | 4 |
| $c_1,c_2$ | Stockout boundaries | 0.42, 0.61 |
| $w_W$ | Stockout-boundary transition width | 0.006 |
| $q_0$ | Stockout plateau level | 0.18 |
| $A_Q$ | Stockout oscillation amplitude | 0.010 |
| $f_Q$ | Stockout oscillation frequency | 13 |
| $A_R$ | Replenishment jump magnitude | 0.20 |
| $w_R$ | Replenishment transition width | 0.005 |
| $A_A$ | Later adjustment magnitude | 0.13 |
| $c_A$ | Later adjustment location | 0.72 |
| $w_A$ | Later adjustment transition width | 0.040 |

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
