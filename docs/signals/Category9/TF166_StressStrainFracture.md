# Stress–Strain Fracture


## Overview

This piecewise stress–strain surrogate moves through elastic loading, a short yield plateau, strain hardening, softening, and abrupt fracture. It combines slope changes with a large terminal discontinuity.

## Mathematical Definition

For $0\le x\le1$,

$$
f(x)=
\begin{cases}
4x, & x<0.18,\\
0.72+0.035\dfrac{x-0.18}{0.34-0.18}, & 0.18\le x<0.34,\\
0.755+0.30u+0.055u^2,\quad u=\dfrac{x-0.34}{0.72-0.34}, & 0.34\le x<0.72,\\
1.11-0.22v-0.03v^2,\quad v=\dfrac{x-0.72}{0.90-0.72}, & 0.72\le x<0.90,\\
0.15+0.04e^{-18(x-0.90)}, & x\ge0.90.
\end{cases}
$$

[Stress–Strain Fracture](../../assets/images/TF166_StressStrainFracture.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Piecewise constitutive curve |
| Regimes | Elastic, yield, hardening, softening, fracture |
| Singular structure | Slope changes and terminal jump |
| Dominant event | Fracture at $x=0.90$ |
| Main challenge | Preserve both regime boundaries and the abrupt failure |

## Parameters

| Boundary | $0.18$ | $0.34$ | $0.72$ | $0.90$ |
|---|---:|---:|---:|---:|
| Interpretation | Yield onset | Hardening onset | Softening onset | Fracture |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF166_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF166_python.md)



## Recommended Uses

- Edge and kink preservation
- Constitutive-curve smoothing
- Abrupt-failure localization

## Provenance

This deterministic curve is a qualitative materials-testing surrogate, not a calibrated constitutive law.

[← Previous: Turbulence Intermittency](TF165_TurbulenceIntermittency.md) · [Category 9 catalog](index.md) · [Next: Nanoindentation Pop-In →](TF167_NanoindentationPopIn.md)
