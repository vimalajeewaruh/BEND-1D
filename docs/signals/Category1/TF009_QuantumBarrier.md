---
layout: default
title: TF009 — QuantumBarrier
---

# TF009 — QuantumBarrier

![QuantumBarrier signal](../assets/images/TF009_QuantumBarrier.png)

## Overview

The **QuantumBarrier** signal represents transmission through a rectangular barrier. It combines tunneling behavior below the barrier with oscillatory transmission resonances above it.

## Mathematical Definition

Let the barrier height be $V_0=1$, the dimensionless width be $a=7$, and

$$
E(x)=0.15+1.70x.
$$

For $E<V_0$,

$$
T(E)
=
\left[
1+
\frac{
V_0^2\sinh^2\{a\sqrt{V_0-E}\}
}{
4E(V_0-E)
}
\right]^{-1}.
$$

For $E>V_0$,

$$
T(E)
=
\left[
1+
\frac{
V_0^2\sin^2\{a\sqrt{E-V_0}\}
}{
4E(E-V_0)
}
\right]^{-1}.
$$

The test function is $f(x)=T(E(x))$. At $E=V_0$, the continuous limiting value is

$$
T(V_0)=\left(1+\frac{V_0a^2}{4}\right)^{-1}.
$$

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Composite and adversarial mixtures |
| Secondary tags | Smooth transition, resonances, evolving behavior |
| Barrier energy | $V_0=1$ |
| Energy range | $0.15\leq E\leq1.85$ |
| Below barrier | Tunneling-type behavior |
| Above barrier | Oscillatory resonances |
| Main challenge | Preserving transition and resonance structure |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $V_0$ | Barrier height | 1 |
| $a$ | Dimensionless barrier width | 7 |
| $E(x)$ | Energy map | $0.15+1.70x$ |

## MATLAB Implementation

~~~matlab
N = 1024;
x = linspace(0,1,N);
V0 = 1;
a = 7;
E = 0.15 + 1.70*x;
T = zeros(size(E));

below = E < V0-1e-12;
above = E > V0+1e-12;
atBarrier = ~(below | above);

z = V0-E(below);
T(below) = 1 ./ (1 + V0^2*sinh(a*sqrt(z)).^2 ./ (4*E(below).*z));

z = E(above)-V0;
T(above) = 1 ./ (1 + V0^2*sin(a*sqrt(z)).^2 ./ (4*E(above).*z));

T(atBarrier) = 1/(1+V0*a^2/4);
f = T;

plot(x,f,'LineWidth',1.4)
xlabel('x'); ylabel('T(E(x))');
title('TF009 — QuantumBarrier'); grid on
exportgraphics(gcf,'TF009_QuantumBarrier.png','Resolution',300);
~~~

## Python Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt

N = 1024
x = np.linspace(0, 1, N)
V0, a = 1.0, 7.0
E = 0.15 + 1.70*x
T = np.zeros_like(E)

below = E < V0-1e-12
above = E > V0+1e-12
at_barrier = ~(below | above)

z = V0-E[below]
T[below] = 1/(1 + V0**2*np.sinh(a*np.sqrt(z))**2/(4*E[below]*z))

z = E[above]-V0
T[above] = 1/(1 + V0**2*np.sin(a*np.sqrt(z))**2/(4*E[above]*z))

T[at_barrier] = 1/(1+V0*a**2/4)
f = T

plt.plot(x, f, linewidth=1.4)
plt.xlabel("x"); plt.ylabel("T(E(x))")
plt.title("TF009 — QuantumBarrier")
plt.grid(alpha=0.3)
plt.tight_layout()
plt.savefig("TF009_QuantumBarrier.png", dpi=300)
~~~

## Recommended Uses

- Recovery of oscillatory resonances
- Preservation of tunneling-to-resonance transitions
- Testing amplitude distortion near narrow transmission maxima
- Evaluating denoising across changing local morphology

## Provenance

**Status:** Rectangular-quantum-barrier-inspired deterministic morphology surrogate.

---

[← Previous: ImpactSpring](TF008_ImpactSpring.md) | [Signal Catalog](index.md) | [Next: AvoidedCrossing →](TF010_AvoidedCrossing.md)
