---
layout: default
title: TF128 — OCTRetinalProfile
---

# TF128 — OCTRetinalProfile

![OCTRetinalProfile signal](../../assets/images/TF128_OCTRetinalProfile.png)

## Overview

The **OCTRetinalProfile** signal models a layered reflectivity profile with seven sharp interfaces and one particularly thin weak layer.

## Mathematical Definition

Let $g(x;c,w)=e^{-((x-c)/w)^2/2}$. Then

$$
f(x)=0.10+0.03x+\sum_{k=1}^{7}a_k g(x;c_k,w_k)+0.07g(x;0.655,0.004),
$$

where

$$
c=(0.14,0.23,0.36,0.49,0.62,0.73,0.81),
$$

$$
a=(0.16,0.28,0.42,0.26,0.54,0.31,0.18),
$$

$$
w=(0.008,0.010,0.012,0.009,0.010,0.007,0.006).
$$

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Layered narrow reflectivity peaks |
| Strong interface | Peak near $x=0.62$ |
| Thin weak layer | Center 0.655, width 0.004 |
| Main challenge | Preserving fine stratification without merging adjacent layers |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $c_k,a_k,w_k$ | Layer centers, amplitudes, and widths | As above |
| $0.07$ | Thin-layer amplitude | 0.07 |

## MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N); f=0.10+0.03*x;
c=[0.14 0.23 0.36 0.49 0.62 0.73 0.81];
a=[0.16 0.28 0.42 0.26 0.54 0.31 0.18];
w=[0.008 0.010 0.012 0.009 0.010 0.007 0.006];
for k=1:numel(c), f=f+a(k)*exp(-0.5*((x-c(k))/w(k)).^2); end
f=f+0.07*exp(-0.5*((x-0.655)/0.004).^2);
plot(x,f); grid on; title('TF128 — OCTRetinalProfile')
exportgraphics(gcf,'TF128_OCTRetinalProfile.png','Resolution',300);
~~~

## Python Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); f=.10+.03*x
c=[.14,.23,.36,.49,.62,.73,.81]; a=[.16,.28,.42,.26,.54,.31,.18]
w=[.008,.010,.012,.009,.010,.007,.006]
for ck,ak,wk in zip(c,a,w): f+=ak*np.exp(-.5*((x-ck)/wk)**2)
f+=.07*np.exp(-.5*((x-.655)/.004)**2)
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF128_OCTRetinalProfile.png',dpi=300)
~~~

## Recommended Uses

- OCT-profile denoising
- Layer-resolution evaluation
- Thin-feature preservation

## Provenance

**Status:** Retinal-OCT-reflectivity-inspired deterministic surrogate.

---

[← Previous: PhotoacousticAline](TF127_PhotoacousticAline.md) | [Category 8 Catalog](index.md) | [Next: UltrasoundCrackEcho →](TF129_UltrasoundCrackEcho.md)
