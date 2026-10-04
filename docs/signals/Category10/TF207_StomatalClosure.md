# StomatalClosure


## Overview

The **StomatalClosure** signal represents a delayed sharp closure response followed by slower incomplete reopening and a weak overshoot-like depression.

## Mathematical Definition

Define the logistic transition

```math
L(x;c,w)=
\left[1+e^{-(x-c)/w}\right]^{-1}.
```

Define the Gaussian profile

```math
G(x;c,w)=
\exp\left[
-\frac{1}{2}
\left(
\frac{x-c}{w}
\right)^2
\right].
```

Define the closure response by

```math
C(x)=
-A_C L(x;c_C,w_C).
```

Define the slower reopening response by

```math
R(x)=
A_R L(x;c_R,w_R).
```

Define the local depression by

```math
D(x)=
-A_D G(x;c_D,w_D).
```

The signal is

```math
f(x)=
b_0+C(x)+R(x)+D(x).
```

[View Stomatal Closure](../../assets/images/TF207_StomatalClosure.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Plant physiology |
| Structure | Opposing logistic transitions plus a Gaussian depression |
| Closure behavior | Sharp delayed decrease centered at $c_C$ |
| Reopening behavior | Slower partial recovery centered at $c_R$ |
| Local behavior | Weak depression near $c_D$ modifies the post-closure profile |
| Regularity | Smooth but strongly asymmetric |
| Main challenge | Preserving threshold timing, local depression, and incomplete recovery |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $b_0$ | Initial baseline level | 1 |
| $A_C$ | Closure magnitude | 0.62 |
| $c_C$ | Closure center | 0.39 |
| $w_C$ | Closure transition width | 0.020 |
| $A_R$ | Reopening magnitude | 0.30 |
| $c_R$ | Reopening center | 0.79 |
| $w_R$ | Reopening transition width | 0.055 |
| $A_D$ | Depression amplitude | 0.06 |
| $c_D$ | Depression center | 0.50 |
| $w_D$ | Depression width | 0.055 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF207_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF207_python.md)



## Recommended Uses

- Threshold-response recovery
- Asymmetric transition smoothing
- Weak overshoot preservation

## Provenance

This is a deterministic benchmark surrogate inspired by plant physiology measurement morphology. It is not a calibrated physical or clinical simulator.

[← Previous: OJIPFluorescence](TF206_OJIPFluorescence.md) · [Category 10 catalog](index.md) · [Next: SapFlowLag →](TF208_SapFlowLag.md)

