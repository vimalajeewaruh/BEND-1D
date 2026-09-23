# MagnetarBurstStorm


## Overview

Unequal narrow bursts occur in clusters, with damped high-frequency ringing after the two strongest events. Several nearby bursts deliberately challenge temporal resolution.

## Mathematical Definition

Let $G(x;c,w)=e^{-((x-c)/w)^2/2}$. With centers $c_k$, amplitudes $a_k$, and widths $w_k$ listed in the code,
$$
f(x)=0.025\sin(6\pi x)+\sum_{k=1}^{7}a_kG(x;c_k,w_k)
+\sum_{j=1}^{2}I(x\ge r_j)b_je^{-22(x-r_j)}
\sin\{110\pi(x-r_j)\},
$$
where $r=(0.48,0.715)$ and $b=(0.18,0.12)$.

[MagnetarBurstStorm signal](../../assets/images/TF184_MagnetarBurstStorm.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | High-energy astrophysics |
| Structure | Sparse Gaussian bursts plus two causal ring-downs |
| Regularity | Smooth, sparse, and strongly nonstationary |
| Main challenge | Keep weak clustered events and their oscillatory tails |

## Parameters

| Parameter | Value |
|---|---|
| Burst centers | $0.16,0.28,0.295,0.48,0.67,0.715,0.83$ |
| Ring centers | $0.48,0.715$ |
| Ring frequency | $55$ cycles/unit |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF184_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF184_python.md)


## Recommended Uses

- Sparse transient recovery
- Cluster resolution
- Ring-down preservation

## Provenance

This is a deterministic benchmark surrogate inspired by high-energy astrophysics measurement morphology. It is not a calibrated physical or clinical simulator.

[← Previous: PulsarGlitchRecovery](TF183_PulsarGlitchRecovery.md) · [Category 10 catalog](index.md) · [Next: XrayQPODrift →](TF185_XrayQPODrift.md)

