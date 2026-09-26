# ImpactSpring

The **ImpactSpring** signal combines a narrow mechanical impact with two damped structural vibration modes. It contains localized energy and oscillations at two distinct frequency and decay scales.

## Mathematical Definition

Let $u=x-x_0$. Then

```math
f(x)
=
A\exp\left[-\frac{1}{2}\left(\frac{x-x_0}{w}\right)^2\right]
+
I(x\geq x_0)e^{-\alpha_1 u}\sin(\omega_1 u)
+
B\,I(x\geq x_0)e^{-\alpha_2 u}\sin(\omega_2 u),
```

where $I(\cdot)$ is the indicator function.

[View ImpactSpring signal](../../assets/images/TF008_ImpactSpring.png)

## Morphological Characteristics

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $x_0$ | Impact location | 0.27 |
| $A$ | Impact amplitude | 1.20 |
| $w$ | Impact width | 0.006 |
| $\alpha_1$ | First-mode decay rate | 8 |
| $\alpha_2$ | Second-mode decay rate | 11 |
| $\omega_1$ | First-mode frequency coefficient | $34\pi$ |
| $\omega_2$ | Second-mode frequency coefficient | $82\pi$ |
| $B$ | Second-mode amplitude | 0.28 |

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

[View MATLAB implementation](../../codes/matlab/TF008_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF008_python.md)



## Recommended Uses

- Impulse preservation
- Multimode ring-down recovery
- Separation of multiple oscillatory scales
- Evaluation of transient smearing and ringing

## Provenance

**Status:** Mechanical-impact and structural-vibration morphology surrogate.

---

[← Previous: BouncingBall](TF007_BouncingBall.md) | [Signal Catalog](index.md) | [Next: QuantumBarrier →](TF009_QuantumBarrier.md)
