# OJIPFluorescence


## Overview

Three nested saturation kinetics with well-separated characteristic times create an O–J–I–P-like polyphasic rise, with small local curvature corrections.

## Mathematical Definition

With $G(x;c,w)=e^{-((x-c)/w)^2/2}$,
$$
\begin{aligned}
f(x)={}&0.08+0.28[1-e^{-(x/0.012)^{1.25}}]
+0.25[1-e^{-(x/0.075)^{1.15}}]\\
&+0.38[1-e^{-(x/0.32)^{1.55}}]
+0.035G(x;0.085,0.018)-0.025G(x;0.20,0.032).
\end{aligned}
$$

[OJIPFluorescence signal](../../assets/images/TF206_OJIPFluorescence.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Plant physiology |
| Structure | Sum of stretched-exponential rises plus two weak corrections |
| Regularity | Smooth with several distinct knees |
| Main challenge | Preserve weak intermediate phases without piecewise flattening |

## Parameters

| Parameter | Value |
|---|---|
| Time scales | $0.012,0.075,0.32$ |
| Powers | $1.25,1.15,1.55$ |
| Local corrections | $+0.035$ and $-0.025$ |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF206_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF206_python.md)


## Recommended Uses

- Polyphasic-rise denoising
- Knee preservation
- Multirate kinetic smoothing

## Provenance

This is a deterministic benchmark surrogate inspired by plant physiology measurement morphology. It is not a calibrated physical or clinical simulator.

[← Previous: DesaturationRecovery](TF205_DesaturationRecovery.md) · [Category 10 catalog](index.md) · [Next: StomatalClosure →](TF207_StomatalClosure.md)

