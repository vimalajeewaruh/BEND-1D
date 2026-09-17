# AdstockCampaign

## Overview

The **AdstockCampaign** signal sums five unequal campaign impulses with different exponential carry-over rates, producing overlapping responses and shoulders on a weak baseline.

## Mathematical Definition

For campaign times $c_k$, amplitudes $a_k$, and decay rates $r_k$,

$$
f(x)=0.12+0.025x+0.025\sin(8\pi x)+\sum_{k=1}^{5}a_k I(x\ge c_k)e^{-r_k(x-c_k)},
$$

with

$$
c=(0.12,0.29,0.47,0.66,0.81),\quad
a=(0.32,0.26,0.42,0.30,0.22),\quad
r=(7,9,6,8.5,10).
$$

[AdstockCampaign signal](../../assets/images/TF089_AdstockCampaign.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Overlapping causal impulse responses |
| Events | Five abrupt campaign onsets |
| Persistence | Unequal exponential carry-over |
| Main challenge | Resolving distinct interventions in accumulated smooth response |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $c_k$ | Campaign times | As above |
| $a_k$ | Initial effects | As above |
| $r_k$ | Carry-over decay rates | As above |

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
