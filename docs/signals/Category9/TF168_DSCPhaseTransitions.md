# DSC Phase Transitions


## Overview

This differential-scanning-calorimetry surrogate combines baseline drift, a small heat-capacity step, and unequal positive and negative transition peaks. A weak secondary shoulder near the broad negative feature tests sensitivity to nearby low-amplitude structure.

## Mathematical Definition

With

$$
L(x;c,w)=\frac{1}{1+e^{-(x-c)/w}},
\qquad
g(x;c,w)=e^{-\frac12((x-c)/w)^2},
$$

the signal is

$$
f(x)=0.08+0.10x-0.095L(x;0.23,0.012)
+0.48g(x;0.46,0.030)-0.42g(x;0.74,0.060)
-0.12g(x;0.825,0.028).
$$

[DSC Phase Transitions](../../assets/images/TF168_DSCPhaseTransitions.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Analytical transition profile |
| Background | Linear drift with a smooth step |
| Peaks | One narrow positive and two overlapping negative events |
| Scale mixture | Broad transition plus weak shoulder |
| Main challenge | Preserve signed peaks and nearby secondary structure |

## Parameters

| Feature | Center | Width | Amplitude |
|---|---:|---:|---:|
| Positive peak | $0.46$ | $0.030$ | $0.48$ |
| Broad negative peak | $0.74$ | $0.060$ | $-0.42$ |
| Negative shoulder | $0.825$ | $0.028$ | $-0.12$ |

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
