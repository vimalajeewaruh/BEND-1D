---
layout: default
title: "TF187 — JosephsonPhaseSlips"
---

# TF187 — JosephsonPhaseSlips

![JosephsonPhaseSlips signal](../../assets/images/TF187_JosephsonPhaseSlips.png)

## Overview

A persistent carrier is interrupted by three abrupt phase slips of different sign and magnitude. The events change phase rather than amplitude.

## Mathematical Definition

Define
$$
\phi(x)=24\pi x+0.75\pi I(x\ge0.28)
-1.05\pi I(x\ge0.53)+0.60\pi I(x\ge0.78).
$$
The signal is
$$
f(x)=0.75\sin\{\phi(x)\}+0.12\sin\{2\phi(x)+0.4\}.
$$

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Superconducting devices |
| Structure | Fundamental and harmonic sharing a discontinuous phase |
| Regularity | Piecewise smooth with phase discontinuities |
| Main challenge | Retain phase slips without damping the carrier |

## Parameters

| Parameter | Value |
|---|---|
| Slip locations | $0.28,0.53,0.78$ |
| Slip sizes | $0.75\pi,-1.05\pi,0.60\pi$ |
| Carrier frequency | $12$ cycles/unit |

## MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N);
phi=2*pi*12*x+0.75*pi*double(x>=0.28) ...
    -1.05*pi*double(x>=0.53)+0.60*pi*double(x>=0.78);
f=0.75*sin(phi)+0.12*sin(2*phi+0.4);
plot(x,f,'LineWidth',1.3); grid on
xlabel('x'); ylabel('f(x)'); title('TF187 — JosephsonPhaseSlips')
~~~

## Python Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024
x=np.linspace(0.0,1.0,N)
phi=2*np.pi*12*x+0.75*np.pi*(x>=0.28)-1.05*np.pi*(x>=0.53)+0.60*np.pi*(x>=0.78)
f=0.75*np.sin(phi)+0.12*np.sin(2*phi+0.4)
plt.plot(x,f); plt.grid(True)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF187 — JosephsonPhaseSlips")
plt.show()
~~~

## Recommended Uses

- Phase-discontinuity recovery
- Carrier-preserving denoising
- Abrupt phase-event localization

## Provenance

This is a deterministic benchmark surrogate inspired by superconducting devices measurement morphology. It is not a calibrated physical or clinical simulator.

[← Previous: QubitRamseyWander](TF186_QubitRamseyWander.md) · [Category 10 catalog](index.md) · [Next: TokamakELMTrain →](TF188_TokamakELMTrain.md)

