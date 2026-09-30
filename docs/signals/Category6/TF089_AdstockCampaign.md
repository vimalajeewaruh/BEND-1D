# AdstockCampaign

## Overview

The **AdstockCampaign** signal sums five unequal campaign impulses with different exponential carry-over rates, producing overlapping responses and shoulders on a weak baseline.

## Mathematical Definition

Define the background component

```math
B(x)=b_0+mx+A_B\sin(2\pi f_Bx).
```

For campaign $k$, define the elapsed time since campaign onset as

```math
u_k=(x-c_k)_+.
```

For $x\geq c_k$, define the campaign carry-over response as

```math
R_k(x)=a_ke^{-r_ku_k},
```

with $R_k(x)=0$ for $x<c_k$.

The signal is

```math
f(x)=B(x)+\sum_{k=1}^{K}R_k(x).
```

The campaign times, initial effects, and decay rates are

```math
\mathbf{c}=(0.12,\,0.29,\,0.47,\,0.66,\,0.81),
```

```math
\mathbf{a}=(0.32,\,0.26,\,0.42,\,0.30,\,0.22),
```

```math
\mathbf{r}=(7,\,9,\,6,\,8.5,\,10).
```

[View AdstockCampaign signal](../../assets/images/TF089_AdstockCampaign.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Overlapping causal impulse responses |
| Events | $K$ abrupt campaign onsets at $\mathbf{c}$ |
| Persistence | Unequal exponential carry-over controlled by $\mathbf{r}$ |
| Background | Linear trend with weak periodic variation |
| Main challenge | Resolving distinct interventions in accumulated smooth response |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $b_0$ | Baseline level | 0.12 |
| $m$ | Linear trend coefficient | 0.025 |
| $A_B$ | Background oscillation amplitude | 0.025 |
| $f_B$ | Background oscillation frequency | 4 |
| $K$ | Number of campaigns | 5 |
| $\mathbf{c}$ | Campaign onset times | As specified |
| $\mathbf{a}$ | Initial campaign effects | As specified |
| $\mathbf{r}$ | Carry-over decay rates | As specified |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF089_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF089_python.md)



## Recommended Uses

- Intervention-response denoising
- Change-onset preservation
- Overlapping-carry-over analysis

## Provenance

**Status:** Advertising-adstock-inspired deterministic surrogate.

---

[← Previous: ProductLaunch](TF088_ProductLaunch.md) | [Category 6 Catalog](index.md) | [Next: MarketFlashCrash →](TF090_MarketFlashCrash.md)
