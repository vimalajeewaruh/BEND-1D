---
layout: default
title: "TF218 — AtmosphericRiver"
---

# TF218 — AtmosphericRiver

![AtmosphericRiver signal](../../assets/images/TF218_AtmosphericRiver.png)

## Overview

A long asymmetric moisture pulse contains two smaller positive frontal peaks and a narrow negative feature on its extended decay.

## Mathematical Definition

Let $u=(x-0.12)_+$ and
$$
h(x)=I(x\ge0.12)(u/0.16)^2e^{2-u/0.16},\qquad
m(x)=h(x)/\max_i h(x_i).
$$
With $G(x;c,w)=e^{-((x-c)/w)^2/2}$,
$$
f(x)=0.12+0.82m(x)+0.16G(x;0.43,0.025)
+0.12G(x;0.58,0.032)-0.07G(x;0.71,0.018).
$$

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Climate |
| Structure | Normalized gamma-like envelope plus embedded Gaussians |
| Regularity | Smooth, broad, and multiscale |
| Main challenge | Preserve small fronts inside a dominant long event |

## Parameters

| Parameter | Value |
|---|---|
| Main onset/scale | $0.12/0.16$ |
| Positive fronts | $0.43,0.58$ |
| Negative feature | $0.71$ |

## MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N);
G=@(z,c,w) exp(-0.5*((z-c)/w).^2);
u=max(x-0.12,0); main=(x>=0.12).*(u/0.16).^2.*exp(2-u/0.16); main=main/max(main);
f=0.12+0.82*main+0.16*G(x,0.43,0.025)+0.12*G(x,0.58,0.032)-0.07*G(x,0.71,0.018);
plot(x,f,'LineWidth',1.3); grid on
xlabel('x'); ylabel('f(x)'); title('TF218 — AtmosphericRiver')
~~~

## Python Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024
x=np.linspace(0.0,1.0,N)
G=lambda z,c,w: np.exp(-0.5*((z-c)/w)**2)
u=np.maximum(x-0.12,0); main=(x>=0.12)*(u/0.16)**2*np.exp(2-u/0.16); main/=np.max(main)
f=0.12+0.82*main+0.16*G(x,0.43,0.025)+0.12*G(x,0.58,0.032)-0.07*G(x,0.71,0.018)
plt.plot(x,f); plt.grid(True)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF218 — AtmosphericRiver")
plt.show()
~~~

## Recommended Uses

- Broad-event denoising
- Embedded-front preservation
- Asymmetric climate-pulse recovery

## Provenance

This is a deterministic benchmark surrogate inspired by climate measurement morphology. It is not a calibrated physical or environmental simulator.

[← Previous: ThermostatCycle](TF217_ThermostatCycle.md) · [Category 10 catalog](index.md) · [Next: HeatwaveFrontBreak →](TF219_HeatwaveFrontBreak.md)

