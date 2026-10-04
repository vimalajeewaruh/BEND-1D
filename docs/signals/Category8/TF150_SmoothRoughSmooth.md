# SmoothRoughSmooth


## Overview

The **SmoothRoughSmooth** stress test transitions from a smooth low-frequency region to a finite interval with three high-frequency components, then returns to a smooth regime.

## Mathematical Definition

Define the smooth step

```math
S(x;c,w)=
\left[1+e^{-(x-c)/w}\right]^{-1}.
```

Define the rough-region window

```math
W(x)=
S(x;c_1,w_S)-S(x;c_2,w_S).
```

Define the smooth left-region component

```math
L(x)=
b_0+A_L\sin(2\pi f_Lx).
```

Define the smooth right-region component

```math
R(x)=
b_0+A_R\cos\left[2\pi f_R(x-c_2)\right].
```

Define the rough oscillatory component

```math
q(x)=
A_1\sin(2\pi f_1x)
+
A_2\sin(2\pi f_2x+\delta_2)
+
A_3\sin(2\pi f_3x+\delta_3).
```

The signal is

```math
f(x)=
L(x)\left[1-S(x;c_1,w_S)\right]
+
W(x)\left[b_0+q(x)\right]
+
R(x)S(x;c_2,w_S).
```

[View SmoothRoughSmooth signal](../../assets/images/TF150_SmoothRoughSmooth.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Smooth–rough–smooth transition |
| Left region | Smooth low-frequency oscillation |
| Rough interval | Approximately $c_1$ to $c_2$ |
| Rough scales | Three oscillatory components with frequencies $f_1$, $f_2$, and $f_3$ |
| Right region | Smooth low-frequency oscillation |
| Transitions | Controlled by common transition width $w_S$ |
| Main challenge | The optimal smoothing level changes abruptly across the record |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $b_0$ | Common baseline level | 0.20 |
| $c_1$ | Rough-region onset | 0.33 |
| $c_2$ | Rough-region offset | 0.68 |
| $w_S$ | Transition width | 0.008 |
| $A_L$ | Left-region oscillation amplitude | 0.22 |
| $f_L$ | Left-region frequency | 2 |
| $A_R$ | Right-region oscillation amplitude | 0.18 |
| $f_R$ | Right-region frequency | 2 |
| $A_1$ | First rough-component amplitude | 0.16 |
| $f_1$ | First rough-component frequency | 17 |
| $A_2$ | Second rough-component amplitude | 0.08 |
| $f_2$ | Second rough-component frequency | 41 |
| $\delta_2$ | Second rough-component phase offset | 0.3 |
| $A_3$ | Third rough-component amplitude | 0.04 |
| $f_3$ | Third rough-component frequency | 91 |
| $\delta_3$ | Third rough-component phase offset | -0.2 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF150_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF150_python.md)


## Recommended Uses

- Spatially adaptive smoothing tests
- Rough-window localization
- Multiband structure preservation

## Provenance

**Status:** Deliberately artificial MishMash stress test.

---

[← Previous: LacunaryCascade](TF149_LacunaryCascade.md) | [Category 8 Catalog](index.md) | [Next: PeakOnPeak →](TF151_PeakOnPeak.md)
