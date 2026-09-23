# UltrasoundCrackEcho


## Overview

The **UltrasoundCrackEcho** signal begins with transducer ring-down, followed by a small crack echo close to a much larger back-wall reflection and a weaker late reverberation.

## Mathematical Definition

Let $u=(x-0.08)_+$ and $g(x;c,w)=e^{-((x-c)/w)^2/2}$. Then

$$
\begin{aligned}
f(x)={}&0.32I(x\ge0.08)e^{-35u}\sin(2\pi\,68u)\\
&+0.14g(x;0.58,0.008)+0.78g(x;0.62,0.016)+0.16g(x;0.79,0.022).
\end{aligned}
$$

[UltrasoundCrackEcho signal](../../assets/images/TF129_UltrasoundCrackEcho.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Ring-down and unequal nearby echoes |
| Crack echo | Small peak near $x=0.58$ |
| Back-wall reflection | Dominant peak near $x=0.62$ |
| Main challenge | Preserving the small crack echo beside a dominant reflector |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $35$ | Ring-down decay rate | 35 |
| $68$ | Ring-down cycle frequency | 68 |
| $0.14,0.78$ | Crack and back-wall amplitudes | As shown |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF129_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF129_python.md)



## Recommended Uses

- Ultrasonic NDE denoising
- Weak-echo recovery
- Close-reflector resolution

## Provenance

**Status:** Ultrasonic crack-detection-inspired deterministic surrogate.

---

[← Previous: OCTRetinalProfile](TF128_OCTRetinalProfile.md) | [Category 8 Catalog](index.md) | [Next: WearableGaitIMU →](TF130_WearableGaitIMU.md)
