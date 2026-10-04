# DSC Phase Transitions


## Overview

The **DSCPhaseTransitions** signal is a differential-scanning-calorimetry surrogate that combines baseline drift, a small heat-capacity step, and unequal positive and negative transition peaks. A weak secondary shoulder near the broad negative feature tests sensitivity to nearby low-amplitude structure.

## Mathematical Definition

Define the smooth logistic transition

```math
L(x;c,w)=
\left[1+e^{-(x-c)/w}\right]^{-1}.
```

Define the Gaussian function

```math
g(x;c,w)=
\exp\left[
-\frac12
\left(
\frac{x-c}{w}
\right)^2
\right].
```

Define the drifting background

```math
B(x)=
b_0+mx.
```

Define the heat-capacity step

```math
S(x)=
-A_S L(x;c_S,w_S).
```

Define the positive transition peak

```math
P(x)=
A_P g(x;c_P,w_P).
```

Define the broad negative transition

```math
N(x)=
-A_N g(x;c_N,w_N).
```

Define the weak negative shoulder

```math
H(x)=
-A_H g(x;c_H,w_H).
```

The signal is

```math
f(x)=
B(x)+S(x)+P(x)+N(x)+H(x).
```

[View DSC Phase Transitions](../../assets/images/TF168_DSCPhaseTransitions.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Analytical transition profile |
| Background | Linear drift with a smooth negative step |
| Positive event | Narrow positive transition centered at $c_P$ |
| Negative event | Broad negative transition centered at $c_N$ |
| Weak feature | Smaller negative shoulder centered at $c_H$ |
| Scale mixture | Broad transition accompanied by a weaker nearby shoulder |
| Main challenge | Preserving signed peaks and nearby secondary structure |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $b_0$ | Baseline level | 0.08 |
| $m$ | Baseline slope | 0.10 |
| $A_S$ | Heat-capacity step magnitude | 0.095 |
| $c_S$ | Step center | 0.23 |
| $w_S$ | Step transition width | 0.012 |
| $A_P$ | Positive-peak amplitude | 0.48 |
| $c_P$ | Positive-peak center | 0.46 |
| $w_P$ | Positive-peak width | 0.030 |
| $A_N$ | Broad negative-peak magnitude | 0.42 |
| $c_N$ | Broad negative-peak center | 0.74 |
| $w_N$ | Broad negative-peak width | 0.060 |
| $A_H$ | Negative-shoulder magnitude | 0.12 |
| $c_H$ | Negative-shoulder center | 0.825 |
| $w_H$ | Negative-shoulder width | 0.028 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF168_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF168_python.md)



## Recommended Uses

- Thermal-analysis curve denoising
- Signed peak and shoulder preservation
- Baseline-plus-transition separation

## Provenance

This deterministic function is inspired by qualitative DSC measurements and is not tied to a particular substance or temperature program.

[← Previous: Nanoindentation Pop-In](TF167_NanoindentationPopIn.md) · [Category 9 catalog](index.md) · [Next: TGA Decomposition →](TF169_TGADecomposition.md)
