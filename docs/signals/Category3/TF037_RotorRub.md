# RotorRub

## Overview

The **RotorRub** signal begins with smooth periodic rotor motion. Whenever the trajectory exceeds a contact threshold, nonlinear clipping mimics intermittent rubbing against a stationary component, generating repeated cusps and harmonic distortion.

## Mathematical Definition

Define

$$
\phi(x)=2\pi\left[7x+0.035\sin(1.8\pi x)\right]
$$

and the unconstrained rotor trajectory

$$
z(x)=\sin\phi(x)+0.16\sin\{2\phi(x)-0.5\}.
$$

The contact component is

$$
c(x)=\max\{z(x)-0.48,0\}.
$$

The complete signal is

$$
f(x)=z(x)-0.78c(x)+0.09\sin\{3\phi(x)+0.3\}.
$$

[RotorRub signal](../../assets/images/TF037_RotorRub.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Periodic motion with nonlinear contact |
| Dominant rotation | Approximately 7 cycles |
| Contact threshold | $z=0.48$ |
| Local regularity | Repeated cusps at contact entry and exit |
| Main challenge | Preserving periodicity together with nonlinear clipping |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $7$ | Nominal rotor frequency | 7 |
| $0.48$ | Contact threshold | 0.48 |
| $0.78$ | Contact correction weight | 0.78 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF037_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF037_python.md)



## Recommended Uses

- Contact-nonlinearity detection
- Periodic cusp preservation
- Rotor-condition monitoring
- Harmonic-distortion recovery

## Provenance

**Status:** Rotor-rub-inspired deterministic mechanical surrogate.

---

[← Previous: GearDefect](TF036_GearDefect.md) | [Category 3 Catalog](index.md) | [Next: VortexLockIn →](TF038_VortexLockIn.md)

