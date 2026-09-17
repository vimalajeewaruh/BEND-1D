# QuasarFlare


## Overview

The **QuasarFlare** signal places a broad asymmetric flare and two smaller excursions on a slowly wandering astronomical baseline.

## Mathematical Definition

Let $g(x;c,w)=e^{-((x-c)/w)^2/2}$ and

$$
b(x)=0.34+0.055\sin(2\pi\,1.4x+0.2)+0.035\sin(2\pi\,3.3x-0.6)+0.020x.
$$

The asymmetric flare is

$$
q(x)=
\begin{cases}
0.52g(x;0.56,0.060), & x<0.56,\\
0.52e^{-(x-0.56)/0.18}, & x\ge0.56,
\end{cases}
$$

and

$$
f(x)=b(x)+q(x)+0.075g(x;0.20,0.018)+0.055g(x;0.84,0.014).
$$

[QuasarFlare signal](../../assets/images/TF086_QuasarFlare.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Wandering baseline with asymmetric flare |
| Principal flare | Centered near $x=0.56$ |
| Secondary features | Small excursions near 0.20 and 0.84 |
| Main challenge | Preserving transients without distorting low-frequency variability |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $0.060$ | Flare rise width | 0.060 |
| $0.18$ | Flare decay scale | 0.18 |
| $0.52$ | Principal-flare amplitude | 0.52 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF086_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF086_python.md)



## Recommended Uses

- Asymmetric-transient denoising
- Baseline-versus-flare separation
- Weak-excursion recovery

## Provenance

**Status:** Quasar-variability-inspired deterministic surrogate.

---

[← Previous: SolarFlare](TF085_SolarFlare.md) | [Category 6 Catalog](index.md) | [Next: PromoDemand →](TF087_PromoDemand.md)
