# PercussiveAttackDecay


## Overview

The **PercussiveAttackDecay** signal has a very sharp onset, a mixture of fast and slow amplitude decay, and damped resonant ringing.

## Mathematical Definition

Let $t_0=0.18$, $u=(x-t_0)_+$, and

$$
a(x)=1.10I(x\ge t_0)[1-e^{-180u}].
$$

Then

$$
f(x)=a(x)[0.68e^{-7u}+0.32e^{-24u}]+0.18I(x\ge t_0)e^{-12u}\sin(2\pi\,58u).
$$

[PercussiveAttackDecay signal](../../assets/images/TF092_PercussiveAttackDecay.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Sharp attack and multirate decay |
| Onset | $t_0=0.18$ |
| Fine structure | Damped 58-cycle resonant component |
| Main challenge | Preserving an onset much sharper than its decay envelope |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $180$ | Attack rate | 180 |
| $7,24$ | Envelope decay rates | As shown |
| $12$ | Ringing decay rate | 12 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF092_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF092_python.md)



## Recommended Uses

- Audio-transient denoising
- Attack localization
- Resonant-tail preservation

## Provenance

**Status:** Percussive-acoustics-inspired deterministic surrogate.

---

[← Previous: InventoryStockout](TF091_InventoryStockout.md) | [Category 6 Catalog](index.md) | [Next: VibratoTone →](TF093_VibratoTone.md)
