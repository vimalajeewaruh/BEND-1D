# StellarTransitFlare

## Overview

The **StellarTransitFlare** signal contains weak periodic stellar variability, a localized transit-like decrease in brightness, and a rapidly rising but more slowly decaying flare. The transit and flare have opposite signs and different time scales.

## Mathematical Definition

Define the stellar background component

```math
B(x)=b_0+A_1\sin(\omega_1x)+A_2\sin(\omega_2x+\delta).
```

Define the transit component

```math
T(x)=-A_T\exp\left[
-\left(\frac{x-\mu_T}{s_T}\right)^p
\right].
```

With

```math
u=(x-x_F)_+,
```

define the flare component

```math
F(x)=A_F I(x\geq x_F)
\left(1-e^{-\alpha u}\right)e^{-\beta u}.
```

The signal is

```math
f(x)=B(x)+T(x)+F(x).
```


[View StellarTransitFlare signal](../../assets/images/TF052_StellarTransitFlare.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Periodic baseline with opposite-sign events |
| Transit center | $x=\mu_T$ |
| Flare onset | $x=x_F$ |
| Flare shape | Rapid rise and slower decay |
| Main challenge | Preserving weak variability, transit, and flare simultaneously |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $b_0$ | Baseline brightness level | 1 |
| $A_1,A_2$ | Background oscillation amplitudes | 0.018, 0.008 |
| $\omega_1,\omega_2$ | Background angular frequencies | $6\pi,22\pi$ |
| $\delta$ | Background phase shift | 0.4 |
| $A_T$ | Transit depth | 0.080 |
| $\mu_T$ | Transit center | 0.39 |
| $s_T$ | Transit width | 0.037 |
| $p$ | Transit shape exponent | 8 |
| $A_F$ | Flare amplitude | 0.19 |
| $x_F$ | Flare onset | 0.69 |
| $\alpha$ | Flare rise rate | 150 |
| $\beta$ | Flare decay rate | 18 |

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

