# WellLog

## Overview

The **WellLog** signal contains several instrument-smoothed stratigraphic level changes, slow within-layer variation, and a narrow thin-bed anomaly. The thin bed can easily disappear under aggressive smoothing.

## Mathematical Definition

Define the smooth step

```math
S(x;c,w)=\left[1+e^{-(x-c)/w}\right]^{-1}.
```

Define the background and principal strata

```math
B(x)=b_0+mx+A_B\sin(2\pi f_Bx)
+A_1S(x;c_1,w_1)-A_2S(x;c_2,w_2)
+A_3S(x;c_3,w_3)-A_4S(x;c_4,w_4).
```

Define the thin-bed feature

```math
T(x)=A_T
\left[
S(x;c_{T1},w_T)-S(x;c_{T2},w_T)
\right].
```

Define the restricted within-layer oscillation, for $c_1<x<c_4$, as

```math
O(x)=A_O\sin(2\pi f_Ox),
```

with $O(x)=0$ outside this interval.

The signal is

```math
f(x)=B(x)+T(x)+O(x).
```


[View WellLog signal](../../assets/images/TF070_WellLog.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Instrument-smoothed strata with thin-bed anomaly |
| Major boundaries | $x=c_1,c_2,c_3,c_4$ |
| Thin bed | Approximately $c_{T1}<x<c_{T2}$ |
| Within-layer variation | Slow trend and restricted oscillation |
| Main challenge | Preserving sharp boundaries and a much narrower layer |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $b_0$ | Background level | 0.48 |
| $m$ | Background slope | 0.10 |
| $A_B$ | Background oscillation amplitude | 0.025 |
| $f_B$ | Background oscillation frequency | 3 |
| $A_1,A_2,A_3,A_4$ | Stratum-step magnitudes | 0.30, 0.40, 0.26, 0.20 |
| $c_1,c_2,c_3,c_4$ | Major boundary locations | 0.18, 0.39, 0.64, 0.82 |
| $w_1,w_2,w_3,w_4$ | Major boundary widths | 0.004, 0.005, 0.0045, 0.004 |
| $A_T$ | Thin-bed magnitude | 0.24 |
| $c_{T1},c_{T2}$ | Thin-bed boundaries | 0.515, 0.548 |
| $w_T$ | Thin-bed edge width | 0.0028 |
| $A_O$ | Within-layer oscillation amplitude | 0.020 |
| $f_O$ | Within-layer oscillation frequency | 17 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF070_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF070_python.md)



## Recommended Uses

- Well-log denoising
- Stratigraphic boundary preservation
- Thin-bed resolution
- Smooth-edge and within-layer variation recovery

## Provenance

**Status:** Geophysical-well-log-inspired deterministic measurement surrogate.

---

[← Previous: OceanThermocline](TF069_OceanThermocline.md) | [Category 5 Catalog](index.md)

