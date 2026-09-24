# SleepSpindleKComplex


## Overview

A low-frequency background contains a large biphasic K-complex followed closely by a localized high-frequency spindle.

## Mathematical Definition

With $G(x;c,w)=e^{-((x-c)/w)^2/2}$,
$$
f(x)=0.06\sin(2\pi2.4x)-0.75G(x;0.43,0.035)
+0.48G(x;0.475,0.048)
+0.32G(x;0.66,0.075)\sin\{2\pi37(x-0.66)\}.
$$

[SleepSpindleKComplex signal](../../assets/images/TF202_SleepSpindleKComplex.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Neurophysiology |
| Structure | Slow oscillation, signed Gaussian complex, and wave packet |
| Regularity | Smooth and strongly multiscale |
| Main challenge | Preserve two nearby structures occupying very different scales |

## Parameters

| Parameter | Value |
|---|---|
| K-complex centers | $0.43,0.475$ |
| Spindle center/width | $0.66/0.075$ |
| Spindle frequency | $37$ cycles/unit |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF202_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF202_python.md)



## Recommended Uses

- EEG event denoising
- Wave-packet preservation
- Adjacent multiscale feature recovery

## Provenance

This is a deterministic benchmark surrogate inspired by neurophysiology measurement morphology. It is not a calibrated physical or clinical simulator.

[← Previous: CGMMealStack](TF201_CGMMealStack.md) · [Category 10 catalog](index.md) · [Next: PupilLightReflex →](TF203_PupilLightReflex.md)

