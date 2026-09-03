---
layout: default
title: TF024 — MuscleTwitch
---

# TF024 — MuscleTwitch

![MuscleTwitch signal](../assets/images/TF024_MuscleTwitch.png)

## Overview

The **MuscleTwitch** signal is a sum of six causal asymmetric pulses with irregular onset times, amplitudes, and time constants. Several pulses overlap, producing a nonstationary biological waveform with changing local scale.

## Mathematical Definition

For onset time $t_k$ and time constant $\tau_k$, define

$$
u_k(x)=\frac{x-t_k}{\tau_k}
$$

and

$$
g_k(x)=
A_k u_k(x)e^{1-u_k(x)}
\mathbf{1}_{\{u_k(x)\geq0\}}.
$$

The complete signal is

$$
f(x)=\sum_{k=1}^{6}g_k(x),
$$

with

$$
t=(0.10,0.24,0.39,0.44,0.67,0.83),
$$

$$
A=(0.70,1.00,0.55,0.85,1.15,0.65),
$$

and

$$
\tau=(0.035,0.050,0.028,0.042,0.060,0.032).
$$

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Irregular overlapping causal pulses |
| Signal type | Deterministic and nonstationary |
| Number of pulses | 6 |
| Pulse shape | Causal and asymmetric |
| Time scales | Irregular and pulse-dependent |
| Main challenge | Separating overlapping pulses while preserving onset and peak shape |

## Parameters

| Parameter | Meaning | Default |
|---|---|---|
| $N$ | Number of samples | 1024 |
| $t_k$ | Pulse onset times | $(0.10,0.24,0.39,0.44,0.67,0.83)$ |
| $A_k$ | Pulse amplitudes | $(0.70,1.00,0.55,0.85,1.15,0.65)$ |
| $\tau_k$ | Pulse time constants | $(0.035,0.050,0.028,0.042,0.060,0.032)$ |

## MATLAB Implementation

~~~matlab
N = 1024;
x = linspace(0,1,N);
t = [0.10 0.24 0.39 0.44 0.67 0.83];
A = [0.70 1.00 0.55 0.85 1.15 0.65];
tau = [0.035 0.050 0.028 0.042 0.060 0.032];

f = zeros(size(x));
for k = 1:numel(t)
    u = (x-t(k))/tau(k);
    f = f + A(k)*u.*exp(1-u).*(u>=0);
end

plot(x,f,'LineWidth',1.6)
xlabel('x'); ylabel('f(x)');
title('TF024 — MuscleTwitch'); grid on
exportgraphics(gcf,'TF024_MuscleTwitch.png','Resolution',300);
~~~

## Python Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt

N = 1024
x = np.linspace(0, 1, N)
t = np.array([0.10, 0.24, 0.39, 0.44, 0.67, 0.83])
A = np.array([0.70, 1.00, 0.55, 0.85, 1.15, 0.65])
tau = np.array([0.035, 0.050, 0.028, 0.042, 0.060, 0.032])

f = np.zeros_like(x)
for tk, Ak, tauk in zip(t, A, tau):
    u = (x-tk)/tauk
    f += Ak*u*np.exp(1-u)*(u >= 0)

plt.plot(x, f, linewidth=1.6)
plt.xlabel("x"); plt.ylabel("f(x)")
plt.title("TF024 — MuscleTwitch")
plt.grid(alpha=0.3); plt.tight_layout()
plt.savefig("TF024_MuscleTwitch.png", dpi=300)
~~~

## Recommended Uses

- Biological transient denoising
- Overlapping-event separation
- Causal-onset preservation
- Nonstationary pulse recovery

## Provenance

**Status:** Muscle-twitch-inspired deterministic biological surrogate.

---

[← Previous: RabiChirp](TF023_RabiChirp.md) | [Category 2 Catalog](index.md) | [Next: Platinum5Y →](TF025_Platinum5Y.md)
