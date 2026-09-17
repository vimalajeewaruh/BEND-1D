# ChordBeating


## Overview

The **ChordBeating** signal sums three nearby or related tones beneath a smooth audio envelope, producing interference and a slowly varying beat pattern.

## Mathematical Definition

Let

$$
E(x)=s(x;0.10,0.030)-s(x;0.90,0.040),\qquad
s(x;c,w)=[1+e^{-(x-c)/w}]^{-1}.
$$

Then

$$
f(x)=E(x)[0.42\sin(2\pi\,27x)+0.39\sin(2\pi\,29x+0.2)+0.23\sin(2\pi\,41x-0.4)].
$$

[ChordBeating signal](../../assets/images/TF094_ChordBeating.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Multitone oscillation with beating |
| Tone frequencies | 27, 29, and 41 cycles |
| Envelope | Smooth onset and release |
| Main challenge | Retaining carriers and their low-frequency interference pattern |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $27,29,41$ | Component cycle counts | As shown |
| $0.42,0.39,0.23$ | Component amplitudes | As shown |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF094_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF094_python.md)



## Recommended Uses

- Multitone denoising
- Beat-envelope preservation
- Close-frequency separation

## Provenance

**Status:** Musical-chord-and-beating-inspired deterministic surrogate.

---

[← Previous: VibratoTone](TF093_VibratoTone.md) | [Category 6 Catalog](index.md) | [Next: SpeechFormantTransition →](TF095_SpeechFormantTransition.md)
