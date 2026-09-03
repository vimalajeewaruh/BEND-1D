# ECGBeat
The **ECGBeat** signal is an idealized electrocardiographic trace constructed from signed Gaussian components representing the P, Q, R, S, and T waves. Two unequal beats are placed in $[0,1]$, producing a mixture of broad low-frequency components and narrow QRS features.

## Mathematical Definition

For each beat, the waveform is

```math
f(x) =
\sum_{\ell}
A_\ell
\exp
\left\{
-\frac{(x-\mu_\ell)^2}{2s_\ell^2}
\right\}.
```

Relative to each R-wave location, the P, Q, R, S, and T offsets are $(-0.15,-0.025,0,0.025,0.16),$ with amplitudes $(0.15,-0.12,1,-0.25,0.32)$ and widths $(0.035,0.010,0.008,0.012,0.060).$

For two beats with R-wave locations $r_j$ and beat-specific scale factors $c_j$, the complete signal may be written as

```math
f(x) =
\sum_{j=1}^{2}c_j
\sum_{\ell=1}^{5}
A_\ell
\exp
\left\{
-\frac{(x-r_j-o_\ell)^2}{2s_\ell^2}
\right\},
```

where $o_\ell$ denotes the component offset.

[View ECGBeat signal](../../assets/images/TF014_ECGBeat.png)

> **Specification note:** The supplied definition states that two unequal beats are used but does not specify the two R-wave locations or their relative scale factors. These values must be fixed before the signal is frozen as a fully reproducible canonical benchmark.

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Repeated motifs and event trains |
| Secondary tags | Physiological cycle, multiscale peaks, signed components |
| Repeated events | Two unequal beats |
| Narrowest component | R wave, width 0.008 |
| Broadest component | T wave, width 0.060 |
| Main challenge | Preserving narrow QRS features and broad P/T waves |

## Parameters

| Component | Offset from R | Amplitude | Width |
|---|---:|---:|---:|
| P | $-0.15$ | 0.15 | 0.035 |
| Q | $-0.025$ | $-0.12$ | 0.010 |
| R | 0 | 1.00 | 0.008 |
| S | 0.025 | $-0.25$ | 0.012 |
| T | 0.16 | 0.32 | 0.060 |

## MATLAB Implementation

~~~matlab
function f = ECGBeatSignal(x,rLocations,beatScales)
% rLocations and beatScales must each contain two values.

offsets = [-0.15 -0.025 0 0.025 0.16];
amplitudes = [0.15 -0.12 1 -0.25 0.32];
widths = [0.035 0.010 0.008 0.012 0.060];
f = zeros(size(x));

for j = 1:2
    for ell = 1:5
        mu = rLocations(j)+offsets(ell);
        f = f + beatScales(j)*amplitudes(ell)* ...
            exp(-(x-mu).^2/(2*widths(ell)^2));
    end
end
end
~~~

After the canonical R-wave locations and scale factors are selected, save the plot as **TF014_ECGBeat.png**.

## Python Implementation

~~~python
import numpy as np

def ecg_beat_signal(x, r_locations, beat_scales):
    """Generate two ECG-like beats with specified R locations and scales."""
    offsets = np.array([-0.15, -0.025, 0, 0.025, 0.16])
    amplitudes = np.array([0.15, -0.12, 1, -0.25, 0.32])
    widths = np.array([0.035, 0.010, 0.008, 0.012, 0.060])
    f = np.zeros_like(x, dtype=float)

    for r, scale in zip(r_locations, beat_scales):
        for offset, amplitude, width in zip(offsets, amplitudes, widths):
            mu = r+offset
            f += scale*amplitude*np.exp(-(x-mu)**2/(2*width**2))
    return f
~~~

## Recommended Uses

- Recovery of narrow QRS features
- Preservation of broad P and T waves
- Denoising of repeated but unequal motifs
- Testing simultaneous recovery across multiple intrinsic widths

## Provenance

**Status:** ECG-inspired deterministic morphology surrogate, not a clinical ECG simulator.

---

[← Previous: ActionPotential](TF013_ActionPotential.md) | [Signal Catalog](index.md) | [Next: VanHove →](TF015_VanHove.md)
