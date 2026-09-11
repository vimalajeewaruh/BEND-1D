# Titration

The **Titration** signal contains three transitions with distinctly different characteristic widths. A weak Gaussian shoulder between the main equivalence regions represents a small complexation or indicator response.

## Mathematical Definition

For $0\leq x\leq1$,

```math
f(x)= 0.08\log(1+20x)
+0.55\tanh\!\left(\frac{x-0.31}{0.018}\right)+0.32\tanh\!\left(\frac{x-0.69}{0.060}\right)
+0.13\tanh\!\left(\frac{x-0.84}{0.014}\right)+0.07\exp\!\left[-\left(\frac{x-0.50}{0.028}\right)^2\right].
```

[View Titration signal](../../assets/images/TF022_Titration.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Multiple unequal smooth transitions |
| Signal type | Deterministic and nonstationary |
| Main transitions | Near $x=0.31$, $0.69$, and $0.84$ |
| Transition widths | 0.018, 0.060, and 0.014 |
| Weak feature | Gaussian shoulder near $x=0.50$ |
| Main challenge | Preserving sharp and broad transitions together with a weak shoulder |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $0.31,0.69,0.84$ | Transition centers | As shown |
| $0.018,0.060,0.014$ | Transition widths | As shown |
| $0.50$ | Shoulder center | 0.50 |
| $0.028$ | Shoulder width | 0.028 |

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

