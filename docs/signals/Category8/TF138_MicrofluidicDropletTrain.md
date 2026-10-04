# MicrofluidicDropletTrain


## Overview

The **MicrofluidicDropletTrain** signal contains nine droplet-like pulses with unequal amplitudes and widths, including a close doublet, one broad coalesced event, and one very weak droplet.

## Mathematical Definition

Define the Gaussian function

```math
g(x;c,w)=
\exp\left[
-\frac12\left(\frac{x-c}{w}\right)^2
\right].
```

Define the droplet component

```math
P(x)=
\sum_{k=1}^{K}
a_k g(x;c_k,w_k).
```

The signal is

```math
f(x)=b_0+P(x).
```

The droplet centers, amplitudes, and widths are

```math
\mathbf{c}
=
(0.10,\,0.20,\,0.30,\,0.405,\,0.435,\,0.58,\,0.70,\,0.82,\,0.92),
```

```math
\mathbf{a}
=
(0.45,\,0.50,\,0.47,\,0.44,\,0.39,\,0.76,\,0.12,\,0.49,\,0.46),
```

```math
\mathbf{w}
=
(0.015,\,0.014,\,0.016,\,0.013,\,0.013,\,0.030,\,0.012,\,0.015,\,0.014).
```

[View MicrofluidicDropletTrain signal](../../assets/images/TF138_MicrofluidicDropletTrain.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Unequal pulse train with doublet and coalescence |
| Droplet events | $K$ localized pulses with unequal amplitudes and widths |
| Close doublet | Centers at $c_4$ and $c_5$ |
| Coalesced event | Broad, high-amplitude pulse centered at $c_6$ |
| Weak droplet | Low-amplitude pulse centered at $c_7$ |
| Main challenge | Accurate event counting across unequal scales |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $b_0$ | Baseline level | 0.03 |
| $K$ | Number of droplet events | 9 |
| $\mathbf{c}$ | Droplet centers | $(0.10,\,0.20,\,0.30,\,0.405,\,0.435,\,0.58,\,0.70,\,0.82,\,0.92)$ |
| $\mathbf{a}$ | Droplet amplitudes | $(0.45,\,0.50,\,0.47,\,0.44,\,0.39,\,0.76,\,0.12,\,0.49,\,0.46)$ |
| $\mathbf{w}$ | Droplet widths | $(0.015,\,0.014,\,0.016,\,0.013,\,0.013,\,0.030,\,0.012,\,0.015,\,0.014)$ |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF138_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF138_python.md)


## Recommended Uses

- Microfluidic-sensor denoising
- Droplet counting
- Doublet and weak-event resolution

## Provenance

**Status:** Microfluidic-droplet-sensing-inspired deterministic surrogate.

---

[← Previous: SatelliteReactionWheel](TF137_SatelliteReactionWheel.md) | [Category 8 Catalog](index.md) | [Next: TerahertzLayerEcho →](TF139_TerahertzLayerEcho.md)
