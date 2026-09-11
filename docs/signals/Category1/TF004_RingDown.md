# RingDown

The **RingDown** signal is a localized underdamped response beginning at $x=0.28$. Its oscillation amplitude decreases exponentially after onset. Similar morphology occurs in mechanical vibration, acoustic decay, resonant circuits, and magnetic-resonance transients.

## Mathematical Definition

$$f(x)=
I(x\geq0.28)
\exp[-7(x-0.28)]
\sin[32\pi(x-0.28)],
$$

where $I(\cdot)$ is the indicator function.

[View RingDown signal](../../assets/images/TF004_RingDown.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Transients and ring-downs |
| Secondary tags | Localized, oscillatory, damped |
| Onset location | $x=0.28$ |
| Continuity | Continuous at onset |
| Envelope | Exponential decay |
| Main challenge | Preserving localization, phase, and decreasing amplitude |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $x_0$ | Onset location | 0.28 |
| $7$ | Exponential decay rate | 7 |
| $32\pi$ | Angular-frequency coefficient | $32\pi$ |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF004_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF004_python.md)



## Recommended Uses

- Localized oscillation recovery
- Estimation of onset, frequency, and damping
- Testing preservation of low-amplitude late oscillations
- Detection of phase distortion and artificial ringing

## Provenance

**Status:** Application-inspired deterministic morphology surrogate.

---

[← Previous: StickSlip](TF003_StickSlip.md) | [Signal Catalog](index.md) | [Next: DiffusionBand →](TF005_DiffusionBand.md)
