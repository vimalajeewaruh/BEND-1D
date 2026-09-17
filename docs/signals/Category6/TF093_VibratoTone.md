# VibratoTone


## Overview

The **VibratoTone** signal has a smooth attack and release, periodic frequency modulation of its carrier, and simultaneous slower amplitude modulation.

## Mathematical Definition

Let $s(x;c,w)=[1+e^{-(x-c)/w}]^{-1}$ and

$$
E(x)=s(x;0.12,0.025)-s(x;0.88,0.035),
$$

$$
\phi(x)=2\pi[30x+0.75\sin(2\pi\,5.5x)],\qquad
A(x)=0.72+0.14\sin(2\pi\,2.2x).
$$

The signal is $f(x)=E(x)A(x)\sin\phi(x)$.

[VibratoTone signal](../../assets/images/TF093_VibratoTone.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Frequency- and amplitude-modulated oscillation |
| Envelope | Smooth onset near 0.12 and release near 0.88 |
| Carrier | 30-cycle nominal tone with 5.5-cycle vibrato |
| Main challenge | Preserving coherent modulation rather than isolated features |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $30$ | Nominal carrier cycles | 30 |
| $5.5$ | Vibrato cycles | 5.5 |
| $2.2$ | Amplitude-modulation cycles | 2.2 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF093_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF093_python.md)



## Recommended Uses

- Modulated-tone denoising
- Instantaneous-frequency preservation
- Smooth-envelope recovery

## Provenance

**Status:** Musical-vibrato-inspired deterministic surrogate.

---

[← Previous: PercussiveAttackDecay](TF092_PercussiveAttackDecay.md) | [Category 6 Catalog](index.md) | [Next: ChordBeating →](TF094_ChordBeating.md)
