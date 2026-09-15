# PowerGridFault

## Overview

The **PowerGridFault** signal is a periodic power-system waveform interrupted by a voltage sag and localized bipolar fault transient. A damped high-frequency recovery begins when the sag ends.

## Mathematical Definition

Let $s(x;c,w)=[1+e^{-(x-c)/w}]^{-1}$ and $W(x)=s(x;0.35,0.003)-s(x;0.58,0.004)$. With $u=(x-0.58)_+$,

$$
\begin{aligned}
f(x)={}&[1-0.42W(x)]\sin(56\pi x)
-0.85e^{-\frac12((x-0.355)/0.0028)^2}\\
&+0.48e^{-\frac12((x-0.365)/0.0045)^2}
+0.23\mathbf{1}_{\{x\geq0.58\}}e^{-18u}\sin(104\pi u).
\end{aligned}
$$

[PowerGridFault signal](../../assets/images/TF071_PowerGridFault.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Periodic carrier with fault interval and ring-down |
| Sag interval | Approximately $0.35<x<0.58$ |
| Fault transient | Near $x=0.355$–$0.365$ |
| Main challenge | Preserving transient and recovery without distorting carrier |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Samples | 1024 |
| $28$ | Carrier frequency | 28 |
| $52$ | Recovery frequency | 52 |

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

