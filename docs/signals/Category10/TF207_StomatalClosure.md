# StomatalClosure


## Overview

A delayed sharp closure response is followed by slower incomplete reopening and a weak overshoot-like depression.

## Mathematical Definition

With
$L(x;c,w)=[1+e^{-(x-c)/w}]^{-1}$ and
$G(x;c,w)=e^{-((x-c)/w)^2/2}$,
$$
f(x)=1-0.62L(x;0.39,0.020)
+0.30L(x;0.79,0.055)-0.06G(x;0.50,0.055).
$$

[StomatalClosure signal](../../assets/images/TF207_StomatalClosure.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Plant physiology |
| Structure | Opposing logistic transitions plus Gaussian depression |
| Regularity | Smooth but strongly asymmetric |
| Main challenge | Preserve threshold timing, overshoot, and incomplete recovery |

## Parameters

| Parameter | Value |
|---|---|
| Closure center/width | $0.39/0.020$ |
| Reopening center/width | $0.79/0.055$ |
| Depression center/width | $0.50/0.055$ |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF207_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF207_python.md)



## Recommended Uses

- Threshold-response recovery
- Asymmetric transition smoothing
- Weak overshoot preservation

## Provenance

This is a deterministic benchmark surrogate inspired by plant physiology measurement morphology. It is not a calibrated physical or clinical simulator.

[← Previous: OJIPFluorescence](TF206_OJIPFluorescence.md) · [Category 10 catalog](index.md) · [Next: SapFlowLag →](TF208_SapFlowLag.md)

