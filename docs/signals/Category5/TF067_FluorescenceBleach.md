# FluorescenceBleach

## Overview

The **FluorescenceBleach** signal represents photobleaching through fast and slow exponential decay. A weak localized recovery and small later level change represent scientifically meaningful departures from smooth decay.

## Mathematical Definition

Define

$$
B(x)=0.72e^{-3.8x}+0.30e^{-0.62x}+0.035,
$$

$$
R(x)=0.070\exp\!\left[-\frac12\left(\frac{x-0.56}{0.045}\right)^2\right],
$$

and

$$
S(x)=\frac{0.030}{1+e^{-75(x-0.73)}}.
$$

The signal is

$$
f(x)=B(x)+R(x)+S(x).
$$

[FluorescenceBleach signal](../../assets/images/TF067_FluorescenceBleach.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Multirate exponential decay with weak departures |
| Fast decay rate | 3.8 |
| Slow decay rate | 0.62 |
| Recovery center | $x=0.56$ |
| Main challenge | Retaining weak recovery and level change within smooth decay |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $0.045$ | Recovery width | 0.045 |
| $0.73$ | Small-step center | 0.73 |
| $75$ | Small-step sharpness | 75 |

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
