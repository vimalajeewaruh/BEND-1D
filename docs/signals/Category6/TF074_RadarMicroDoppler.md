# RadarMicroDoppler

## Overview

The **RadarMicroDoppler** signal combines changing instantaneous frequency, slow phase modulation, a broad amplitude envelope, and a higher-frequency side component.

## Mathematical Definition

$$
\phi(x)=2\pi[12x+24x^2+0.50\sin(6\pi x)],
$$
$$
E(x)=0.32+0.68e^{-\frac12((x-0.58)/0.30)^2},
$$
$$
f(x)=E(x)\sin\phi(x)+0.16\sin\{2\pi[62x+3\sin(4\pi x)]\}.
$$

[RadarMicroDoppler signal](../../assets/images/TF074_RadarMicroDoppler.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Chirp with micro-Doppler phase modulation |
| Envelope center | 0.58 |
| Side component | Nominal frequency 62 |
| Main challenge | Preserving local phase and frequency structure |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $24$ | Quadratic phase coefficient | 24 |
| $0.50$ | Slow modulation magnitude | 0.50 |
| $0.16$ | Side-component amplitude | 0.16 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF074_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF074_python.md)



## Recommended Uses

- Micro-Doppler denoising
- Time-varying frequency preservation
- Phase-modulation recovery

## Provenance

**Status:** Radar-micro-Doppler-inspired deterministic sensing surrogate.

---

[← Previous: LidarMultiEcho](TF073_LidarMultiEcho.md) | [Category 6 Catalog](index.md) | [Next: MeltPoolInstability →](TF075_MeltPoolInstability.md)

