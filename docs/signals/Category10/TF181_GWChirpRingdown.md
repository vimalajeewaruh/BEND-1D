---
layout: default
title: "TF181 — GWChirpRingdown"
---

# TF181 — GWChirpRingdown

![GWChirpRingdown signal](../../assets/images/TF181_GWChirpRingdown.png)

## Overview

An accelerating compact-binary-inspired chirp grows in amplitude and frequency until a prescribed merger time, then changes immediately into a damped high-frequency ring-down.

## Mathematical Definition

Let $x_c=0.72$,
$$
A(x)=0.12+0.88(x/x_c)^{1.6},\qquad
\phi(x)=2\pi(4x+5x^2+12x^3+18x^5),
$$
and $\phi_c=\phi(x_c)$. Then
$$
f(x)=
\begin{cases}
A(x)\sin\{\phi(x)\}, & x<x_c,\\
e^{-14(x-x_c)}\sin\{84\pi(x-x_c)+\phi_c\}, & x\ge x_c.
\end{cases}
$$

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Astrophysics |
| Structure | Accelerating chirp followed by ring-down |
| Regularity | Continuous waveform with an abrupt change of oscillatory regime |
| Main challenge | Preserve phase through the merger and the short decaying tail |

## Parameters

| Parameter | Value |
|---|---|
| Merger time $x_c$ | $0.72$ |
| Ring-down rate | $14$ |
| Ring-down frequency | $42$ cycles/unit |

## MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N);
xc=0.72; pre=x<xc;
A=0.12+0.88*(x/xc).^1.6;
phase=2*pi*(4*x+5*x.^2+12*x.^3+18*x.^5);
phasec=2*pi*(4*xc+5*xc^2+12*xc^3+18*xc^5);
f=zeros(size(x)); f(pre)=A(pre).*sin(phase(pre));
u=max(x-xc,0);
f(~pre)=exp(-14*u(~pre)).*sin(2*pi*42*u(~pre)+phasec);
plot(x,f,'LineWidth',1.3); grid on
xlabel('x'); ylabel('f(x)'); title('TF181 — GWChirpRingdown')
~~~

## Python Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024
x=np.linspace(0.0,1.0,N)
xc=0.72; pre=x<xc
A=0.12+0.88*(x/xc)**1.6
phase=2*np.pi*(4*x+5*x**2+12*x**3+18*x**5)
phasec=2*np.pi*(4*xc+5*xc**2+12*xc**3+18*xc**5)
f=np.zeros_like(x); f[pre]=A[pre]*np.sin(phase[pre])
u=np.maximum(x-xc,0)
f[~pre]=np.exp(-14*u[~pre])*np.sin(2*np.pi*42*u[~pre]+phasec)
plt.plot(x,f); plt.grid(True)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF181 — GWChirpRingdown")
plt.show()
~~~

## Recommended Uses

- Nonstationary chirp denoising
- Merger-time and phase preservation
- Rapid regime-change recovery

## Provenance

This is a deterministic benchmark surrogate inspired by astrophysics measurement morphology. It is not a calibrated physical or clinical simulator.

[Category 10 catalog](index.md) · [Next: FRBScatterTail →](TF182_FRBScatterTail.md)

