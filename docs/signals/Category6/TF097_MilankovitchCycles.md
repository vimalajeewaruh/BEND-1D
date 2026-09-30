# MilankovitchCycles


## Overview

The **MilankovitchCycles** signal combines eccentricity-, obliquity-, and amplitude-modulated precession-like cycles with a finite-duration climatic transition.

## Mathematical Definition

## Mathematical Definition

Let the normalized coordinate $x$ correspond to physical time

```math
t=Tx,
```

where $T$ is the total time span in kyr.

Define the smooth step

```math
s(x;c,w)=\left[1+e^{-(x-c)/w}\right]^{-1}.
```

Define the eccentricity-like component

```math
e(x)=A_e
\sin\left(
2\pi\frac{t}{P_e}+\delta_e
\right).
```

Define the obliquity-like component

```math
o(x)=A_o
\sin\left(
2\pi\frac{t}{P_o}+\delta_o
\right).
```

Define the amplitude-modulated precession-like component

```math
p(x)=
A_p
\left[
1+m_p
\sin\left(
2\pi\frac{t}{P_e}+\delta_m
\right)
\right]
\sin\left(
2\pi\frac{t}{P_p}+\delta_p
\right).
```

Define the finite regime-event component

```math
R(x)=
A_R
\left[
s(x;c_1,w_1)-s(x;c_2,w_2)
\right].
```

The signal is

```math
f(x)=e(x)+o(x)+p(x)+R(x).
```

[View MilankovitchCycles signal](../../assets/images/TF097_MilankovitchCycles.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Quasiperiodic multiscale cycles plus regime event |
| Analog periods | $P_e$, $P_o$, and $P_p$ |
| Modulation | Precession-like component modulated at the $P_e$ timescale |
| Transition | Finite interval approximately $c_1<x<c_2$ |
| Main challenge | Preserving localized change within persistent quasiperiodicity |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $T$ | Total time span in kyr | 500 |
| $A_e$ | Eccentricity-like amplitude | 0.25 |
| $P_e$ | Eccentricity-like period in kyr | 100 |
| $\delta_e$ | Eccentricity-like phase shift | 0.2 |
| $A_o$ | Obliquity-like amplitude | 0.16 |
| $P_o$ | Obliquity-like period in kyr | 41 |
| $\delta_o$ | Obliquity-like phase shift | -0.6 |
| $A_p$ | Precession-like amplitude | 0.10 |
| $P_p$ | Precession-like period in kyr | 23 |
| $\delta_p$ | Precession-like phase shift | 0.4 |
| $m_p$ | Precession amplitude-modulation depth | 0.55 |
| $\delta_m$ | Modulation phase shift | 0.7 |
| $A_R$ | Regime-event amplitude | 0.18 |
| $c_1,c_2$ | Regime-event boundaries | 0.62, 0.71 |
| $w_1,w_2$ | Regime-event transition widths | 0.008, 0.025 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF097_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF097_python.md)



## Recommended Uses

- Paleoclimate-series denoising
- Quasiperiodic component preservation
- Local regime-event recovery

## Provenance

**Status:** Milankovitch-cycle-inspired deterministic paleoclimate surrogate.

---

[← Previous: AudioIntro](TF096_AudioIntro.md) | [Category 6 Catalog](index.md) | [Next: TurbiditeSequence →](TF098_TurbiditeSequence.md)
