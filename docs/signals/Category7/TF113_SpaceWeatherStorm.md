# SpaceWeatherStorm


## Overview

The **SpaceWeatherStorm** signal has a quiet periodic background, sudden commencement, deep storm depression, three substorm-like excursions, and prolonged recovery.

## Mathematical Definition

Let $S(x;c,w)=[1+e^{-(x-c)/w}]^{-1}$ and $g(x;c,w)=e^{-((x-c)/w)^2/2}$. Then

$$
\begin{aligned}
f(x)={}&0.10+0.025\sin(6\pi x)+0.20S(x;0.30,0.006)-0.75S(x;0.38,0.018)\\
&+0.55I(x\ge0.47)[1-e^{-3.5(x-0.47)}]\\
&-0.10\sum_{c\in\{0.52,0.61,0.69\}}g(x;c,0.012).
\end{aligned}
$$

[SpaceWeatherStorm signal](../../assets/images/TF113_SpaceWeatherStorm.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Sudden change, deep depression, excursions, and recovery |
| Commencement | Positive change near 0.30 |
| Storm onset | Broad negative transition near 0.38 |
| Main challenge | Preserving substorm features throughout a long recovery |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $0.20$ | Commencement magnitude | 0.20 |
| $-0.75$ | Storm-depression magnitude | -0.75 |
| $3.5$ | Recovery rate | 3.5 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF113_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF113_python.md)



## Recommended Uses

- Space-weather time-series denoising
- Storm-onset and recovery preservation
- Weak-substorm detection

## Provenance

**Status:** Geomagnetic-storm-inspired deterministic space-weather surrogate.

---

[← Previous: CryogenicPulse](TF112_CryogenicPulse.md) | [Category 7 Catalog](index.md) | [Next: GNSSMultipathSlip →](TF114_GNSSMultipathSlip.md)
