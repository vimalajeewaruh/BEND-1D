# SolitonCollision



## Overview

Two smooth localized pulses flank a strongly oscillatory central interaction region, forcing different treatment of adjacent low- and high-frequency structures.

## Mathematical Definition

Define $Q(z)=1/\cosh^2(z)$. Then
$$
f(x)=0.66Q\left(\frac{x-0.40}{0.045}\right)
+0.66Q\left(\frac{x-0.60}{0.045}\right)
+0.82Q\left(\frac{x-0.50}{0.030}\right)
\cos\{58\pi(x-0.50)\}.
$$

[SolitonCollision signal](../../assets/images/TF189_SolitonCollision.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Nonlinear physics |
| Structure | Three localized inverse-cosh-squared components |
| Regularity | Smooth with concentrated central oscillation |
| Main challenge | Preserve the interaction fringes without distorting outer pulses |

## Parameters

| Parameter | Value |
|---|---|
| Outer centers | $0.40,0.60$ |
| Outer width | $0.045$ |
| Collision center/width | $0.50/0.030$ |
| Collision frequency | $29$ cycles/unit |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF189_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF189_python.md)



## Recommended Uses

- Collision-region denoising
- Localized fringe preservation
- Adjacent-scale adaptation

## Provenance

This is a deterministic benchmark surrogate inspired by nonlinear physics measurement morphology. It is not a calibrated physical or clinical simulator.

[← Previous: TokamakELMTrain](TF188_TokamakELMTrain.md) · [Category 10 catalog](index.md) · [Next: CriticalSlowing →](TF190_CriticalSlowing.md)

