# NetworkTrafficBursts

## Overview

The **NetworkTrafficBursts** signal combines a slowly varying baseline, two broad high-load windows, and seven shorter bursts nested within those windows.

## Mathematical Definition

Define the smooth step

```math
s(x;c,w)=\left[1+e^{-(x-c)/w}\right]^{-1},
```

and the Gaussian burst

```math
g(x;c,w)=
\exp\left[
-\frac12\left(\frac{x-c}{w}\right)^2
\right].
```

Define the background component

```math
B(x)=b_0+A_B\sin(2\pi f_Bx)+mx.
```

Define the two broad high-load windows

```math
W_1(x)=A_{W1}
\left[
s(x;c_{11},w_{11})-s(x;c_{12},w_{12})
\right],
```

```math
W_2(x)=A_{W2}
\left[
s(x;c_{21},w_{21})-s(x;c_{22},w_{22})
\right].
```

Define the short-burst component

```math
G(x)=\sum_{k=1}^{K}a_k g(x;c_k,w_k).
```

The signal is

```math
f(x)=B(x)+W_1(x)+W_2(x)+G(x).
```

The short-burst centers, amplitudes, and widths are

```math
\mathbf{c}=(0.235,\,0.275,\,0.338,\,0.615,\,0.658,\,0.705,\,0.774),
```

```math
\mathbf{a}=(0.18,\,0.11,\,0.21,\,0.16,\,0.25,\,0.14,\,0.22),
```

```math
\mathbf{w}=(0.009,\,0.006,\,0.010,\,0.008,\,0.011,\,0.006,\,0.009).
```

[View NetworkTrafficBursts signal](../../assets/images/TF077_NetworkTrafficBursts.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Nested broad and narrow bursts |
| Broad windows | Approximately $c_{11}<x<c_{12}$ and $c_{21}<x<c_{22}$ |
| Fine structure | $K$ unequal Gaussian bursts |
| Main challenge | Retaining short bursts inside longer high-load periods |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $b_0$ | Background level | 0.25 |
| $A_B$ | Background oscillation amplitude | 0.08 |
| $f_B$ | Background oscillation frequency | 2 |
| $m$ | Background slope | 0.045 |
| $A_{W1},A_{W2}$ | Broad-window amplitudes | 0.28, 0.34 |
| $c_{11},c_{12}$ | First broad-window boundaries | 0.20, 0.40 |
| $w_{11},w_{12}$ | First broad-window transition widths | 0.012, 0.018 |
| $c_{21},c_{22}$ | Second broad-window boundaries | 0.57, 0.83 |
| $w_{21},w_{22}$ | Second broad-window transition widths | 0.015, 0.020 |
| $K$ | Number of short bursts | 7 |
| $\mathbf{c}$ | Short-burst centers | As specified |
| $\mathbf{a}$ | Short-burst amplitudes | As specified |
| $\mathbf{w}$ | Short-burst widths | As specified |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF077_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF077_python.md)



## Recommended Uses

- Multiscale traffic denoising
- Burst detection
- Nested-event preservation

## Provenance

**Status:** Network-telemetry-inspired deterministic surrogate.

---

[← Previous: FiberOTDR](TF076_FiberOTDR.md) | [Category 6 Catalog](index.md) | [Next: LatencyIncident →](TF078_LatencyIncident.md)
