# DiffusionBand

The **DiffusionBand** signal represents a finite band bounded by two smooth diffusive interfaces. The left boundary is sharper than the right boundary, mimicking a concentration or temperature band whose interfaces have experienced different amounts of diffusion.

## Mathematical Definition

```math
f(x)=
\frac{1}{2}
\left\{
\mathrm{erf}
\left(
\frac{x-0.28}{0.025}
\right)
-\mathrm{erf}
\left(
\frac{x-0.72}{0.070}
\right)
\right\}.
```

[View DiffusionBand signal](../../assets/images/TF005_DiffusionBand.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Piecewise-smooth and plateau structure |
| Secondary tags | Smooth interfaces, asymmetric edges, finite band |
| Continuity | Continuous |
| Differentiability | Smooth |
| Left transition width | 0.025 |
| Right transition width | 0.070 |
| Main challenge | Preserving two edges with different sharpness |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $\mu_L$ | Left-interface location | 0.28 |
| $w_L$ | Left-interface width | 0.025 |
| $\mu_R$ | Right-interface location | 0.72 |
| $w_R$ | Right-interface width | 0.070 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF005_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF005_python.md)


## Recommended Uses

- Recovery of smooth plateau boundaries
- Comparison of sharp and diffuse transition preservation
- Testing edge-location bias
- Detection of artificial steps near smooth interfaces

## Provenance

**Status:** Diffusion-inspired deterministic morphology surrogate.

---

[← Previous: RingDown](TF004_RingDown.md) | [Signal Catalog](index.md) | [Next: Fano →](TF006_Fano.md)
