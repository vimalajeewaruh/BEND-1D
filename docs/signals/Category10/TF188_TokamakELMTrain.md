# TokamakELMTrain


## Overview

A sequence of slow ramp-and-crash cycles carries unequal narrow precursor or edge-localized events, mixing gradual buildup, resets, and localized peaks.

## Mathematical Definition

Let $q(x)=6.4x+0.07\sin(2\pi x)$ and
$r(x)=q(x)-\lfloor q(x)\rfloor$. With $G(x;c,w)=e^{-((x-c)/w)^2/2}$,
$$
f(x)=0.12+0.78r(x)[1+0.10\sin(2\pi1.1x)]
+\sum_{k=1}^{6}a_kG(x;c_k,0.006),
$$
where the centers and unequal amplitudes are listed in the code.

[TokamakELMTrain signal](../../assets/images/TF188_TokamakELMTrain.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Fusion plasma |
| Structure | Modulated fractional-part ramp with six Gaussian events |
| Regularity | Piecewise ramps with repeated resets |
| Main challenge | Treat ramps, discontinuities, and narrow peaks simultaneously |

## Parameters

| Parameter | Value |
|---|---|
| Nominal cycles | $6.4$ |
| Event centers | $0.156,0.312,0.468,0.625,0.782,0.937$ |
| Event width | $0.006$ |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF188_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF188_python.md)



## Recommended Uses

- Ramp-and-crash denoising
- Narrow-event preservation
- Mixed regularity evaluation

## Provenance

This is a deterministic benchmark surrogate inspired by fusion plasma measurement morphology. It is not a calibrated physical or clinical simulator.

[← Previous: JosephsonPhaseSlips](TF187_JosephsonPhaseSlips.md) · [Category 10 catalog](index.md) · [Next: SolitonCollision →](TF189_SolitonCollision.md)

