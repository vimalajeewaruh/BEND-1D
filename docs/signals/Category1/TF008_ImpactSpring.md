# ImpactSpring

The **ImpactSpring** signal combines a narrow mechanical impact with two damped structural vibration modes. It contains localized energy and oscillations at two distinct frequency and decay scales.

## Mathematical Definition

Let $u=x-0.27$. Then

```math
f(x)
=
1.20
\exp
\left\{
-\frac{1}{2}
\left(
\frac{x-0.27}{0.006}
\right)^2
\right\}
+
I(x\geq0.27)e^{-8u}\sin(34\pi u)
+
0.28I(x\geq0.27)e^{-11u}\sin(82\pi u),

```

where $I(\cdot)$ is the indicator function.

[View ImpactSpring signal](../../assets/images/TF008_ImpactSpring.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Transients and ring-downs |
| Secondary tags | Impact, multimode, multiscale resonance |
| Impact location | $x=0.27$ |
| Narrow-impact width | 0.006 |
| Structural modes | Two |
| Main challenge | Separating an impulse from two damped modes |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $x_0$ | Impact location | 0.27 |
| $1.20$ | Impact amplitude | 1.20 |
| $0.006$ | Impact width | 0.006 |
| $8,11$ | Mode decay rates | 8 and 11 |
| $34\pi,82\pi$ | Mode frequency coefficients | $34\pi$ and $82\pi$ |

## MATLAB Implementation

~~~matlab
N = 1024;
x = linspace(0,1,N);
x0 = 0.27;
u = x-x0;
impact = 1.20*exp(-0.5*((x-x0)/0.006).^2);
mode1 = zeros(size(x));
mode2 = zeros(size(x));
idx = x >= x0;
mode1(idx) = exp(-8*u(idx)).*sin(34*pi*u(idx));
mode2(idx) = 0.28*exp(-11*u(idx)).*sin(82*pi*u(idx));
f = impact + mode1 + mode2;

plot(x,f,'LineWidth',1.3)
xlabel('x'); ylabel('f(x)');
title('TF008 — ImpactSpring'); grid on
exportgraphics(gcf,'TF008_ImpactSpring.png','Resolution',300);
~~~

## Python Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt

N = 1024
x = np.linspace(0, 1, N)
x0 = 0.27
u = x-x0
impact = 1.20*np.exp(-0.5*((x-x0)/0.006)**2)
mode1 = np.zeros_like(x)
mode2 = np.zeros_like(x)
idx = x >= x0
mode1[idx] = np.exp(-8*u[idx])*np.sin(34*np.pi*u[idx])
mode2[idx] = 0.28*np.exp(-11*u[idx])*np.sin(82*np.pi*u[idx])
f = impact + mode1 + mode2

plt.plot(x, f, linewidth=1.3)
plt.xlabel("x"); plt.ylabel("f(x)")
plt.title("TF008 — ImpactSpring")
plt.grid(alpha=0.3)
plt.tight_layout()
plt.savefig("TF008_ImpactSpring.png", dpi=300)
~~~

## Recommended Uses

- Impulse preservation
- Multimode ring-down recovery
- Separation of multiple oscillatory scales
- Evaluation of transient smearing and ringing

## Provenance

**Status:** Mechanical-impact and structural-vibration morphology surrogate.

---

[← Previous: BouncingBall](TF007_BouncingBall.md) | [Signal Catalog](index.md) | [Next: QuantumBarrier →](TF009_QuantumBarrier.md)
