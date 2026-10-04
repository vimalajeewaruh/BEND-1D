# CoughFlowBurst


## Overview

The **CoughFlowBurst** signal represents an explosive primary cough-flow onset followed by two smaller bursts and an irregularly modulated decay.

## Mathematical Definition

Let the burst centers, amplitudes, and shape powers be

```math
\mathbf{c}
=
(0.28,\,0.405,\,0.53),
```

```math
\mathbf{a}
=
(1.00,\,0.48,\,0.32),
```

and

```math
\mathbf{p}
=
(1.2,\,1.4,\,1.1).
```

For each $k=1,\ldots,K$, let

```math
u_k=x-c_k.
```

For $x\geq c_k$, define the causal burst response by

```math
r_k(x)=
\left(
\frac{u_k}{\tau_k}
\right)^{p_k}
\exp\left(
p_k-\frac{u_k}{\tau_k}
\right),
```

with $r_k(x)=0$ for $x<c_k$.

Define the combined cough bursts by

```math
B(x)=
\sum_{k=1}^{K}a_kr_k(x).
```

Define the oscillatory modulation by

```math
M(x)=
1+A_M\sin(2\pi f_Mx).
```

The signal is

```math
f(x)=
B(x)M(x).
```

[View Cough Flow Burst](../../assets/images/TF204_CoughFlowBurst.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Respiratory physiology |
| Structure | Three causal generalized gamma-like bursts with oscillatory modulation |
| Burst behavior | Dominant primary burst followed by two weaker secondary events |
| Decay behavior | Asymmetric burst tails with superimposed rapid modulation |
| Regularity | Sharp asymmetric onsets and extended tails |
| Main challenge | Preserving the high-dynamic-range onset and weak secondary events |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $K$ | Number of cough bursts | 3 |
| $\mathbf{c}$ | Burst centers | $(0.28,\,0.405,\,0.53)$ |
| $\mathbf{a}$ | Burst amplitudes | $(1.00,\,0.48,\,0.32)$ |
| $\boldsymbol{\tau}$ | Burst time scales | Specified in implementation |
| $\mathbf{p}$ | Shape powers | $(1.2,\,1.4,\,1.1)$ |
| $A_M$ | Modulation amplitude | 0.08 |
| $f_M$ | Modulation frequency | 23 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF204_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF204_python.md)



## Recommended Uses

- Respiratory-burst denoising
- Secondary-event preservation
- Asymmetric tail recovery

## Provenance

This is a deterministic benchmark surrogate inspired by respiratory physiology measurement morphology. It is not a calibrated physical or clinical simulator.

[← Previous: PupilLightReflex](TF203_PupilLightReflex.md) · [Category 10 catalog](index.md) · [Next: DesaturationRecovery →](TF205_DesaturationRecovery.md)

