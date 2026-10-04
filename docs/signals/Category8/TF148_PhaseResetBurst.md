# PhaseResetBurst


## Overview

The **PhaseResetBurst** stress test applies an abrupt phase reset to a nearly stationary oscillation without a large amplitude jump, then adds a short high-frequency packet.

## Mathematical Definition

Define the smooth step

```math
S(x;c,w)=
\left[1+e^{-(x-c)/w}\right]^{-1}.
```

Define the phase-reset oscillation

```math
R(x)=
A_R
\sin\left[
2\pi f_Rx+
\Delta\phi\,S(x;c_R,w_R)
\right].
```

Define the localized high-frequency packet

```math
B(x)=
A_B
\exp\left[
-\frac12\left(\frac{x-c_B}{w_B}\right)^2
\right]
\sin(2\pi f_Bx).
```

The signal is

```math
f(x)=R(x)+B(x).
```

[View PhaseResetBurst signal](../../assets/images/TF148_PhaseResetBurst.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Abrupt phase reset plus localized fast packet |
| Background oscillation | Nearly stationary oscillation with frequency $f_R$ |
| Phase reset | Rapid phase transition centered at $c_R$ with magnitude $\Delta\phi$ |
| Burst | Localized high-frequency packet centered at $c_B$ |
| Main challenge | Detecting phase change without relying on amplitude discontinuity |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $A_R$ | Background-oscillation amplitude | 0.28 |
| $f_R$ | Background-oscillation frequency | 18 |
| $\Delta\phi$ | Phase-reset magnitude | 0.95 radians |
| $c_R$ | Phase-reset location | 0.48 |
| $w_R$ | Phase-reset transition width | 0.003 |
| $A_B$ | Burst amplitude | 0.20 |
| $c_B$ | Burst center | 0.67 |
| $w_B$ | Burst width | 0.035 |
| $f_B$ | Burst frequency | 70 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF148_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF148_python.md)


## Recommended Uses

- Phase-reset detection
- High-frequency packet preservation
- Phase-sensitive shrinkage evaluation

## Provenance

**Status:** Deliberately artificial MishMash stress test.

---

[← Previous: FrequencyCrossing](TF147_FrequencyCrossing.md) | [Category 8 Catalog](index.md) | [Next: LacunaryCascade →](TF149_LacunaryCascade.md)
