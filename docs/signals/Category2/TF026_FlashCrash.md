---
layout: default
title: TF026 — FlashCrash
---

# TF026 — FlashCrash

![FlashCrash signal](../assets/images/TF026_FlashCrash.png)

## Overview

The **FlashCrash** signal combines an almost instantaneous market loss, partial exponential recovery, and a localized high-frequency volatility burst. A slowly varying baseline is retained throughout the interval.

## Mathematical Definition

Define the baseline

$$
b(x)=1+0.12\sqrt{x+0.02}+0.025\sin(10\pi x)
$$

and let $x_c=0.58$. The crash component is

$$
D(x)=-0.31\left[1+\tanh\{180(x-x_c)\}\right].
$$

For $x\geq x_c$, define the recovery

$$
R(x)=0.48\left[1-e^{-22(x-x_c)}\right]
$$

and the volatility burst

$$
V(x)=0.09e^{-10(x-x_c)}\sin\{65\pi(x-x_c)\}.
$$

The complete signal is

$$
f(x)=
b(x)+D(x)
+\mathbf{1}_{\{x\geq x_c\}}\left[R(x)+V(x)\right].
$$

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Structural break with rebound and transient burst |
| Signal type | Deterministic and nonstationary |
| Crash location | $x_c=0.58$ |
| Recovery | Partial exponential rebound |
| Fine structure | Localized damped high-frequency oscillation |
| Main challenge | Preserving the crash and volatility burst without producing ringing |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $x_c$ | Crash location | 0.58 |
| $180$ | Crash sharpness | 180 |
| $22$ | Recovery rate | 22 |
| $10$ | Volatility decay rate | 10 |
| $65\pi$ | Volatility angular frequency | $65\pi$ |

## MATLAB Implementation

~~~matlab
N = 1024;
x = linspace(0,1,N);
xc = 0.58;
u = x-xc;

b = 1 + 0.12*sqrt(x+0.02) + 0.025*sin(10*pi*x);
D = -0.31*(1+tanh(180*u));
R = 0.48*(1-exp(-22*u));
V = 0.09*exp(-10*u).*sin(65*pi*u);
f = b + D + (x>=xc).*(R+V);

plot(x,f,'LineWidth',1.6)
xlabel('x'); ylabel('f(x)');
title('TF026 — FlashCrash'); grid on
exportgraphics(gcf,'TF026_FlashCrash.png','Resolution',300);
~~~

## Python Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt

N = 1024
x = np.linspace(0, 1, N)
xc = 0.58
u = x - xc

b = 1 + 0.12*np.sqrt(x+0.02) + 0.025*np.sin(10*np.pi*x)
D = -0.31*(1 + np.tanh(180*u))
R = 0.48*(1 - np.exp(-22*u))
V = 0.09*np.exp(-10*u)*np.sin(65*np.pi*u)
f = b + D + (x >= xc)*(R + V)

plt.plot(x, f, linewidth=1.6)
plt.xlabel("x"); plt.ylabel("f(x)")
plt.title("TF026 — FlashCrash")
plt.grid(alpha=0.3); plt.tight_layout()
plt.savefig("TF026_FlashCrash.png", dpi=300)
~~~

## Recommended Uses

- Structural-break preservation
- Abrupt-loss and recovery analysis
- Transient volatility denoising
- Composite trend, edge, and oscillation evaluation

## Provenance

**Status:** Flash-crash-inspired deterministic financial surrogate.

---

[← Previous: Platinum5Y](TF025_Platinum5Y.md) | [Category 2 Catalog](index.md)

