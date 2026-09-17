# MilankovitchCycles


## Overview

The **MilankovitchCycles** signal combines eccentricity-, obliquity-, and amplitude-modulated precession-like cycles with a finite-duration climatic transition.

## Mathematical Definition

Let $t=500x$ kyr and $s(x;c,w)=[1+e^{-(x-c)/w}]^{-1}$. Define

$$
e(x)=0.25\sin(2\pi t/100+0.2),\qquad
o(x)=0.16\sin(2\pi t/41-0.6),
$$

$$
p(x)=0.10[1+0.55\sin(2\pi t/100+0.7)]\sin(2\pi t/23+0.4).
$$

Then

$$
f(x)=e(x)+o(x)+p(x)+0.18[s(x;0.62,0.008)-s(x;0.71,0.025)].
$$

[MilankovitchCycles signal](../../assets/images/TF097_MilankovitchCycles.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Quasiperiodic multiscale cycles plus regime event |
| Analog periods | 100, 41, and 23 kyr |
| Transition | Finite interval near 0.62–0.71 |
| Main challenge | Preserving localized change within persistent quasiperiodicity |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $500$ | Total time span in kyr | 500 |
| $100,41,23$ | Cycle periods in kyr | As shown |
| $0.18$ | Transition amplitude | 0.18 |

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
