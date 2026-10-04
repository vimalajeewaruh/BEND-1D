# ATACChromatinAccessibility


## Overview

The **ATACChromatinAccessibility** signal places six narrow regulatory-like peaks within three broad accessibility regions of unequal scale.

## Mathematical Definition

Define the Gaussian function

```math
g(x;c,w)=
\exp\left[
-\frac12\left(\frac{x-c}{w}\right)^2
\right].
```

Define the background component

```math
B(x)=
b_0+A_B\sin(2\pi f_Bx).
```

Define the broad accessibility regions

```math
R(x)=
\sum_{k=1}^{K}
a_k g(x;c_k,w_k).
```

Define the narrow accessibility peaks

```math
P(x)=
\sum_{j=1}^{J}
b_j g(x;d_j,w_P).
```

The signal is

```math
f(x)=B(x)+R(x)+P(x).
```

The broad-region centers, amplitudes, and widths are

```math
\mathbf{c}
=
(0.20,\,0.52,\,0.77),
```

```math
\mathbf{a}
=
(0.22,\,0.30,\,0.18),
```

```math
\mathbf{w}
=
(0.070,\,0.085,\,0.060).
```

The narrow-peak centers and amplitudes are

```math
\mathbf{d}
=
(0.18,\,0.235,\,0.49,\,0.54,\,0.705,\,0.79),
```

```math
\mathbf{b}
=
(0.16,\,0.12,\,0.20,\,0.10,\,0.08,\,0.15).
```

[View ATACChromatinAccessibility signal](../../assets/images/TF133_ATACChromatinAccessibility.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Broad regions containing narrow peaks |
| Broad regions | $K$ smooth components with centers specified by $\mathbf{c}$ |
| Broad scales | Widths ranging from 0.060 to 0.085 |
| Narrow peaks | $J$ localized components with centers specified by $\mathbf{d}$ |
| Narrow scale | Common width $w_P$ |
| Main challenge | Recovering regional and localized genomic structure together |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $b_0$ | Baseline accessibility level | 0.06 |
| $A_B$ | Background oscillation amplitude | 0.018 |
| $f_B$ | Background oscillation frequency | 4 |
| $K$ | Number of broad accessibility regions | 3 |
| $\mathbf{c}$ | Broad-region centers | $(0.20,\,0.52,\,0.77)$ |
| $\mathbf{a}$ | Broad-region amplitudes | $(0.22,\,0.30,\,0.18)$ |
| $\mathbf{w}$ | Broad-region widths | $(0.070,\,0.085,\,0.060)$ |
| $J$ | Number of narrow accessibility peaks | 6 |
| $\mathbf{d}$ | Narrow-peak centers | $(0.18,\,0.235,\,0.49,\,0.54,\,0.705,\,0.79)$ |
| $\mathbf{b}$ | Narrow-peak amplitudes | $(0.16,\,0.12,\,0.20,\,0.10,\,0.08,\,0.15)$ |
| $w_P$ | Common narrow-peak width | 0.007 |
## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF133_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF133_python.md)



## Recommended Uses

- Chromatin-accessibility smoothing
- Broad/narrow scale separation
- Weak regulatory-peak preservation

## Provenance

**Status:** ATAC-seq-accessibility-profile-inspired deterministic genomic surrogate.

---

[← Previous: MRFreeInductionDecay](TF132_MRFreeInductionDecay.md) | [Category 8 Catalog](index.md) | [Next: WindTurbineGustControl →](TF134_WindTurbineGustControl.md)
