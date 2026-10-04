# QubitRamseyWander


## Overview

The **QubitRamseyWander** signal is a Ramsey-like fringe with slow phase wander, decreasing visibility, and a localized collapse and recovery of contrast.

## Mathematical Definition

Define the Gaussian profile

```math
G(x;c,w)=
\exp\left[
-\frac12
\left(
\frac{x-c}{w}
\right)^2
\right].
```

Define the visibility envelope by

```math
V(x)=
\left(
V_0-m_Vx
\right)
\left[
1-A_DG(x;c_D,w_D)
\right].
```

Define the oscillatory phase by

```math
\phi(x)=
2\pi
\left(
a_1x+a_2x^2
\right)
+
A_M\sin(2\pi f_Mx).
```

The signal is

```math
f(x)=
V(x)\cos\left[\phi(x)\right].
```

[View Qubit Ramsey Wander](../../assets/images/TF186_QubitRamseyWander.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Quantum sensing |
| Primary family | Visibility- and phase-modulated oscillation |
| Structure | Phase-modulated fringe with a Gaussian visibility dip |
| Visibility behavior | Gradual global decrease with localized collapse and recovery |
| Phase behavior | Polynomial drift with additional slow modulation |
| Regularity | Smooth oscillation with locally weak amplitude |
| Main challenge | Preserving weak fringes inside the low-visibility region |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $V_0$ | Initial visibility | 0.92 |
| $m_V$ | Visibility decay slope | 0.35 |
| $A_D$ | Visibility-dip depth | 0.78 |
| $c_D$ | Visibility-dip center | 0.56 |
| $w_D$ | Visibility-dip width | 0.055 |
| $a_1$ | Linear phase coefficient | 8 |
| $a_2$ | Quadratic phase coefficient | 2.8 |
| $A_M$ | Phase-wander amplitude | 0.55 |
| $f_M$ | Phase-wander frequency | 1.4 |
## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF186_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF186_python.md)



## Recommended Uses

- Weak-fringe preservation
- Phase-drift recovery
- Spatially varying SNR tests

## Provenance

This is a deterministic benchmark surrogate inspired by quantum sensing measurement morphology. It is not a calibrated physical or clinical simulator.

[← Previous: XrayQPODrift](TF185_XrayQPODrift.md) · [Category 10 catalog](index.md) · [Next: JosephsonPhaseSlips →](TF187_JosephsonPhaseSlips.md)

