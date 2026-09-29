# RotorRub

## Overview

The **RotorRub** signal begins with smooth periodic rotor motion. Whenever the trajectory exceeds a contact threshold, nonlinear clipping mimics intermittent rubbing against a stationary component, generating repeated cusps and harmonic distortion.

## Mathematical Definition

Define

$$
\phi(x)=2\pi[f_0x+A_\phi\sin(\omega_\phi x)]
$$

and the unconstrained rotor trajectory

$$
z(x)=\sin\phi(x)+A_2\sin(2\phi(x))-\delta.
$$

The contact component is

$$
c(x)=\max\{z(x)-z_c,0\}.
$$

The complete signal is

$$
f(x)=z(x)-\gamma c(x)+A_3\sin(3\phi(x))+b.
$$

[View RotorRub signal](../../assets/images/TF037_RotorRub.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Periodic motion with nonlinear contact |
| Dominant rotation | Approximately $f_0$ cycles |
| Contact threshold | $z=z_c$ |
| Local regularity | Repeated cusps at contact entry and exit |
| Main challenge | Preserving periodicity together with nonlinear clipping |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $f_0$ | Nominal rotor frequency | 7 |
| $A_\phi$ | Phase-modulation amplitude | 0.035 |
| $\omega_\phi$ | Phase-modulation angular frequency | $1.8\pi$ |
| $A_2$ | Second-harmonic amplitude | 0.16 |
| $\delta$ | Rotor trajectory offset | 0.5 |
| $z_c$ | Contact threshold | 0.48 |
| $\gamma$ | Contact correction weight | 0.78 |
| $A_3$ | Third-harmonic amplitude | 0.09 |
| $b$ | Signal offset | 0.3 |
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

