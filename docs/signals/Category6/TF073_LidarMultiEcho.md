# LidarMultiEcho

## Overview

The **LidarMultiEcho** signal contains unequal range echoes, including a deliberately close pair, on a weak drifting and broad background.

## Mathematical Definition

Let $G(x;c,w)=e^{-((x-c)/w)^2/2}$, with

$$
c=(0.16,0.34,0.515,0.542,0.73,0.88),
$$
$$
A=(0.30,0.62,1.00,0.72,0.44,0.21),
\quad
w=(0.010,0.014,0.009,0.008,0.017,0.006).
$$

Then

$$
f(x)=0.018+0.012x+0.045G(x;0.64,0.09)+\sum_{k=1}^{6}A_kG(x;c_k,w_k).
$$

[LidarMultiEcho signal](../../assets/images/TF073_LidarMultiEcho.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Unequal narrow echoes with close pair |
| Close echoes | 0.515 and 0.542 |
| Weakest echo | Centered at 0.88 |
| Main challenge | Preventing merger of nearby targets |

## Parameters

| Parameter | Meaning | Default |
|---|---|---|
| $c$ | Echo centers | As listed |
| $A$ | Echo amplitudes | As listed |
| $w$ | Echo widths | As listed |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF073_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF073_python.md)



## Recommended Uses

- Lidar echo denoising
- Close-target resolution
- Weak-reflector preservation

## Provenance

**Status:** Multi-echo-lidar-inspired deterministic sensing surrogate.

---

[← Previous: GearboxDefect](TF072_GearboxDefect.md) | [Category 6 Catalog](index.md) | [Next: RadarMicroDoppler →](TF074_RadarMicroDoppler.md)

