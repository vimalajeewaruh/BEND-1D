---
layout: default
title: TF063 — NMRMultiplet
---

# TF063 — NMRMultiplet

![NMRMultiplet signal](../../assets/images/TF063_NMRMultiplet.png)

## Overview

The **NMRMultiplet** signal uses Lorentzian resonances. Several isolated lines accompany a partially resolved central multiplet and a weak broad component. Long Lorentzian tails cause stronger interaction between neighboring peaks than Gaussian mixtures.

## Mathematical Definition

Define the Lorentzian line

$$
L(x;c,g)=\frac{1}{1+\left((x-c)/g\right)^2}.
$$

The line centers, amplitudes, and widths are

$$
c=(0.16,0.31,0.455,0.486,0.515,0.545,0.73,0.865),
$$

$$
A=(0.34,0.58,0.52,0.82,1.00,0.67,0.44,0.25),
$$

$$
g=(0.008,0.011,0.007,0.006,0.006,0.007,0.012,0.009).
$$

The signal is

$$
f(x)=0.025+0.010x+sum_{k=1}^{8}A_kL(x;c_k,g_k)
+0.075L(x;0.505,0.055).
$$

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Lorentzian resonances with central multiplet |
| Number of narrow lines | 8 |
| Central group | Four partially resolved lines |
| Broad component | Centered at $x=0.505$ |
| Main challenge | Preserving line splitting despite long interacting tails |

## Parameters

| Parameter | Meaning | Default |
|---|---|---|
| $N$ | Number of samples | 1024 |
| $c$ | Resonance centers | As listed above |
| $A$ | Resonance amplitudes | As listed above |
| $g$ | Lorentzian widths | As listed above |

## MATLAB Implementation

~~~matlab
N = 1024; x = linspace(0,1,N); f = 0.025+0.010*x;
c = [0.16 0.31 0.455 0.486 0.515 0.545 0.73 0.865];
A = [0.34 0.58 0.52 0.82 1.00 0.67 0.44 0.25];
g = [0.008 0.011 0.007 0.006 0.006 0.007 0.012 0.009];
for k = 1:numel(c)
    z = (x-c(k))/g(k); f = f+A(k)./(1+z.^2);
end
z = (x-0.505)/0.055; f = f+0.075./(1+z.^2);
plot(x,f,'LineWidth',1.3); grid on
xlabel('x'); ylabel('Intensity'); title('TF063 — NMRMultiplet')
exportgraphics(gcf,'TF063_NMRMultiplet.png','Resolution',300);
~~~

## Python Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N = 1024; x = np.linspace(0,1,N); f = 0.025+0.010*x
c = [0.16,0.31,0.455,0.486,0.515,0.545,0.73,0.865]
A = [0.34,0.58,0.52,0.82,1.00,0.67,0.44,0.25]
g = [0.008,0.011,0.007,0.006,0.006,0.007,0.012,0.009]
for ck,ak,gk in zip(c,A,g):
    z = (x-ck)/gk; f += ak/(1+z**2)
z = (x-0.505)/0.055; f += 0.075/(1+z**2)
plt.plot(x,f,linewidth=1.3); plt.grid(alpha=0.3)
plt.xlabel("x"); plt.ylabel("Intensity"); plt.title("TF063 — NMRMultiplet")
plt.tight_layout(); plt.savefig("TF063_NMRMultiplet.png",dpi=300)
~~~

## Recommended Uses

- NMR line-shape denoising
- Multiplet resolution
- Lorentzian-tail preservation
- Weak broad-resonance recovery

## Provenance

**Status:** NMR-spectroscopy-inspired deterministic analytical surrogate.

---

[← Previous: MassSpectrum](TF062_MassSpectrum.md) | [Category 5 Catalog](index.md) | [Next: XRDPeaks →](TF064_XRDPeaks.md)

