# ModeBeatingDecay


## Overview

Two closely spaced damped modes produce a slowly varying beat envelope, while a weaker higher-frequency mode decays more rapidly.

## Mathematical Definition

The signal is
$$
f(x)=e^{-2.4x}\{\sin(30\pi x)+0.93\sin(32.8\pi x+0.15)\}
+0.28e^{-5.8x}\sin(66\pi x+0.6).
$$

[ModeBeatingDecay signal](../../assets/images/TF197_ModeBeatingDecay.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Structural dynamics |
| Structure | Three damped sinusoids with two nearby frequencies |
| Regularity | Smooth oscillation with evolving spectral composition |
| Main challenge | Retain the extended beat pattern and weak third mode |

## Parameters

| Parameter | Value |
|---|---|
| Main frequencies | $15,16.4$ |
| Main decay rate | $2.4$ |
| Third frequency/decay | $33/5.8$ |


## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF197_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF197_python.md)




## Recommended Uses

- Beat-envelope preservation
- Modal decay estimation
- Close-frequency denoising

## Provenance

This is a deterministic benchmark surrogate inspired by structural dynamics measurement morphology. It is not a calibrated physical simulator.

[← Previous: CavitationCollapse](TF196_CavitationCollapse.md) · [Category 10 catalog](index.md) · [Next: ValveChatter →](TF198_ValveChatter.md)

