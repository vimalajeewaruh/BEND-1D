# EEGSeizureOnset

## Overview

The **EEGSeizureOnset** signal begins with low-amplitude background activity, includes a weak precursor, develops a finite growing-frequency oscillatory episode, and ends with post-event suppression.

## Mathematical Definition

Let $S(x;c,w)=[1+e^{-(x-c)/w}]^{-1}$ and

$$
E(x)=S(x;0.42,0.05)-S(x;0.82,0.03),\qquad
\phi(x)=2\pi(12x+12x^2).
$$

Then

$$
\begin{aligned}
f(x)={}&0.035\sin(10\pi x)+0.018\sin(18\pi x+0.6)\\
&+0.38E(x)\sin\phi(x)+0.18e^{-((x-0.36)/0.008)^2/2}\\
&-0.06S(x;0.84,0.015).
\end{aligned}
$$

[EEGSeizureOnset signal](../../assets/images/TF131_EEGSeizureOnset.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Weak precursor, oscillatory onset, and suppression |
| Precursor | Narrow peak near $x=0.36$ |
| Seizure-like episode | Approximately 0.42–0.82 |
| Main challenge | Preserving the weak early precursor beside stronger later activity |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $0.38$ | Episode amplitude | 0.38 |
| $12$ | Quadratic phase coefficient | 12 |
| $-0.06$ | Post-event suppression | -0.06 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF0131_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF0131_python.md)



## Recommended Uses

- EEG denoising
- Weak-precursor preservation
- Oscillatory-onset localization

## Provenance

**Status:** Seizure-onset-EEG-inspired deterministic surrogate; not a clinical simulator.

---

[← Previous: WearableGaitIMU](TF130_WearableGaitIMU.md) | [Category 8 Catalog](index.md) | [Next: MRFreeInductionDecay →](TF132_MRFreeInductionDecay.md)
