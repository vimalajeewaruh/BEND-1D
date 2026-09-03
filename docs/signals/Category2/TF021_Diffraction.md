---
layout: default
title: TF021 — Diffraction
---

# TF021 — Diffraction

![Diffraction signal](../assets/images/TF021_Diffraction.png)

## Overview

The **Diffraction** signal combines a dominant central diffraction envelope, double-slit-type fringes, weak sidelobes, and a small displaced satellite order. It tests whether a denoiser can preserve systematic fine structure without exaggerating weak features.

## Mathematical Definition

Let

$$
z=18\pi(x-0.50)
$$

and define the main envelope

$$
A(x)=
\left(\frac{\sin z}{z}\right)^2,
$$

with the continuous value $\sin z/z=1$ at $z=0$. The fringe modulation is

$$
M(x)=0.18+0.82\cos^2\{15\pi(x-0.50)\}.
$$

For the displaced satellite, let

$$
z_2=34\pi(x-0.67)
$$

and

$$
S(x)=0.10\left(\frac{\sin z_2}{z_2}\right)^2,
$$

again using the continuous value 1 for the ratio at $z_2=0$. The benchmark is

$$
f(x)=A(x)M(x)+S(x).
$$

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Diffraction envelope with fringes and satellite |
| Signal type | Deterministic and oscillatory |
| Dominant feature | Central squared-sinc envelope |
| Fine structure | Cosine-squared fringe modulation |
| Weak feature | Displaced satellite near $x=0.67$ |
| Main challenge | Preserving sidelobes and weak fringes without ringing artifacts |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $18\pi$ | Main-envelope scale | $18\pi$ |
| $15\pi$ | Fringe angular frequency | $15\pi$ |
| $34\pi$ | Satellite scale | $34\pi$ |
| $0.10$ | Satellite amplitude | 0.10 |

## MATLAB Implementation

~~~matlab
N = 1024;
x = linspace(0,1,N);

z = 18*pi*(x-0.50);
A = ones(size(x));
idx = (z~=0);
A(idx) = (sin(z(idx))./z(idx)).^2;

M = 0.18 + 0.82*cos(15*pi*(x-0.50)).^2;

z2 = 34*pi*(x-0.67);
S = 0.10*ones(size(x));
idx2 = (z2~=0);
S(idx2) = 0.10*(sin(z2(idx2))./z2(idx2)).^2;

f = A.*M + S;

plot(x,f,'LineWidth',1.6)
xlabel('x'); ylabel('f(x)');
title('TF021 — Diffraction'); grid on
exportgraphics(gcf,'TF021_Diffraction.png','Resolution',300);
~~~

## Python Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt

N = 1024
x = np.linspace(0, 1, N)

# np.sinc(y) = sin(pi*y)/(pi*y)
z = 18*np.pi*(x-0.50)
A = np.sinc(z/np.pi)**2
M = 0.18 + 0.82*np.cos(15*np.pi*(x-0.50))**2

z2 = 34*np.pi*(x-0.67)
S = 0.10*np.sinc(z2/np.pi)**2
f = A*M + S

plt.plot(x, f, linewidth=1.6)
plt.xlabel("x"); plt.ylabel("f(x)")
plt.title("TF021 — Diffraction")
plt.grid(alpha=0.3); plt.tight_layout()
plt.savefig("TF021_Diffraction.png", dpi=300)
~~~

## Recommended Uses

- Fine-fringe preservation
- Weak-feature recovery
- Oscillatory sidelobe denoising
- Testing artificial-ringing suppression

## Provenance

**Status:** Optical-diffraction-inspired deterministic surrogate.

---

[← Previous: ThermalRunaway](TF020_ThermalRunaway.md) | [Category 2 Catalog](index.md) | [Next: Titration →](TF022_Titration.md)

