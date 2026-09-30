# PowerGridFault

## Overview

The **PowerGridFault** signal is a periodic power-system waveform interrupted by a voltage sag and localized bipolar fault transient. A damped high-frequency recovery begins when the sag ends.

## Mathematical Definition

Define the smooth step

```math
s(x;c,w)=\left[1+e^{-(x-c)/w}\right]^{-1}.
```

Define the fault-window component

```math
W(x)=s(x;c_1,w_1)-s(x;c_2,w_2).
```

With

```math
u=(x-c_2)_+,
```

define the modulated carrier

```math
C(x)=\left[1-A_WW(x)\right]\sin(2\pi f_Cx).
```

Define the fault transient components

```math
T_1(x)=-A_1\exp\left[
-\frac12\left(\frac{x-\mu_1}{s_1}\right)^2
\right],
```

```math
T_2(x)=A_2\exp\left[
-\frac12\left(\frac{x-\mu_2}{s_2}\right)^2
\right].
```

Define the recovery ring-down, for $x\geq c_2$, as

```math
R(x)=A_Re^{-\alpha_Ru}\sin(2\pi f_Ru),
```

with $R(x)=0$ for $x<c_2$.

The signal is

```math
f(x)=C(x)+T_1(x)+T_2(x)+R(x).
```


[View PowerGridFault signal](../../assets/images/TF071_PowerGridFault.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Periodic carrier with fault interval and ring-down |
| Sag interval | Approximately $c_1<x<c_2$ |
| Fault transient | Near $x=\mu_1$ to $x=\mu_2$ |
| Main challenge | Preserving transient and recovery without distorting carrier |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $f_C$ | Carrier frequency | 28 |
| $A_W$ | Sag magnitude | 0.42 |
| $c_1,c_2$ | Sag boundaries | 0.35, 0.58 |
| $w_1,w_2$ | Sag boundary widths | 0.003, 0.004 |
| $A_1$ | First transient magnitude | 0.85 |
| $\mu_1$ | First transient center | 0.355 |
| $s_1$ | First transient width | 0.0028 |
| $A_2$ | Second transient magnitude | 0.48 |
| $\mu_2$ | Second transient center | 0.365 |
| $s_2$ | Second transient width | 0.0045 |
| $A_R$ | Ring-down amplitude | 0.23 |
| $\alpha_R$ | Ring-down decay rate | 18 |
| $f_R$ | Ring-down frequency | 52 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF071_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF071_python.md)



## Recommended Uses

- Power-quality denoising
- Fault and sag localization
- Ring-down preservation

## Provenance

**Status:** Power-grid-fault-inspired deterministic engineering surrogate.

---

[Category 6 Catalog](index.md) | [Next: GearboxDefect →](TF072_GearboxDefect.md)

