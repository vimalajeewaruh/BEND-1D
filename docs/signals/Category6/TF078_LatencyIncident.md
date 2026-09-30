# LatencyIncident


## Overview

The **LatencyIncident** signal begins with stable latency, develops a gradual congestion elevation, produces five heterogeneous spikes, and recovers noninstantaneously.

## Mathematical Definition

Define the smooth step

```math
s(x;c,w)=\left[1+e^{-(x-c)/w}\right]^{-1},
```

and the Gaussian spike

```math
g(x;c,w)=
\exp\left[
-\frac12\left(\frac{x-c}{w}\right)^2
\right].
```

Define the background component

```math
B(x)=b_0+A_B\sin(2\pi f_Bx).
```

Define the incident-level elevation

```math
L(x)=A_L
\left[
s(x;c_1,w_1)-s(x;c_2,w_2)
\right].
```

Define the spike-cluster component

```math
G(x)=\sum_{k=1}^{K}a_k g(x;c_k,w_k).
```

Define the recovery component, for $x\geq c_2$, as

```math
R(x)=A_Re^{-\alpha_R(x-c_2)},
```

with $R(x)=0$ for $x<c_2$.

The signal is

```math
f(x)=B(x)+L(x)+G(x)+R(x).
```

The spike centers, amplitudes, and widths are

```math
\mathbf{c}=(0.50,\,0.535,\,0.56,\,0.585,\,0.615),
```

```math
\mathbf{a}=(0.22,\,0.42,\,0.30,\,0.55,\,0.26),
```

```math
\mathbf{w}=(0.008,\,0.006,\,0.007,\,0.005,\,0.008).
```

[View LatencyIncident signal](../../assets/images/TF078_LatencyIncident.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Level elevation, spike cluster, and recovery |
| Incident onset | Gradual, near $x=c_1$ |
| Spike region | Approximately $0.50<x<0.615$ |
| Recovery onset | Near $x=c_2$ |
| Main challenge | Preserving heterogeneous spikes without roughening the baseline |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $b_0$ | Background level | 0.16 |
| $A_B$ | Background oscillation amplitude | 0.025 |
| $f_B$ | Background oscillation frequency | 3 |
| $A_L$ | Incident-level elevation magnitude | 0.33 |
| $c_1$ | Incident onset location | 0.36 |
| $w_1$ | Incident-onset transition width | 0.050 |
| $c_2$ | Recovery onset location | 0.63 |
| $w_2$ | Incident-end transition width | 0.020 |
| $K$ | Number of spikes | 5 |
| $\mathbf{c}$ | Spike centers | As specified |
| $\mathbf{a}$ | Spike amplitudes | As specified |
| $\mathbf{w}$ | Spike widths | As specified |
| $A_R$ | Recovery amplitude | 0.22 |
| $\alpha_R$ | Recovery decay rate | 10 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF078_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF078_python.md)



## Recommended Uses

- Cloud-latency denoising
- Incident localization
- Spike-cluster preservation

## Provenance

**Status:** Cloud-telemetry-inspired deterministic surrogate.

---

[← Previous: NetworkTrafficBursts](TF077_NetworkTrafficBursts.md) | [Category 6 Catalog](index.md) | [Next: CacheThrash →](TF079_CacheThrash.md)
