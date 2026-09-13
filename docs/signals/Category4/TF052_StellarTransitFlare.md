---
layout: default
title: TF052 — StellarTransitFlare
---

# TF052 — StellarTransitFlare

![StellarTransitFlare signal](../../assets/images/TF052_StellarTransitFlare.png)

## Overview

The **StellarTransitFlare** signal contains weak periodic stellar variability, a localized transit-like decrease in brightness, and a rapidly rising but more slowly decaying flare. The transit and flare have opposite signs and different time scales.

## Mathematical Definition

Define the stellar background

$$
B(x)=1+0.018\sin(6\pi x)+0.008\sin(22\pi x+0.4),
$$

the transit

$$
T(x)=-0.080\exp\!\left[-\left(\frac{x-0.39}{0.037}\right)^8\right],
$$

and, with $u=(x-0.69)_+$, the flare

$$
F(x)=0.19\mathbf{1}_{\{x\geq0.69\}}
\left(1-e^{-150u}\right)e^{-18u}.
$$

The signal is

$$
f(x)=B(x)+T(x)+F(x).
$$

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Periodic baseline with opposite-sign events |
| Transit center | $x=0.39$ |
| Flare onset | $x=0.69$ |
| Flare shape | Rapid rise and slower decay |
| Main challenge | Preserving weak variability, transit, and flare simultaneously |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $0.037$ | Transit width | 0.037 |
| $150$ | Flare rise rate | 150 |
| $18$ | Flare decay rate | 18 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF052_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF052_python.md)



## Recommended Uses

- Transit-depth preservation
- Flare detection
- Astronomical time-series denoising
- Opposite-sign multiscale feature recovery

## Provenance

**Status:** Astronomical-photometry-inspired deterministic surrogate.

---

[← Previous: RogueWave](TF051_RogueWave.md) | [Category 4 Catalog](index.md) | [Next: CyclicVoltammetry →](TF053_CyclicVoltammetry.md)

