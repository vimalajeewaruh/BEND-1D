# DroughtRecovery


## Overview

The **DroughtRecovery** signal declines slowly and nonlinearly over most of the record, then undergoes a comparatively rapid but incomplete recovery followed by a small late correction.

## Mathematical Definition

Define the logistic transition

```math
L(x;c,w)=
\left[1+e^{-(x-c)/w}\right]^{-1}.
```

Define the long nonlinear decline by

```math
D(x)=
b_0-A_Dx^{p_D}.
```

Define the rapid recovery by

```math
R(x)=
A_RL(x;c_R,w_R).
```

Define the late correction by

```math
C(x)=
-A_CL(x;c_C,w_C).
```

The signal is

```math
f(x)=
D(x)+R(x)+C(x).
```

[View Drought Recovery](../../assets/images/TF220_DroughtRecovery.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Hydroclimate |
| Structure | Power-law decline with two opposing logistic changes |
| Decline behavior | Slow nonlinear decrease governed by $A_D$ and $p_D$ |
| Recovery behavior | Rapid but incomplete upward transition centered at $c_R$ |
| Late behavior | Small downward correction centered at $c_C$ |
| Regularity | Smooth with a concentrated recovery threshold |
| Main challenge | Preserving the recovery onset without biasing the long decline |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $b_0$ | Initial baseline level | 1 |
| $A_D$ | Decline coefficient | 0.62 |
| $p_D$ | Decline power | 1.35 |
| $A_R$ | Recovery magnitude | 0.37 |
| $c_R$ | Recovery center | 0.78 |
| $w_R$ | Recovery transition width | 0.018 |
| $A_C$ | Late-correction magnitude | 0.08 |
| $c_C$ | Late-correction center | 0.92 |
| $w_C$ | Late-correction width | 0.03 |
## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF220_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF220_python.md)



## Recommended Uses

- Nonlinear-trend smoothing
- Recovery-threshold detection
- Long-range bias assessment

## Provenance

This is a deterministic benchmark surrogate inspired by hydroclimate measurement morphology. It is not a calibrated physical or environmental simulator.

[← Previous: HeatwaveFrontBreak](TF219_HeatwaveFrontBreak.md) · [Category 10 catalog](index.md) · [Next: ENSOEnvelope →](TF221_ENSOEnvelope.md)

