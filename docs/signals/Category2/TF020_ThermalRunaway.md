# ThermalRunaway

The **ThermalRunaway** signal is a toy reactor trace containing an accelerating trend, a growing oscillatory instability, a sharp turnover, rapid post-critical cooling, and a small cooling undershoot.

## Mathematical Definition

Let $x_c=0.68$. Before the critical point, define

$$
b(x)=-\log\!\left(1-\frac{x}{x_c+0.035}\right)
$$

and

$$
f_{-}(x)=
b(x)+0.12\left(\frac{x}{x_c}\right)^3\sin(20\pi x),
\qquad x<x_c.
$$

Let

$$
f_c=
-\log\!\left(1-\frac{x_c}{x_c+0.035}\right)
+0.12\sin(20\pi x_c).
$$

The supplied specification states that the post-critical branch begins continuously at $f_c$, decays exponentially with rate 11, and includes a negative Gaussian centered at $x=0.80$. A convenient explicit implementation is

$$
f_{+}(x)=
f_c e^{-11(x-x_c)}
-A_q\exp\!\left[-\left(\frac{x-0.80}{w_q}\right)^2\right]
+A_q\exp\!\left[-\left(\frac{x_c-0.80}{w_q}\right)^2\right]e^{-11(x-x_c)},
$$

for $x\geq x_c$. The last term makes the post-critical branch exactly continuous at $x_c$. This page uses the implementation convention

$$
A_q=0.20,
\qquad
w_q=0.035.
$$

Thus

$$
f(x)=
\begin{cases}
f_{-}(x), & x<x_c,\\
f_{+}(x), & x\geq x_c.
\end{cases}
$$

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
| $11$ | Post-critical decay rate | 11 |
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
