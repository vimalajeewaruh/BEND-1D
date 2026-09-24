# IntradayVolatilityU


## Overview

A deterministic U-shaped volatility profile has elevated endpoint microstructure oscillation and four isolated event spikes.

## Mathematical Definition

With $G(x;c,w)=e^{-((x-c)/w)^2/2}$,
$$
f(x)=0.16+2.2(x-0.5)^2
+0.025[1+2.5|x-0.5|]\sin(90\pi x)
+\sum_{k=1}^{4}a_kG(x;c_k,w_k),
$$
where the event parameters are given below.

[IntradayVolatilityU signal](../../assets/images/TF223_IntradayVolatilityU.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Finance |
| Structure | Quadratic envelope plus endpoint-weighted ripple and Gaussians |
| Regularity | Smooth with narrow localized events |
| Main challenge | Recover both the broad U shape and fine endpoint structure |

## Parameters

| Parameter | Value |
|---|---|
| U-shape coefficient | $2.2$ |
| Ripple frequency | $45$ cycles/unit |
| Event centers | $0.08,0.32,0.71,0.93$ |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF223_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF223_python.md)




## Recommended Uses

- Envelope-plus-event denoising
- Endpoint microstructure preservation
- Volatility-profile smoothing

## Provenance

This is a deterministic benchmark surrogate inspired by finance measurement morphology. It is not a calibrated physical or financial simulator.

[← Previous: BubbleLogPeriodic](TF222_BubbleLogPeriodic.md) · [Category 10 catalog](index.md) · [Next: LiquidityDrought →](TF224_LiquidityDrought.md)

