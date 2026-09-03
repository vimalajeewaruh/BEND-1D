---
layout: default
title: TF048 — IceCore
---

# TF048 — IceCore

![IceCore signal](../../assets/images/TF048_IceCore.png)

## Overview

The **IceCore** signal represents an isotope, dust, conductivity, or related paleoclimate proxy. It combines long- and short-scale oscillations with a narrow excursion and a finite-duration level change.

## Mathematical Definition

Define

$$
L(x)=0.34\sin(2.5\pi x)+0.16\sin(6.8\pi x+0.7),
$$

$$
H(x)=0.045\sin(54\pi x)\left[0.7+0.3\cos(2\pi x)\right],
$$

$$
E(x)=-0.62\exp\!\left[-\frac12\left(\frac{x-0.58}{0.018}\right)^2\right],
$$

and the finite-duration level component

$$
S(x)=0.20\left[
\frac{1}{1+e^{-85(x-0.62)}}-
\frac{1}{1+e^{-55(x-0.76)}}
\right].
$$

The signal is

$$
f(x)=L(x)+H(x)+E(x)+S(x).
$$

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Multiscale climate variability with abrupt event |
| Slow content | Frequencies 1.25 and 3.4 |
| Fine content | Amplitude-modulated frequency 27 |
| Event structure | Narrow negative excursion and temporary level change |
| Main challenge | Preserving a localized event across widely separated scales |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $0.58$ | Excursion center | 0.58 |
| $0.018$ | Excursion width | 0.018 |
| $0.62,0.76$ | Level-change boundaries | As shown |

## MATLAB Implementation

~~~matlab
N = 1024; x = linspace(0,1,N);
slow = 0.34*sin(2*pi*1.25*x)+0.16*sin(2*pi*3.4*x+0.7);
fine = 0.045*sin(2*pi*27*x).*(0.7+0.3*cos(2*pi*x));
event = -0.62*exp(-0.5*((x-0.58)/0.018).^2);
step = 0.20*(1./(1+exp(-85*(x-0.62)))-1./(1+exp(-55*(x-0.76))));
f = slow+fine+event+step;
plot(x,f,'LineWidth',1.3); grid on
xlabel('x'); ylabel('f(x)'); title('TF048 — IceCore')
exportgraphics(gcf,'TF048_IceCore.png','Resolution',300);
~~~

## Python Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N = 1024; x = np.linspace(0,1,N)
slow = 0.34*np.sin(2*np.pi*1.25*x)+0.16*np.sin(2*np.pi*3.4*x+0.7)
fine = 0.045*np.sin(2*np.pi*27*x)*(0.7+0.3*np.cos(2*np.pi*x))
event = -0.62*np.exp(-0.5*((x-0.58)/0.018)**2)
step = 0.20*(1/(1+np.exp(-85*(x-0.62)))-1/(1+np.exp(-55*(x-0.76))))
f = slow+fine+event+step
plt.plot(x,f,linewidth=1.3); plt.grid(alpha=0.3)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF048 — IceCore")
plt.tight_layout(); plt.savefig("TF048_IceCore.png",dpi=300)
~~~

## Recommended Uses

- Paleoclimate-proxy denoising
- Abrupt-event preservation
- Temporary regime-change recovery
- Widely separated-scale evaluation

## Provenance

**Status:** Ice-core-proxy-inspired deterministic environmental surrogate.

---

[← Previous: TreeRing](TF047_TreeRing.md) | [Category 4 Catalog](index.md) | [Next: Seismogram →](TF049_Seismogram.md)

