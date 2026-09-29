# VasospasmTCD

## Overview

Define the phase

```math
\phi(x)=2\pi[f_0x+a_\phi\sin(\omega_\phi x)],
```

and the periodic pulse component

```math
p(x)=
a_1\sin\phi(x)
+a_2\sin[2\phi(x)-\delta_2]
+a_3\sin[3\phi(x)-\delta_3].
```

The smooth onset is

```math
o(x)=\frac{1}{1+e^{-k(x-x_c)}}.
```

The complete signal is

```math
f(x)=
b_0+b_1p(x)
+o(x)[b_2+b_3p(x)]
+A_s\sin(\omega_s x).
```


[VasospasmTCD signal](../../assets/images/TF028_VasospasmTCD.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Periodic waveform with gradual pathological onset |
| Persistent structure | Cardiac pulsatility |
| Onset center | $x=x_c$ |
| Post-onset change | Increased mean level and pulse amplitude |
| Main challenge | Preserving repeated pulses while localizing the smooth change |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $f_0$ | Nominal cardiac frequency | 9 |
| $a_\phi$ | Phase-modulation amplitude | 0.06 |
| $\omega_\phi$ | Phase-modulation angular frequency | $1.6\pi$ |
| $a_1$ | Fundamental pulse amplitude | 0.55 |
| $a_2$ | Second-harmonic amplitude | 0.23 |
| $\delta_2$ | Second-harmonic phase shift | 0.55 |
| $a_3$ | Third-harmonic amplitude | 0.10 |
| $\delta_3$ | Third-harmonic phase shift | 1 |
| $x_c$ | Onset center | 0.56 |
| $k$ | Onset sharpness | 65 |
| $b_0$ | Baseline level | 0.35 |
| $b_1$ | Pre-onset pulse scale | 0.18 |
| $b_2$ | Post-onset level increase | 0.48 |
| $b_3$ | Post-onset pulse-scale increase | 0.18 |
| $A_s$ | Additional oscillation amplitude | 0.035 |
| $\omega_s$ | Additional angular frequency | $2.2\pi$ |


## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF028_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF011_python.md)



## Recommended Uses

- Smooth pathological-onset detection
- Pulsatile-flow denoising
- Joint level and amplitude-change recovery
- Repeated-waveform preservation

## Provenance

**Status:** Transcranial-Doppler-inspired deterministic physiological surrogate.

---

[← Previous: NasonPleth](TF027_NasonPleth.md) | [Category 3 Catalog](index.md) | [Next: PVCTrain →](TF029_PVCTrain.md)
