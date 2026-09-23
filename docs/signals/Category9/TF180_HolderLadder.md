# Hölder Ladder


## Overview

Five localized profiles have identical nominal width and amplitude but different Hölder exponents. The construction moves from a sharp cusp-like center to progressively smoother local behavior, providing a controlled regularity diagnostic.

## Mathematical Definition

Let

$$
c=(0.10,0.29,0.49,0.69,0.89),
\qquad
\alpha=(0.25,0.50,1.00,1.50,2.50),
\qquad w=0.040.
$$

For sampled positions $x_i$, define

$$
z_{ik}=\frac{x_i-c_k}{w},
$$

$$
\psi_{ik}=e^{-z_{ik}^2/2}\left(1-0.62|z_{ik}|^{\alpha_k}\right),
\qquad
M_k=\max_i|\psi_{ik}|.
$$

The discrete test signal is

$$
f_i=0.42\sum_{k=1}^{5}\frac{\psi_{ik}}{M_k}.
$$

[Hölder Ladder](../../assets/images/TF180_HolderLadder.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Controlled regularity diagnostic |
| Signal type | Five normalized localized profiles |
| Controlled variable | Hölder exponent $0.25$ to $2.50$ |
| Constant properties | Nominal width and peak normalization |
| Main challenge | Adapt to different local smoothness levels |

## Parameters

| Center | Hölder exponent |
|---:|---:|
| $0.10$ | $0.25$ |
| $0.29$ | $0.50$ |
| $0.49$ | $1.00$ |
| $0.69$ | $1.50$ |
| $0.89$ | $2.50$ |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF0180_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF0180_python.md)



## Recommended Uses

- Local regularity adaptation
- Hölder-smoothness diagnostics
- Comparing threshold behavior across singularity strengths

## Provenance

This is a deliberately artificial regularity diagnostic. The sample-wise normalization is part of the definition.

[← Previous: Equal-Energy Scale Ladder](TF179_EqualEnergyScaleLadder.md) · [Category 9 catalog](index.md) · [Benchmarking role →](benchmarking-role.md)
