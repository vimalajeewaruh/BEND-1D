---
layout: default
title: TF011 — Morse
---

# TF011 — Morse

![Morse signal](../assets/images/TF011_Morse.png)

## Overview

The **Morse** signal is based on the Morse potential for a diatomic molecular bond. It contains a steep repulsive wall, a narrow minimum, and a long dissociation tail, producing a strongly asymmetric smooth benchmark.

## Mathematical Definition

Define

$$
r(x)=0.35+2x.
$$

With $D_e=1$, $a=2.8$, and $r_e=0.80$,

$$
f(x)
=
D_e
\left[
1-\exp\{-a(r(x)-r_e)\}
\right]^2
-D_e.
$$

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Smooth global structure |
| Secondary tags | Asymmetric well, steep wall, long tail |
| Continuity | Continuous |
| Differentiability | Smooth |
| Minimum location | Where $r(x)=r_e$ |
| Minimum value | $-D_e$ |
| Main challenge | Preserving highly unequal curvature on two sides |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $D_e$ | Well depth | 1 |
| $a$ | Width/steepness parameter | 2.8 |
| $r_e$ | Equilibrium separation | 0.80 |
| $r(x)$ | Coordinate transformation | $0.35+2x$ |

## MATLAB Implementation

~~~matlab
N = 1024;
x = linspace(0,1,N);
r = 0.35 + 2*x;
De = 1;
aMorse = 2.8;
re = 0.80;
f = De*(1-exp(-aMorse*(r-re))).^2-De;

plot(x,f,'LineWidth',1.6)
xlabel('x'); ylabel('f(x)');
title('TF011 — Morse'); grid on
exportgraphics(gcf,'TF011_Morse.png','Resolution',300);
~~~

## Python Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt

N = 1024
x = np.linspace(0, 1, N)
r = 0.35 + 2*x
De, a, re = 1.0, 2.8, 0.80
f = De*(1-np.exp(-a*(r-re)))**2-De

plt.plot(x, f, linewidth=1.6)
plt.xlabel("x"); plt.ylabel("f(x)")
plt.title("TF011 — Morse")
plt.grid(alpha=0.3)
plt.tight_layout()
plt.savefig("TF011_Morse.png", dpi=300)
~~~

## Recommended Uses

- Recovery of asymmetric potential wells
- Preservation of steep walls and long tails
- Minimum-location and depth estimation
- Evaluation of curvature-adaptive smoothing

## Provenance

**Status:** Morse-potential-inspired deterministic benchmark profile.

---

[← Previous: AvoidedCrossing](TF010_AvoidedCrossing.md) | [Signal Catalog](index.md) | [Next: BZPulse →](TF012_BZPulse.md)
