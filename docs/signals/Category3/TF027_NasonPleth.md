# NasonPleth

The **NasonPleth** signal represents inductance plethysmography during recovery after general anesthesia. It contains relatively regular breathing on both sides of a strongly disturbed central interval. If `ipd.csv` is supplied, the empirical trace is interpolated to the requested grid; otherwise, the deterministic fallback below is used.

## Mathematical Definition

For the deterministic fallback, define $\phi(x)=2\pi\left[10.5x+0.20\sin(1.5\pi x)\right]$

and the mildly modulated breathing component

```math
r(x)=\left[0.92+0.10\sin(1.1\pi x)\right]
\left[\sin\phi(x)+0.18\sin\{2\phi(x)-0.45\}\right].
```

The disturbed-interval window is

```math
w(x)=\exp\!\left[-\frac12\left(\frac{x-0.51}{0.105}\right)^2\right],
```

and its irregular component is

$$
d(x)=0.48w(x)\sin\{2\pi(4.1x+1.6x^2)+0.6\}+0.25w(x)\sin(62\pi x)+0.14w(x)\sin(106\pi x+0.8).
$$

The fallback signal is

```math
f(x)=\left[1-0.88w(x)\right]r(x)+d(x).
```

When `ipd.csv` is available, the last finite data column is mapped to $[0,1]$ using a shape-preserving cubic interpolant.

[View NasonPleth signal](../../assets/images/TF027_NasonPleth.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Quasi-periodic activity with a disturbed interval |
| Signal type | Empirical when available; otherwise deterministic |
| Central disturbance | Gaussian-localized near $x=0.51$ |
| Background | Mildly modulated respiratory oscillation |
| Main challenge | Preserving regular breathing and localized irregular activity |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of output samples | 1024 |
| $0.51$ | Disturbed-interval center | 0.51 |
| $0.105$ | Disturbed-window width | 0.105 |
| `ipd.csv` | Optional empirical data source | Not required |

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
