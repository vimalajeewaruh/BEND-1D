# MicrofluidicDropletTrain


## Overview

The **MicrofluidicDropletTrain** signal contains nine droplet-like pulses with unequal amplitudes and widths, including a close doublet, one broad coalesced event, and one very weak droplet.

## Mathematical Definition

Let $g(x;c,w)=e^{-((x-c)/w)^2/2}$. Then

$$
f(x)=0.03+\sum_{k=1}^{9}a_k g(x;c_k,w_k),
$$

where

$$
c=(0.10,0.20,0.30,0.405,0.435,0.58,0.70,0.82,0.92),
$$

$$
a=(0.45,0.50,0.47,0.44,0.39,0.76,0.12,0.49,0.46),
$$

$$
w=(0.015,0.014,0.016,0.013,0.013,0.030,0.012,0.015,0.014).
$$

[MicrofluidicDropletTrain signal](../../assets/images/TF138_MicrofluidicDropletTrain.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Unequal pulse train with doublet and coalescence |
| Close doublet | Centers at 0.405 and 0.435 |
| Weak droplet | Amplitude 0.12 at $x=0.70$ |
| Main challenge | Accurate event counting across unequal scales |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $c_k$ | Droplet centers | As above |
| $a_k$ | Droplet amplitudes | As above |
| $w_k$ | Droplet widths | As above |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF0138_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF0138_python.md)


## Recommended Uses

- Microfluidic-sensor denoising
- Droplet counting
- Doublet and weak-event resolution

## Provenance

**Status:** Microfluidic-droplet-sensing-inspired deterministic surrogate.

---

[← Previous: SatelliteReactionWheel](TF137_SatelliteReactionWheel.md) | [Category 8 Catalog](index.md) | [Next: TerahertzLayerEcho →](TF139_TerahertzLayerEcho.md)
