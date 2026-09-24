# PupilLightReflex


## Overview

After a stimulus, the pupil surrogate constricts rapidly and redilates much more slowly, with a small late overshoot.

## Mathematical Definition

Let $u=(x-0.25)_+$. Then
$$
r(x)=I(x\ge0.25)(1-e^{-u/0.014})e^{-u/0.22},
$$
and, with $G(x;c,w)=e^{-((x-c)/w)^2/2}$,
$$
f(x)=1-0.72r(x)+0.10G(x;0.68,0.07).
$$

[PupilLightReflex signal](../../assets/images/TF203_PupilLightReflex.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Biomedical optics |
| Structure | Asymmetric causal response plus Gaussian overshoot |
| Regularity | Smooth with a sharp change in time scale at onset |
| Main challenge | Preserve rapid constriction and slow recovery simultaneously |

## Parameters

| Parameter | Value |
|---|---|
| Stimulus time | $0.25$ |
| Rise/decay scales | $0.014/0.22$ |
| Overshoot center/width | $0.68/0.07$ |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF203_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF203_python.md)



## Recommended Uses

- Asymmetric transient smoothing
- Onset localization
- Weak overshoot preservation

## Provenance

This is a deterministic benchmark surrogate inspired by biomedical optics measurement morphology. It is not a calibrated physical or clinical simulator.

[← Previous: SleepSpindleKComplex](TF202_SleepSpindleKComplex.md) · [Category 10 catalog](index.md) · [Next: CoughFlowBurst →](TF204_CoughFlowBurst.md)

