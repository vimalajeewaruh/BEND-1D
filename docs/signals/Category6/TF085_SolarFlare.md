# SolarFlare

## Overview

The **SolarFlare** signal includes three weak precursors, an impulsive logistic rise, a two-rate post-peak decay, and a smaller late excursion.

## Mathematical Definition

Define the smooth step

```math
s(x;c,w)=\left[1+e^{-(x-c)/w}\right]^{-1},
```

and the Gaussian feature

```math
g(x;c,w)=
\exp\left[
-\frac12\left(\frac{x-c}{w}\right)^2
\right].
```

Define the precursor component

```math
p(x)=\sum_{k=1}^{K}a_k g(x;c_k,w_k).
```

The precursor centers, amplitudes, and widths are

```math
\mathbf{c}=(0.30,\,0.345,\,0.385),
```

```math
\mathbf{a}=(0.08,\,0.12,\,0.07),
```

```math
\mathbf{w}=(0.010,\,0.007,\,0.006).
```

Define the pre-peak signal, for $x<x_P$, as

```math
f_{\mathrm{pre}}(x)
=
b_0+p(x)
+A_Fs(x;c_F,w_F)
+A_Lg(x;c_L,w_L).
```

Define the post-peak signal, for $x\geq x_P$, as

```math
f_{\mathrm{post}}(x)
=
b_0
+A_Se^{-\alpha_S(x-x_P)}
+A_De^{-\alpha_D(x-x_P)}
+A_Lg(x;c_L,w_L).
```

The signal is $f(x)=f_{\mathrm{pre}}(x)$ for $x<x_P$ and
$f(x)=f_{\mathrm{post}}(x)$ for $x\geq x_P$.

[View SolarFlare signal](../../assets/images/TF085_SolarFlare.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Precursors, impulsive event, and multirate decay |
| Precursor region | Approximately $c_1<x<c_3$ |
| Main event | Rapid rise near $x=c_F$ followed by transition at $x=x_P$ |
| Post-peak behavior | Superposition of slow and fast exponential decay |
| Late excursion | Weak Gaussian feature centered at $x=c_L$ |
| Main challenge | Retaining weak precursors next to a dominant flare |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $b_0$ | Baseline level | 0.08 |
| $K$ | Number of precursor features | 3 |
| $\mathbf{c}$ | Precursor centers | As specified |
| $\mathbf{a}$ | Precursor amplitudes | As specified |
| $\mathbf{w}$ | Precursor widths | As specified |
| $A_F$ | Main flare-rise amplitude | 0.90 |
| $c_F$ | Flare-rise center | 0.46 |
| $w_F$ | Flare-rise transition width | 0.008 |
| $x_P$ | Post-peak transition time | 0.49 |
| $A_S$ | Slow-decay amplitude | 0.58 |
| $\alpha_S$ | Slow decay rate | 5.2 |
| $A_D$ | Fast-decay amplitude | 0.32 |
| $\alpha_D$ | Fast decay rate | 18 |
| $A_L$ | Late-excursion amplitude | 0.055 |
| $c_L$ | Late-excursion center | 0.64 |
| $w_L$ | Late-excursion width | 0.018 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF085_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF085_python.md)



## Recommended Uses

- Flare-profile denoising
- Precursor recovery
- Multirate-decay preservation

## Provenance

**Status:** Solar-flare-morphology-inspired deterministic surrogate.

---

[← Previous: MicrolensingPlanet](TF084_MicrolensingPlanet.md) | [Category 6 Catalog](index.md) | [Next: QuasarFlare →](TF086_QuasarFlare.md)
