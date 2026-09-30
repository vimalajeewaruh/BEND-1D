# PercussiveAttackDecay


## Overview

The **PercussiveAttackDecay** signal has a very sharp onset, a mixture of fast and slow amplitude decay, and damped resonant ringing.

## Mathematical Definition

Let the onset time be $t_0$ and define

```math
u=(x-t_0)_+.
```

For $x\geq t_0$, define the sharp attack envelope as

```math
a(x)=A_A\left[1-e^{-\alpha_Au}\right],
```

with $a(x)=0$ for $x<t_0$.

Define the multirate decay envelope

```math
D(x)=
w_1e^{-\alpha_1u}
+w_2e^{-\alpha_2u}.
```

The primary percussive component is

```math
P(x)=a(x)D(x).
```

For $x\geq t_0$, define the damped resonant component as

```math
R(x)=
A_Re^{-\alpha_Ru}
\sin(2\pi f_Ru),
```

with $R(x)=0$ for $x<t_0$.

The signal is

```math
f(x)=P(x)+R(x).
```

[View PercussiveAttackDecay signal](../../assets/images/TF092_PercussiveAttackDecay.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Sharp attack and multirate decay |
| Onset | $x=t_0$ |
| Attack | Rapid rise controlled by $\alpha_A$ |
| Decay | Mixture of slow and fast exponential components |
| Fine structure | Damped resonant component with frequency $f_R$ |
| Main challenge | Preserving an onset much sharper than its decay envelope |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $t_0$ | Onset time | 0.18 |
| $A_A$ | Attack amplitude | 1.10 |
| $\alpha_A$ | Attack rate | 180 |
| $w_1,w_2$ | Multirate decay weights | 0.68, 0.32 |
| $\alpha_1,\alpha_2$ | Envelope decay rates | 7, 24 |
| $A_R$ | Resonant-component amplitude | 0.18 |
| $\alpha_R$ | Ringing decay rate | 12 |
| $f_R$ | Resonant frequency | 58 |

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
