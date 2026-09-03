---
layout: default
title: TF012 — BZPulse
---

# TF012 — BZPulse

![BZPulse signal](../assets/images/TF012_BZPulse.png)

## Overview

The **BZPulse** signal is a toy excitable chemical-reaction trace. Two logistic components create a rapid autocatalytic rise and slower depletion phase, while a damped oscillatory term represents chemical relaxation.

## Mathematical Definition

Let $u=x-0.55$. Then

$$
\begin{aligned}
f(x)
={}&
\frac{1}{1+\exp\{-100(x-0.25)\}}
-
\frac{1}{1+\exp\{-40(x-0.55)\}}\\
&+
0.20I(x\geq0.55)e^{-9u}\sin(45\pi u),
\end{aligned}
$$

where $I(\cdot)$ is the indicator function.

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Composite and adversarial mixtures |
| Secondary tags | Excitable pulse, logistic transitions, damped relaxation |
| Rise | Rapid logistic transition near $x=0.25$ |
| Depletion | Slower logistic transition near $x=0.55$ |
| Relaxation | Localized damped oscillation |
| Main challenge | Preserving multiple intrinsic time scales |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $100$ | Rise steepness | 100 |
| $40$ | Depletion steepness | 40 |
| $0.20$ | Relaxation amplitude | 0.20 |
| $9$ | Relaxation decay rate | 9 |
| $45\pi$ | Relaxation frequency coefficient | $45\pi$ |

## MATLAB Implementation

~~~matlab
N = 1024;
x = linspace(0,1,N);
rise = 1./(1+exp(-100*(x-0.25)));
depletion = 1./(1+exp(-40*(x-0.55)));
relaxation = zeros(size(x));
idx = x >= 0.55;
u = x(idx)-0.55;
relaxation(idx) = 0.20*exp(-9*u).*sin(45*pi*u);
f = rise-depletion+relaxation;

plot(x,f,'LineWidth',1.4)
xlabel('x'); ylabel('f(x)');
title('TF012 — BZPulse'); grid on
exportgraphics(gcf,'TF012_BZPulse.png','Resolution',300);
~~~

## Python Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt

N = 1024
x = np.linspace(0, 1, N)
rise = 1/(1+np.exp(-100*(x-0.25)))
depletion = 1/(1+np.exp(-40*(x-0.55)))
relaxation = np.zeros_like(x)
idx = x >= 0.55
u = x[idx]-0.55
relaxation[idx] = 0.20*np.exp(-9*u)*np.sin(45*np.pi*u)
f = rise-depletion+relaxation

plt.plot(x, f, linewidth=1.4)
plt.xlabel("x"); plt.ylabel("f(x)")
plt.title("TF012 — BZPulse")
plt.grid(alpha=0.3)
plt.tight_layout()
plt.savefig("TF012_BZPulse.png", dpi=300)
~~~

## Recommended Uses

- Excitable-pulse recovery
- Preservation of unequal transition rates
- Recovery of damped post-pulse oscillations
- Testing denoising across several intrinsic scales

## Provenance

**Status:** Belousov–Zhabotinsky-type deterministic morphology surrogate, not a full kinetic model.

---

[← Previous: Morse](TF011_Morse.md) | [Signal Catalog](index.md) | [Next: ActionPotential →](TF013_ActionPotential.md)
