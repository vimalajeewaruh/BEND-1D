# Titration

The **Titration** signal contains three transitions with distinctly different characteristic widths. A weak Gaussian shoulder between the main equivalence regions represents a small complexation or indicator response.

## Mathematical Definition

For $0 \leq x \leq 1$, define

```math
f(x)=
A_0\log(1+kx)
+A_1\tanh\left(\frac{x-x_1}{w_1}\right)
+A_2\tanh\left(\frac{x-x_2}{w_2}\right)
+A_3\tanh\left(\frac{x-x_3}{w_3}\right)
+A_s\exp\left[-\left(\frac{x-x_s}{w_s}\right)^2\right].
```

[View Titration signal](../../assets/images/TF022_Titration.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Multiple unequal smooth transitions |
| Signal type | Deterministic and nonstationary |
| Main transitions | Centered at $x_1$, $x_2$, and $x_3$ |
| Transition widths | $w_1$, $w_2$, and $w_3$ |
| Weak feature | Gaussian shoulder centered at $x=x_s$ |
| Main challenge | Preserving sharp and broad transitions together with a weak shoulder |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $A_0$ | Logarithmic trend amplitude | 0.08 |
| $k$ | Logarithmic trend scale | 20 |
| $x_1$ | First transition center | 0.31 |
| $w_1$ | First transition width | 0.018 |
| $A_1$ | First transition amplitude | 0.55 |
| $x_2$ | Second transition center | 0.69 |
| $w_2$ | Second transition width | 0.060 |
| $A_2$ | Second transition amplitude | 0.32 |
| $x_3$ | Third transition center | 0.84 |
| $w_3$ | Third transition width | 0.014 |
| $A_3$ | Third transition amplitude | 0.13 |
| $x_s$ | Shoulder center | 0.50 |
| $w_s$ | Shoulder width | 0.028 |
| $A_s$ | Shoulder amplitude | 0.07 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF022_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF022_python.md)



## Recommended Uses

- Unequal-transition preservation
- Weak-shoulder recovery
- Multiscale curvature evaluation
- Smooth edge localization

## Provenance

**Status:** Titration-curve-inspired deterministic surrogate.

---

[← Previous: Diffraction](TF021_Diffraction.md) | [Category 2 Catalog](index.md) | [Next: RabiChirp →](TF023_RabiChirp.md)

