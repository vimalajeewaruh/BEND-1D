# Hölder Ladder


## Overview

The **HolderLadder** signal contains five localized profiles with identical nominal width and amplitude but different Hölder exponents. The construction moves from a sharp cusp-like center to progressively smoother local behavior, providing a controlled regularity diagnostic.

## Mathematical Definition

Let the feature centers be

```math
\mathbf{c}
=
(0.10,\,0.29,\,0.49,\,0.69,\,0.89),
```

with corresponding Hölder exponents

```math
\boldsymbol{\alpha}
=
(0.25,\,0.50,\,1.00,\,1.50,\,2.50).
```

For sampled positions $x_i$, define the standardized coordinate

```math
z_{ik}
=
\frac{x_i-c_k}{w},
\qquad
k=1,\ldots,K.
```

Define the unnormalized localized profile by

```math
\psi_{ik}
=
e^{-z_{ik}^2/2}
\left(
1-\gamma |z_{ik}|^{\alpha_k}
\right).
```

For each profile, define its discrete normalization factor by

```math
M_k
=
\max_i |\psi_{ik}|.
```

The discrete test signal is

```math
f_i
=
A
\sum_{k=1}^{K}
\frac{\psi_{ik}}{M_k}.
```

[View Hölder Ladder](../../assets/images/TF180_HolderLadder.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Controlled regularity diagnostic |
| Signal type | $K$ normalized localized profiles |
| Controlled variable | Hölder exponent $\alpha_k$ |
| Regularity range | $\alpha_k$ from $0.25$ to $2.50$ |
| Constant properties | Common nominal width $w$ and normalized amplitude $A$ |
| Local behavior | Progresses from sharp cusp-like to increasingly smooth profiles |
| Main challenge | Adapting to different local smoothness levels |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $K$ | Number of localized profiles | 5 |
| $\mathbf{c}$ | Profile centers | $(0.10,\,0.29,\,0.49,\,0.69,\,0.89)$ |
| $\boldsymbol{\alpha}$ | Hölder exponents | $(0.25,\,0.50,\,1.00,\,1.50,\,2.50)$ |
| $w$ | Common nominal width | 0.040 |
| $\gamma$ | Shape coefficient | 0.62 |
| $A$ | Common normalized amplitude | 0.42 |
| $M_k$ | Discrete normalization factor | $\max_i|\psi_{ik}|$ |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF180_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF180_python.md)



## Recommended Uses

- Local regularity adaptation
- Hölder-smoothness diagnostics
- Comparing threshold behavior across singularity strengths

## Provenance

This is a deliberately artificial regularity diagnostic. The sample-wise normalization is part of the definition.

[← Previous: Equal-Energy Scale Ladder](TF179_EqualEnergyScaleLadder.md) · [Category 9 catalog](index.md) · [Benchmarking role →](benchmarking-role.md)
