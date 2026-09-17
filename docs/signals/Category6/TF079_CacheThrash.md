# CacheThrash

## Overview

The **CacheThrash** signal has a stable workload outside a finite central interval and rapid nonlinear switching with weaker oscillation inside it.

## Mathematical Definition

Let $s(x;c,w)=[1+e^{-(x-c)/w}]^{-1}$ and $W(x)=s(x;0.34,0.005)-s(x;0.73,0.005)$. The signal is

$$
f(x)=0.28+0.035\sin(8\pi x)+0.24W(x)\tanh[5\sin(44\pi x)]+0.08W(x)\sin(14\pi x).
$$

[CacheThrash signal](../../assets/images/TF079_CacheThrash.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Finite switching regime |
| Thrashing window | Approximately 0.34–0.73 |
| Internal structure | Rapid high/low switching plus weak oscillation |
| Main challenge | Locating regime boundaries while preserving fast internal behavior |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $0.34,0.73$ | Thrashing-window boundaries | As shown |
| $44\pi$ | Switching angular scale | As shown |
| $0.24$ | Switching amplitude | 0.24 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF079_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF079_python.md)



## Recommended Uses

- Regime-switching denoising
- Cache-thrashing detection
- Fast-state preservation

## Provenance

**Status:** Computer-architecture-inspired deterministic surrogate.

---

[← Previous: LatencyIncident](TF078_LatencyIncident.md) | [Category 6 Catalog](index.md) | [Next: TrainingLossSchedule →](TF080_TrainingLossSchedule.md)
