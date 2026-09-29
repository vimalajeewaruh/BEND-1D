# NasonPleth

The **NasonPleth** signal represents inductance plethysmography during recovery after general anesthesia. It contains relatively regular breathing on both sides of a strongly disturbed central interval. If `ipd.csv` is supplied, the empirical trace is interpolated to the requested grid; otherwise, the deterministic fallback below is used.

## Mathematical Definition

For the deterministic fallback, define the phase

```math
\phi(x)=2\pi[a_1x+a_2\sin(\omega_\phi x)].
```

Define the mildly modulated breathing component

```math
r(x)=
[b_0+b_1\sin(\omega_b x)]
[\sin\phi(x)+b_2\sin(2\phi(x)-\delta)].
```

The disturbed-interval window is

```math
w(x)=
\exp\left[
-\frac{1}{2}
\left(\frac{x-x_c}{\sigma}\right)^2
\right].
```

Its irregular component is

```math
d(x)=
A_1w(x)\sin[2\pi(c_1x+c_2x^2)]
+A_2
+A_3w(x)\sin(\omega_1x)
+A_4w(x)\sin(\omega_2x+\psi).
```

The fallback signal is

```math
f(x)=[1-\gamma w(x)]r(x)+d(x).
```

When `ipd.csv` is available, the last finite data column is mapped to $[0,1]$ using a shape-preserving cubic interpolant.


[View NasonPleth signal](../../assets/images/TF027_NasonPleth.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Quasi-periodic activity with a disturbed interval |
| Signal type | Empirical when available; otherwise deterministic |
| Central disturbance | Gaussian-localized near $x=x_c$ |
| Background | Mildly modulated respiratory oscillation |
| Main challenge | Preserving regular breathing and localized irregular activity |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of output samples | 1024 |
| $a_1$ | Linear phase coefficient | 10.5 |
| $a_2$ | Phase modulation amplitude | 0.20 |
| $\omega_\phi$ | Phase modulation frequency | $1.5\pi$ |
| $b_0$ | Breathing baseline amplitude | 0.92 |
| $b_1$ | Breathing amplitude modulation | 0.10 |
| $\omega_b$ | Breathing modulation frequency | $1.1\pi$ |
| $b_2$ | Harmonic amplitude | 0.18 |
| $\delta$ | Harmonic phase shift | 0.45 |
| $x_c$ | Disturbed-interval center | 0.51 |
| $\sigma$ | Disturbed-window width | 0.105 |
| $A_1$ | Irregular chirp amplitude | 0.48 |
| $c_1$ | Irregular linear phase coefficient | 4.1 |
| $c_2$ | Irregular quadratic phase coefficient | 1.6 |
| $A_2$ | Disturbance offset | 0.6 |
| $A_3$ | First high-frequency amplitude | 0.25 |
| $\omega_1$ | First high-frequency coefficient | $62\pi$ |
| $A_4$ | Second high-frequency amplitude | 0.14 |
| $\omega_2$ | Second high-frequency coefficient | $106\pi$ |
| $\psi$ | Second high-frequency phase shift | 0.8 |
| $\gamma$ | Background attenuation strength | 0.88 |

> **Optional data source:** `ipd.csv`. When available, the empirical data are used in place of the deterministic fallback.
## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF027_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF027_python.md)


## Recommended Uses

- Disturbed-interval detection
- Quasi-periodic physiological denoising
- Transition between regular and irregular oscillations
- Empirical-versus-surrogate robustness checks

## Provenance

**Status:** Optional empirical plethysmography trace with a deterministic documented fallback.

---

[Category 3 Catalog](index.md) | [Next: VasospasmTCD →](TF028_VasospasmTCD.md)
