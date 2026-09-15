# NetworkTrafficBursts

## Overview

The **NetworkTrafficBursts** signal combines a slowly varying baseline, two broad high-load windows, and seven shorter bursts nested within those windows.

## Mathematical Definition

With $s(x;c,w)=[1+e^{-(x-c)/w}]^{-1}$ and $g(x;c,w)=e^{-((x-c)/w)^2/2}$,

$$
\begin{aligned}
f(x)={}&0.25+0.08\sin(4\pi x)+0.045x\\
&+0.28[s(x;0.20,0.012)-s(x;0.40,0.018)]\\
&+0.34[s(x;0.57,0.015)-s(x;0.83,0.020)]
+\sum_{k=1}^{7}a_k g(x;c_k,w_k),
\end{aligned}
$$

where $c=(0.235,0.275,0.338,0.615,0.658,0.705,0.774)$, $a=(0.18,0.11,0.21,0.16,0.25,0.14,0.22)$, and $w=(0.009,0.006,0.010,0.008,0.011,0.006,0.009)$.

[NetworkTrafficBursts signal](../../assets/images/TF077_NetworkTrafficBursts.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Nested broad and narrow bursts |
| Broad windows | Approximately 0.20–0.40 and 0.57–0.83 |
| Fine structure | Seven unequal Gaussian bursts |
| Main challenge | Retaining short bursts inside longer high-load periods |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $0.28,0.34$ | Broad-window amplitudes | As shown |
| $c_k,a_k,w_k$ | Short-burst parameters | As above |

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
