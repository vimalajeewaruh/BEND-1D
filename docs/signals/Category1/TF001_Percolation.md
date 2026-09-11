# Percolation

The **Percolation** signal represents a critical onset at a specified threshold. It is zero below the threshold and follows a fractional power law above it. The signal is continuous at the threshold but has a singular derivative there, distinguishing it from both a jump and a smooth transition.

## Mathematical Definition

For $0\leq x\leq1$,

$$
f(x)=(x-p_c)_+^\beta,
\qquad
p_c=0.38,
\qquad
\beta=0.41,
$$

where

$$
(u)_+=\max(u,0).
$$

Equivalently,

$$
f(x)=
\begin{cases}
0, & x\leq p_c,\\
(x-p_c)^\beta, & x>p_c.
\end{cases}
$$

Because $0<\beta<1$, the signal is continuous at $p_c$, but its right derivative becomes unbounded as $x\downarrow p_c$.

[View Percolation signal](../../assets/images/TF001_Percolation.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Cusps, corners, and derivative singularities |
| Signal type | Deterministic and nonstationary |
| Critical threshold | $p_c=0.38$ |
| Critical exponent | $\beta=0.41$ |
| Continuity | Continuous |
| Differentiability | Singular derivative at $p_c$ |
| Main challenge | Preserving the onset and local regularity |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $p_c$ | Critical threshold | 0.38 |
| $\beta$ | Critical exponent | 0.41 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF001_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF001_python.md)



## Recommended Uses

- Critical-onset detection
- Derivative-singularity preservation
- Local-regularity estimation
- Distinguishing a continuous onset from a jump

## Provenance

**Status:** Percolation-inspired deterministic critical-onset surrogate.

---

[Signal Catalog](index.md) | [Next: Planck →](TF002_Planck.md)
