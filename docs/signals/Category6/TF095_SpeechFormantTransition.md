# SpeechFormantTransition


## Overview

The **SpeechFormantTransition** signal combines three oscillatory components whose frequencies move differently through time, under a smooth global and broad local envelope.

## Mathematical Definition

Let $s(x;c,w)=[1+e^{-(x-c)/w}]^{-1}$,

$$
E(x)=[s(x;0.07,0.025)-s(x;0.93,0.030)]
[0.78+0.22e^{-((x-0.58)/0.22)^2/2}],
$$

and

$$
\phi_1=2\pi(8x+7x^2),\quad
\phi_2=2\pi(22x-5x^2),\quad
\phi_3=2\pi(38x+4x^2).
$$

Then

$$
f(x)=E(x)[0.42\sin\phi_1+0.27\sin(\phi_2+0.3)+0.14\sin(\phi_3-0.5)].
$$

[SpeechFormantTransition signal](../../assets/images/TF095_SpeechFormantTransition.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Multiple nonstationary oscillatory bands |
| Frequency trends | Two increasing and one decreasing phase rate |
| Envelope | Smooth endpoints with broad emphasis near 0.58 |
| Main challenge | Preserving distributed, time-varying spectral structure |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $8,22,38$ | Base phase coefficients | As shown |
| $7,-5,4$ | Quadratic phase coefficients | As shown |
| $0.42,0.27,0.14$ | Band amplitudes | As shown |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF095_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF095_python.md)



## Recommended Uses

- Nonstationary speech-like denoising
- Moving-band preservation
- Time-frequency structure recovery

## Provenance

**Status:** Speech-formant-transition-inspired deterministic surrogate; not a recording.

---

[← Previous: ChordBeating](TF094_ChordBeating.md) | [Category 6 Catalog](index.md) | [Next: AudioIntro →](TF096_AudioIntro.md)
