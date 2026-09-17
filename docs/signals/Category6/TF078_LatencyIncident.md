# LatencyIncident


## Overview

The **LatencyIncident** signal begins with stable latency, develops a gradual congestion elevation, produces five heterogeneous spikes, and recovers noninstantaneously.

## Mathematical Definition

Let $s(x;c,w)=[1+e^{-(x-c)/w}]^{-1}$ and $g(x;c,w)=e^{-((x-c)/w)^2/2}$. Then

$$
\begin{aligned}
f(x)={}&0.16+0.025\sin(6\pi x)+0.33[s(x;0.36,0.050)-s(x;0.63,0.020)]\\
&+\sum_{k=1}^{5}a_k g(x;c_k,w_k)+0.22I(x\ge0.63)e^{-10(x-0.63)},
\end{aligned}
$$

where $c=(0.50,0.535,0.56,0.585,0.615)$, $a=(0.22,0.42,0.30,0.55,0.26)$, and $w=(0.008,0.006,0.007,0.005,0.008)$.

[LatencyIncident signal](../../assets/images/TF078_LatencyIncident.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Level elevation, spike cluster, and recovery |
| Incident onset | Gradual, near $x=0.36$ |
| Spike region | $0.50$–$0.615$ |
| Main challenge | Preserving heterogeneous spikes without roughening the baseline |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $0.33$ | Congestion-ramp amplitude | 0.33 |
| $10$ | Recovery rate | 10 |
| $c_k,a_k,w_k$ | Spike parameters | As above |

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
