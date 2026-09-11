# RabiChirp

The **RabiChirp** signal is a toy population probability for a chirped two-level quantum system. Its instantaneous oscillation frequency increases with $x$, while decoherence causes its amplitude to decrease. Fine-scale structure is therefore weakest where a denoising method is most likely to remove it.

## Mathematical Definition

For $0\leq x\leq1$,

```math
f(x)=
e^{-0.9x}
\sin^2\left[2\pi(3x+7x^2)\right].
```

The phase is

$$
\theta(x)=2\pi(3x+7x^2),
$$

so its derivative increases linearly:

$$
\theta'(x)=2\pi(3+14x).
$$

[View RabiChirp signal](../../assets/images/TF023_RabiChirp.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Chirp with decaying amplitude |
| Signal type | Deterministic, oscillatory, and nonstationary |
| Frequency behavior | Increases with $x$ |
| Amplitude behavior | Decreases as $e^{-0.9x}$ |
| Continuity | Smooth |
| Main challenge | Retaining weak high-frequency structure late in the interval |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $0.9$ | Decoherence rate | 0.9 |
| $3$ | Linear phase coefficient | 3 |
| $7$ | Quadratic phase coefficient | 7 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF023_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF023_python.md)



## Recommended Uses

- Chirp denoising
- Time-varying frequency recovery
- Weak fine-scale preservation
- Decohering-oscillation analysis

## Provenance

**Status:** Chirped two-level-system-inspired deterministic surrogate.

---

[← Previous: Titration](TF022_Titration.md) | [Category 2 Catalog](index.md) | [Next: MuscleTwitch →](TF024_MuscleTwitch.md)

