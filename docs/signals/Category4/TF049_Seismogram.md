# Seismogram

## Overview

The **Seismogram** signal begins with a quiet baseline. A smaller localized chirped packet represents the P-wave arrival, a later stronger packet represents the S wave, and a decaying multifrequency tail represents the seismic coda.

## Mathematical Definition

Let

$$
w_P(x)=\exp\!\left[-\frac12\left(\frac{x-0.25}{0.028}\right)^2\right],
$$

$$
P(x)=0.42w_P(x)\sin\{2\pi(38x+24x^2)\},
$$

$$
w_S(x)=\exp\!\left[-\frac12\left(\frac{x-0.43}{0.055}\right)^2\right],
$$

$$
S(x)=w_S(x)\left[\sin(48\pi x)+0.28\sin(102\pi x+0.5)\right].
$$

With $u=(x-0.47)_+$, the coda is

$$
C(x)=0.40\mathbf{1}_{\{x\geq0.47\}}e^{-4.8u}
\left[\sin(62\pi u)+0.35\sin(118\pi u+0.6)\right].
$$

Thus

$$
f(x)=0.01\sin(8\pi x)+P(x)+S(x)+C(x).
$$

[Seismogram signal](../../assets/images/TF049_Seismogram.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Multiple arrivals and decaying coda |
| P-wave center | $x=0.25$ |
| S-wave center | $x=0.43$ |
| Coda onset | $x=0.47$ |
| Main challenge | Preserving arrivals across several amplitude and frequency scales |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $0.028$ | P-wave width | 0.028 |
| $0.055$ | S-wave width | 0.055 |
| $4.8$ | Coda decay rate | 4.8 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF049_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF049_python.md)



## Recommended Uses

- Seismic-arrival detection
- Coda preservation
- Localized chirp denoising
- Multiple-amplitude-scale evaluation

## Provenance

**Status:** Seismogram-inspired deterministic measurement surrogate.

---

[← Previous: IceCore](TF048_IceCore.md) | [Category 4 Catalog](index.md) | [Next: VolcanicTremor →](TF050_VolcanicTremor.md)

