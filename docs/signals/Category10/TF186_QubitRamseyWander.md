# QubitRamseyWander


## Overview

A Ramsey-like fringe has slow phase wander, decreasing visibility, and a localized collapse and recovery of contrast.

## Mathematical Definition

Let $G(x;c,w)=e^{-((x-c)/w)^2/2}$. Then
$$
V(x)=(0.92-0.35x)[1-0.78G(x;0.56,0.055)],
$$
$$
\phi(x)=2\pi(8x+2.8x^2)+0.55\sin(2\pi1.4x),
\qquad f(x)=V(x)\cos\{\phi(x)\}.
$$


[QubitRamseyWander signal](../../assets/images/TF186_QubitRamseyWander.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Quantum sensing |
| Structure | Phase-modulated fringe with a Gaussian visibility dip |
| Regularity | Smooth oscillation with locally weak amplitude |
| Main challenge | Preserve weak fringes inside the low-visibility region |

## Parameters

| Parameter | Value |
|---|---|
| Visibility-dip center | $0.56$ |
| Visibility-dip width | $0.055$ |
| Visibility-dip depth | $0.78$ |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF186_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF186_python.md)



## Recommended Uses

- Weak-fringe preservation
- Phase-drift recovery
- Spatially varying SNR tests

## Provenance

This is a deterministic benchmark surrogate inspired by quantum sensing measurement morphology. It is not a calibrated physical or clinical simulator.

[← Previous: XrayQPODrift](TF185_XrayQPODrift.md) · [Category 10 catalog](index.md) · [Next: JosephsonPhaseSlips →](TF187_JosephsonPhaseSlips.md)

