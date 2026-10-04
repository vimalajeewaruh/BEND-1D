# PhotoacousticAline


## Overview

The **PhotoacousticAline** signal contains six bipolar absorber responses of unequal amplitude and width. Two responses are deliberately close and deeper responses are attenuated.

## Mathematical Definition

For $k=1,\ldots,K$, define the standardized distance

```math
z_k=\frac{x-c_k}{w_k}.
```

Define the bipolar absorber response

```math
P_k(x)=
a_k(1-z_k^2)e^{-z_k^2/2}.
```

Define the depth-attenuation factor

```math
D(x)=e^{-\alpha x}.
```

The signal is

```math
f(x)=
D(x)\sum_{k=1}^{K}P_k(x).
```

The absorber locations, amplitudes, and widths are

```math
\mathbf{c}
=
(0.16,\,0.33,\,0.515,\,0.535,\,0.72,\,0.88),
```

```math
\mathbf{a}
=
(0.35,\,0.52,\,0.95,\,0.70,\,0.42,\,0.20),
```

```math
\mathbf{w}
=
(0.010,\,0.012,\,0.008,\,0.008,\,0.014,\,0.010).
```

[View PhotoacousticAline signal](../../assets/images/TF127_PhotoacousticAline.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Unequal bipolar responses with depth attenuation |
| Absorber responses | $K$ localized bipolar features |
| Close pair | Centers at $c_3$ and $c_4$ |
| Depth attenuation | Response magnitude decreases according to $e^{-\alpha x}$ |
| Deep response | Weakest absorber centered at $c_6$ |
| Main challenge | Resolving nearby sources without erasing attenuated responses |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $K$ | Number of absorber responses | 6 |
| $\alpha$ | Depth-attenuation rate | 0.45 |
| $\mathbf{c}$ | Absorber locations | $(0.16,\,0.33,\,0.515,\,0.535,\,0.72,\,0.88)$ |
| $\mathbf{a}$ | Response amplitudes | $(0.35,\,0.52,\,0.95,\,0.70,\,0.42,\,0.20)$ |
| $\mathbf{w}$ | Response widths | $(0.010,\,0.012,\,0.008,\,0.008,\,0.014,\,0.010)$ |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF127_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF127_python.md)



## Recommended Uses

- Photoacoustic A-line denoising
- Bipolar-response resolution
- Depth-attenuated feature preservation

## Provenance

**Status:** Photoacoustic-imaging-inspired deterministic surrogate.

---

[← Previous: DASFiberEvent](TF126_DASFiberEvent.md) | [Category 8 Catalog](index.md) | [Next: OCTRetinalProfile →](TF128_OCTRetinalProfile.md)
