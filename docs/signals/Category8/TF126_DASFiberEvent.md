---
layout: default
title: TF126 — DASFiberEvent
---

# TF126 — DASFiberEvent

![DASFiberEvent signal](../../assets/images/TF126_DASFiberEvent.png)

## Overview

The **DASFiberEvent** signal combines a weak background, localized chirped wave packet with gradual fading, and a smaller high-frequency secondary echo.

## Mathematical Definition

Let

$$
b(x)=0.035\sin(6\pi x)+0.015x,
$$

$$
p(x)=0.28e^{-((x-0.46)/0.075)^2/2}\sin[2\pi(18x+14x^2)],
$$

and

$$
e(x)=0.10e^{-((x-0.64)/0.025)^2/2}\sin(90\pi x).
$$

Then $f(x)=b(x)+(1-0.25x)p(x)+e(x)$.

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Localized chirp with fading and echo |
| Main packet | Centered near $x=0.46$ |
| Secondary echo | Centered near $x=0.64$ |
| Main challenge | Preserving changing local frequency in a low-amplitude record |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $0.075$ | Main-packet width | 0.075 |
| $14$ | Quadratic phase coefficient | 14 |
| $0.10$ | Echo amplitude | 0.10 |

## MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N);
background=0.035*sin(2*pi*3*x)+0.015*x;
packet=0.28*exp(-0.5*((x-0.46)/0.075).^2).*sin(2*pi*(18*x+14*x.^2));
echo=0.10*exp(-0.5*((x-0.64)/0.025).^2).*sin(2*pi*45*x);
f=background+(1-0.25*x).*packet+echo;
plot(x,f); grid on; title('TF126 — DASFiberEvent')
exportgraphics(gcf,'TF126_DASFiberEvent.png','Resolution',300);
~~~

## Python Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N)
background=.035*np.sin(2*np.pi*3*x)+.015*x
packet=.28*np.exp(-.5*((x-.46)/.075)**2)*np.sin(2*np.pi*(18*x+14*x**2))
echo=.10*np.exp(-.5*((x-.64)/.025)**2)*np.sin(2*np.pi*45*x)
f=background+(1-.25*x)*packet+echo
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF126_DASFiberEvent.png',dpi=300)
~~~

## Recommended Uses

- Distributed-acoustic-sensing denoising
- Localized-chirp preservation
- Weak-echo recovery

## Provenance

**Status:** Distributed-acoustic-sensing-inspired deterministic surrogate.

---

[Category 8 Catalog](index.md) | [Next: PhotoacousticAline →](TF127_PhotoacousticAline.md)
