# SecurityBeacon


## Overview

The **SecurityBeacon** signal combines four irregular traffic bursts with a weak 18-cycle periodic component and slower background variation.

## Mathematical Definition

Let $g(x;c,w)=e^{-((x-c)/w)^2/2}$. Then

$$
f(x)=0.20+0.05\sin(4\pi x)+0.18\sum_{c\in\{0.18,0.42,0.67,0.83\}}g(x;c,0.020)+0.045\sin(36\pi x).
$$

[SecurityBeacon signal](../../assets/images/TF117_SecurityBeacon.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Irregular bursts plus weak periodic component |
| Traffic events | Four broad localized bursts |
| Beacon | Low-amplitude 18-cycle oscillation |
| Main challenge | Preserving hidden periodicity within ordinary-looking activity |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $0.18$ | Traffic-burst amplitude | 0.18 |
| $0.020$ | Traffic-burst width | 0.020 |
| $0.045$ | Beacon amplitude | 0.045 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF0117_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF0117_python.md)



## Recommended Uses

- Network-telemetry denoising
- Weak-periodicity recovery
- Beacon-detection benchmarking

## Provenance

**Status:** Cybersecurity-beacon-traffic-inspired deterministic surrogate.

---

[← Previous: SideChannelPower](TF116_SideChannelPower.md) | [Category 7 Catalog](index.md) | [Next: GPUThermalThrottle →](TF118_GPUThermalThrottle.md)
