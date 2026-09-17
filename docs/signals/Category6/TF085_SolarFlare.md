# SolarFlare

## Overview

The **SolarFlare** signal includes three weak precursors, an impulsive logistic rise, a two-rate post-peak decay, and a smaller late excursion.

## Mathematical Definition

Let $s(x;c,w)=[1+e^{-(x-c)/w}]^{-1}$ and $g(x;c,w)=e^{-((x-c)/w)^2/2}$. Define

$$
p(x)=0.08g(x;0.30,0.010)+0.12g(x;0.345,0.007)+0.07g(x;0.385,0.006).
$$

The signal is

$$
f(x)=
\begin{cases}
0.08+p(x)+0.90s(x;0.46,0.008)+0.055g(x;0.64,0.018), & x<0.49,\\
0.08+0.58e^{-5.2(x-0.49)}+0.32e^{-18(x-0.49)}+0.055g(x;0.64,0.018), & x\ge0.49.
\end{cases}
$$

[SolarFlare signal](../../assets/images/TF085_SolarFlare.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Precursors, impulsive event, and multirate decay |
| Precursor region | 0.30–0.385 |
| Main event | Rapid rise near 0.46–0.49 |
| Main challenge | Retaining weak precursors next to a dominant flare |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $0.49$ | Post-peak transition time | 0.49 |
| $5.2,18$ | Slow and fast decay rates | As shown |
| $0.64$ | Late-excursion center | 0.64 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF085_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF085_python.md)



## Recommended Uses

- Flare-profile denoising
- Precursor recovery
- Multirate-decay preservation

## Provenance

**Status:** Solar-flare-morphology-inspired deterministic surrogate.

---

[← Previous: MicrolensingPlanet](TF084_MicrolensingPlanet.md) | [Category 6 Catalog](index.md) | [Next: QuasarFlare →](TF086_QuasarFlare.md)
