# PollutionEpisode


## Overview

The **PollutionEpisode** signal contains a repeating diurnal cycle and two short high-concentration episodes with different durations and magnitudes. It represents regular daily activity occasionally dominated by meteorological or emission events.

## Mathematical Definition

Define the diurnal background component

```math
D(x)=b_0+A_1\sin(2\pi f_Dx+\delta_1)
+A_2\sin(4\pi f_Dx+\delta_2).
```

Define the first pollution episode

```math
E_1(x)=A_{E1}\exp\left[
-\frac12\left(\frac{x-\mu_1}{s_1}\right)^2
\right].
```

Define the second pollution episode

```math
E_2(x)=A_{E2}\exp\left[
-\frac12\left(\frac{x-\mu_2}{s_2}\right)^2
\right].
```

The signal is

```math
f(x)=D(x)+E_1(x)+E_2(x).
```

[View PollutionEpisode signal](../../assets/images/TF057_PollutionEpisode.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Periodic background with unequal transient episodes |
| Diurnal frequency | $f_D$ plus a second harmonic |
| Episode centers | $x=\mu_1$ and $x=\mu_2$ |
| Episode widths | $s_1$ and $s_2$ |
| Main challenge | Preserving short episodes without distorting periodic background |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $b_0$ | Background level | 0.36 |
| $A_1$ | Primary background amplitude | 0.11 |
| $A_2$ | Second-harmonic amplitude | 0.04 |
| $f_D$ | Diurnal frequency | 7 |
| $\delta_1$ | Primary phase shift | -0.5 |
| $\delta_2$ | Second-harmonic phase shift | 0.2 |
| $A_{E1}$ | First episode magnitude | 0.62 |
| $\mu_1$ | First episode center | 0.38 |
| $s_1$ | First episode width | 0.030 |
| $A_{E2}$ | Second episode magnitude | 0.42 |
| $\mu_2$ | Second episode center | 0.73 |
| $s_2$ | Second episode width | 0.055 |

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

