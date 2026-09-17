# AudioIntro


## Overview

The **AudioIntro** signal is an original generic musical-intro surrogate with ambient motion, successive bass and harmonic entries, repeated percussive attacks, and a mild chirped crescendo.

## Mathematical Definition

Let $s(x;c,w)=[1+e^{-(x-c)/w}]^{-1}$ and

$$
\mathcal C=(0.420,0.505,0.590,0.675,0.760,0.845,0.930).
$$

Then

$$
\begin{aligned}
f(x)={}&0.04\sin(8\pi x)+0.14s(x;0.18,0.020)\sin(18\pi x)\\
&+0.12s(x;0.38,0.025)\sin(46\pi x+0.4)\\
&+\sum_{c\in\mathcal C}0.20I(x\ge c)e^{-70(x-c)}\sin[2\pi\,70(x-c)]\\
&+0.10x\sin[2\pi(14x+5x^2)].
\end{aligned}
$$

[AudioIntro signal](../../assets/images/TF096_AudioIntro.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Layered tonal and transient structure |
| Entries | Ambient, bass, and harmonic layers |
| Transients | Seven damped percussive attacks |
| Main challenge | Preserving simultaneous smooth, oscillatory, and impulsive components |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $0.18,0.38$ | Layer-entry locations | As shown |
| $\mathcal C$ | Percussive beat centers | As above |
| $70$ | Percussive frequency and decay rate | 70 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF096_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF096_python.md)



## Recommended Uses

- Layered-audio denoising
- Transient and tone preservation
- Multicomponent smoothing evaluation

## Provenance

**Status:** Original generic audio surrogate; not a reproduction of a copyrighted recording.

---

[← Previous: SpeechFormantTransition](TF095_SpeechFormantTransition.md) | [Category 6 Catalog](index.md) | [Next: MilankovitchCycles →](TF097_MilankovitchCycles.md)
