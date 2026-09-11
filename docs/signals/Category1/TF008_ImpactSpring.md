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
