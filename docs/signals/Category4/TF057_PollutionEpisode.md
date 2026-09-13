# PollutionEpisode


## Overview

The **PollutionEpisode** signal contains a repeating diurnal cycle and two short high-concentration episodes with different durations and magnitudes. It represents regular daily activity occasionally dominated by meteorological or emission events.

## Mathematical Definition

Define the diurnal background

$$
D(x)=0.36+0.11\sin(14\pi x-0.5)+0.04\sin(28\pi x+0.2),
$$

and the two episodes

$$
E_1(x)=0.62\exp\!\left[-\frac12\left(\frac{x-0.38}{0.030}\right)^2\right],
$$

$$
E_2(x)=0.42\exp\!\left[-\frac12\left(\frac{x-0.73}{0.055}\right)^2\right].
$$

The signal is

$$
f(x)=D(x)+E_1(x)+E_2(x).
$$

[PollutionEpisode signal](../../assets/images/TF057_PollutionEpisode.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Periodic background with unequal transient episodes |
| Diurnal frequency | 7 plus a second harmonic |
| Episode centers | $x=0.38$ and $x=0.73$ |
| Episode widths | 0.030 and 0.055 |
| Main challenge | Preserving short episodes without distorting periodic background |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $0.62$ | First episode magnitude | 0.62 |
| $0.42$ | Second episode magnitude | 0.42 |
| $7$ | Diurnal frequency | 7 |


## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF057_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF057_python.md)



## Recommended Uses

- Environmental-monitoring denoising
- High-concentration episode detection
- Diurnal-pattern preservation
- Unequal transient-event recovery

## Provenance

**Status:** Pollution-monitoring-inspired deterministic environmental surrogate.

---

[← Previous: EpidemicSeasonal](TF056_EpidemicSeasonal.md) | [Category 4 Catalog](index.md) | [Next: Chromatogram →](TF058_Chromatogram.md)

