# PhotoacousticAline


## Overview

The **PhotoacousticAline** signal contains six bipolar absorber responses of unequal amplitude and width. Two responses are deliberately close and deeper responses are attenuated.

## Mathematical Definition

Let $z_k=(x-c_k)/w_k$. Then

$$
f(x)=e^{-0.45x}\sum_{k=1}^{6}a_k(1-z_k^2)e^{-z_k^2/2},
$$

where

$$
c=(0.16,0.33,0.515,0.535,0.72,0.88),
$$

$$
a=(0.35,0.52,0.95,0.70,0.42,0.20),\quad
w=(0.010,0.012,0.008,0.008,0.014,0.010).
$$

[PhotoacousticAline signal](../../assets/images/TF127_PhotoacousticAline.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Unequal bipolar responses with depth attenuation |
| Close pair | Centers at 0.515 and 0.535 |
| Deep response | Weakest absorber at $x=0.88$ |
| Main challenge | Resolving nearby sources without erasing attenuated responses |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $c_k$ | Absorber locations | As above |
| $a_k$ | Response amplitudes | As above |
| $w_k$ | Response widths | As above |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF127_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF127_python.md)



## Recommended Uses

- Photoacoustic A-line denoising
- Bipolar-response resolution
- Depth-attenuated feature preservation

## Provenance

**Status:** Photoacoustic-imaging-inspired deterministic surrogate.

---

[← Previous: DASFiberEvent](TF126_DASFiberEvent.md) | [Category 8 Catalog](index.md) | [Next: OCTRetinalProfile →](TF128_OCTRetinalProfile.md)
