# ThermalRunaway

The **ThermalRunaway** signal is a toy reactor trace containing an accelerating trend, a growing oscillatory instability, a sharp turnover, rapid post-critical cooling, and a small cooling undershoot.

## Mathematical Definition

Let $x_c$ denote the critical point. Before the critical point, define

```math
b(x)=-\log\left(1-\frac{x}{x_c+\delta}\right).
```

For $x<x_c$, define

```math
f_-(x)=
b(x)
+A_o\left(\frac{x}{x_c}\right)^3\sin(\omega x).
```

The value at the critical point is

```math
f_c=
-\log\left(1-\frac{x_c}{x_c+\delta}\right)
+A_o\sin(\omega x_c).
```

For $x\geq x_c$, define

```math
f_+(x)=
f_c e^{-\lambda(x-x_c)}
-A_q\exp\left[-\left(\frac{x-x_q}{w_q}\right)^2\right]
+A_q\exp\left[-\left(\frac{x_c-x_q}{w_q}\right)^2\right]
e^{-\lambda(x-x_c)}.
```

The final term ensures that the post-critical branch is continuous at $x=x_c$.

Thus, $f(x)=f_-(x)$ for $x<x_c$ and $f(x)=f_+(x)$ for $x\geq x_c$.


[ThermalRunaway signal](../../assets/images/TF020_ThermalRunaway.png)

> **Implementation note:** The original description does not specify the undershoot amplitude or width. The values above are explicit defaults and may be replaced by the authoritative values used to generate your reference signal.

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Accelerating trend with instability and quench |
| Signal type | Deterministic and nonstationary |
| Critical point | $x_c=0.68$ |
| Pre-critical behavior | Increasing trend and growing oscillation |
| Post-critical behavior | Rapid decay and negative undershoot |
| Main challenge | Preserving a structural turnover and weak instability together |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $x_c$ | Critical point | 0.68 |
| $\delta$ | Pre-critical offset | 0.035 |
| $A_o$ | Pre-critical oscillation amplitude | 0.12 |
| $\omega$ | Pre-critical angular frequency | $20\pi$ |
| $\lambda$ | Post-critical decay rate | 11 |
| $x_q$ | Undershoot center | 0.80 |
| $A_q$ | Undershoot amplitude | 0.20* |
| $w_q$ | Undershoot width | 0.035* |

\*Implementation convention; not fixed by the supplied definition.

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF020_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF020_python.md)



## Recommended Uses

- Critical-transition denoising
- Weak-instability preservation
- Trend and oscillation separation
- Quench and undershoot recovery

## Provenance

**Status:** Thermal-runaway-inspired deterministic reactor surrogate.

---

[← Previous: WaterHammer](TF019_WaterHammer.md) | [Category 2 Catalog](index.md) | [Next: Diffraction →](TF021_Diffraction.md)
