# AvoidedCrossing

The **AvoidedCrossing** signal models the upper branch of two interacting energy levels. The gap parameter smooths a cusp-like crossing while retaining very large local curvature, making the signal a tunable near-singularity.

## Mathematical Definition

$$
f(x)=
\sqrt{4(x-0.52)^2+\Delta^2},
\qquad
\Delta=0.035.
$$

When $\Delta=0$, the signal becomes a cusp. A positive $\Delta$ creates a smooth avoided crossing with minimum value $f(0.52)=\Delta$.

[View AvoidedCrossing signal](../../assets/images/TF010_AvoidedCrossing.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Cusps, corners, and derivative singularities |
| Secondary tags | Near-singularity, high curvature, tunable gap |
| Continuity | Continuous |
| Differentiability | Smooth for $\Delta>0$ |
| Minimum location | $x=0.52$ |
| Main challenge | Preserving a narrow high-curvature minimum |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $0.52$ | Crossing location | 0.52 |
| $\Delta$ | Minimum gap | 0.035 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF010_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF010_python.md)



## Recommended Uses

- High-curvature minimum recovery
- Studying the transition from smooth behavior to a cusp
- Detecting oversmoothing near a near-singularity
- Evaluating location and gap-estimation accuracy

## Provenance

**Status:** Avoided-energy-level-crossing morphology surrogate.

---

[← Previous: QuantumBarrier](TF009_QuantumBarrier.md) | [Signal Catalog](index.md) | [Next: Morse →](TF011_Morse.md)
