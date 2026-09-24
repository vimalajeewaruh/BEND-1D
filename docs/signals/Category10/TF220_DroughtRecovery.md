# DroughtRecovery


## Overview

The signal declines slowly and nonlinearly over most of the record, then undergoes a comparatively rapid but incomplete recovery and a small late correction.

## Mathematical Definition

With $L(x;c,w)=[1+e^{-(x-c)/w}]^{-1}$,
$$
f(x)=1-0.62x^{1.35}+0.37L(x;0.78,0.018)
-0.08L(x;0.92,0.03).
$$

[DroughtRecovery signal](../../assets/images/TF220_DroughtRecovery.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Hydroclimate |
| Structure | Power-law decline with two opposing logistic changes |
| Regularity | Smooth with a concentrated recovery threshold |
| Main challenge | Preserve the recovery onset without biasing the long decline |

## Parameters

| Parameter | Value |
|---|---|
| Decline coefficient/power | $0.62/1.35$ |
| Recovery center/width | $0.78/0.018$ |
| Late correction | $-0.08$ at $0.92$ |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF220_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF220_python.md)



## Recommended Uses

- Nonlinear-trend smoothing
- Recovery-threshold detection
- Long-range bias assessment

## Provenance

This is a deterministic benchmark surrogate inspired by hydroclimate measurement morphology. It is not a calibrated physical or environmental simulator.

[← Previous: HeatwaveFrontBreak](TF219_HeatwaveFrontBreak.md) · [Category 10 catalog](index.md) · [Next: ENSOEnvelope →](TF221_ENSOEnvelope.md)

