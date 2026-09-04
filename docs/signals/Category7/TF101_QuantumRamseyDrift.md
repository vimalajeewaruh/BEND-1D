---
layout: default
title: TF101 — QuantumRamseyDrift
---

# TF101 — QuantumRamseyDrift

![QuantumRamseyDrift signal](../../assets/images/TF101_QuantumRamseyDrift.png)

## Overview

The **QuantumRamseyDrift** signal is a Ramsey-like oscillation with nonlinear phase drift, decreasing visibility, and a localized calibration phase change.

## Mathematical Definition

Let $S(x;c,w)=[1+e^{-(x-c)/w}]^{-1}$. Define

$$
\phi(x)=2\pi[10x+1.8x^2+0.10\sin(4\pi x)],\qquad
v(x)=0.92-0.28x,
$$

and $j(x)=0.55S(x;0.64,0.004)$. Then

$$
f(x)=v(x)\cos[\phi(x)+j(x)].
$$

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Nonstationary oscillation with phase change |
| Visibility | Decreases linearly across the record |
| Calibration change | Localized near $x=0.64$ |
| Main challenge | Preserving phase under smooth drift and abrupt recalibration |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $10,1.8$ | Linear and quadratic phase coefficients | As shown |
| $0.55$ | Calibration phase-change magnitude | 0.55 |
| $0.004$ | Calibration transition width | 0.004 |

## MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N); S=@(z,c,w) 1./(1+exp(-(z-c)/w));
phase=2*pi*(10*x+1.8*x.^2+0.10*sin(2*pi*2*x));
visibility=0.92-0.28*x;
phaseJump=0.55*S(x,0.64,0.004);
f=visibility.*cos(phase+phaseJump);
plot(x,f); grid on; title('TF101 — QuantumRamseyDrift')
exportgraphics(gcf,'TF101_QuantumRamseyDrift.png','Resolution',300);
~~~

## Python Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); S=lambda c,w: 1/(1+np.exp(-(x-c)/w))
phase=2*np.pi*(10*x+1.8*x**2+.10*np.sin(2*np.pi*2*x))
visibility=.92-.28*x; phase_jump=.55*S(.64,.004)
f=visibility*np.cos(phase+phase_jump)
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF101_QuantumRamseyDrift.png',dpi=300)
~~~

## Recommended Uses

- Phase-preserving denoising
- Oscillatory drift recovery
- Calibration-change localization

## Provenance

**Status:** Ramsey-measurement-inspired deterministic quantum-technology surrogate.

---

[Category 7 Catalog](index.md) | [Next: QuantumLeakageBurst →](TF102_QuantumLeakageBurst.md)
