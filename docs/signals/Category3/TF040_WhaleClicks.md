# WhaleClicks

## Overview

The **WhaleClicks** signal consists of an irregular sequence of narrow bipolar clicks. Every primary click has a weaker delayed echo, while click amplitudes and inter-click intervals vary across the record.

## Mathematical Definition

Define the derivative-of-Gaussian pulse

$$
D(x;t,s)=\frac{x-t}{s}
\exp\!\left[-\frac12\left(\frac{x-t}{s}\right)^2\right].
$$

The primary click times and amplitudes are

$$
t=(0.105,0.205,0.298,0.397,0.515,0.655,0.815,0.925),
$$

$$
A=(1.00,0.82,1.08,0.90,0.72,1.03,0.86,0.76).
$$

For click $k$, define the echo time

$$
e_k=t_k+0.012+0.002\sin k.
$$

The complete signal is

$$
f(x)=\sum_{k=1}^{8}
\left[A_kD(x;t_k,0.0022)+0.25A_kD(x;e_k,0.0030)\right].
$$

[WhaleClicks signal](../../assets/images/TF040_WhaleClicks.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Sparse irregular bipolar clicks with echoes |
| Number of primary clicks | 8 |
| Primary width | 0.0022 |
| Echo width | 0.0030 |
| Main challenge | Recovering highly sparse features on two fine scales |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $0.0022$ | Primary-click width | 0.0022 |
| $0.0030$ | Echo width | 0.0030 |
| $0.25$ | Relative echo amplitude | 0.25 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF040_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF040_python.md)



## Recommended Uses

- Sparse-click denoising
- Echo preservation
- Irregular event-train analysis
- Fine-scale bipolar transient recovery

## Provenance

**Status:** Marine-click-train-inspired deterministic bioacoustic surrogate.

---

[← Previous: InternalSolitons](TF039_InternalSolitons.md) | [Category 3 Catalog](index.md) | [Next: SonarMultipath →](TF041_SonarMultipath.md)

