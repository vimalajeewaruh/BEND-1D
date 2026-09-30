# FluorescenceBleach

## Overview

The **FluorescenceBleach** signal represents photobleaching through fast and slow exponential decay. A weak localized recovery and small later level change represent scientifically meaningful departures from smooth decay.

## Mathematical Definition

Define the multirate bleaching component

```math
B(x)=A_1e^{-k_1x}+A_2e^{-k_2x}+b_0.
```

Define the localized recovery component

```math
R(x)=A_R\exp\left[
-\frac12\left(\frac{x-\mu_R}{s_R}\right)^2
\right].
```

Define the small level-shift component

```math
S(x)=A_S\left[1+e^{-k_S(x-x_S)}\right]^{-1}.
```

The signal is

```math
f(x)=B(x)+R(x)+S(x).
```

[View FluorescenceBleach signal](../../assets/images/TF067_FluorescenceBleach.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Multirate exponential decay with weak departures |
| Fast decay rate | $k_1$ |
| Slow decay rate | $k_2$ |
| Recovery center | $x=\mu_R$ |
| Main challenge | Retaining weak recovery and level change within smooth decay |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $A_1$ | Fast-decay amplitude | 0.72 |
| $k_1$ | Fast decay rate | 3.8 |
| $A_2$ | Slow-decay amplitude | 0.30 |
| $k_2$ | Slow decay rate | 0.62 |
| $b_0$ | Baseline level | 0.035 |
| $A_R$ | Recovery amplitude | 0.070 |
| $\mu_R$ | Recovery center | 0.56 |
| $s_R$ | Recovery width | 0.045 |
| $A_S$ | Small-step magnitude | 0.030 |
| $x_S$ | Small-step center | 0.73 |
| $k_S$ | Small-step sharpness | 75 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF067_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF067_python.md)



## Recommended Uses

- Photobleaching-curve denoising
- Multirate decay recovery
- Weak transient preservation
- Small level-change detection

## Provenance

**Status:** Fluorescence-photobleaching-inspired deterministic measurement surrogate.

---

[← Previous: BatteryDischarge](TF066_BatteryDischarge.md) | [Category 5 Catalog](index.md) | [Next: RadioAstronomyLine →](TF068_RadioAstronomyLine.md)
