# TerahertzLayerEcho


## Overview

The **TerahertzLayerEcho** signal contains six unequal bipolar layer reflections, two closely spaced interfaces, and a weak deep reflection followed by a dispersive oscillatory tail.

## Mathematical Definition

Let $z_k=(x-c_k)/w_k$. Then

$$
f(x)=\sum_{k=1}^{6}a_k z_k e^{-z_k^2/2}+0.07I(x\ge0.72)e^{-9(x-0.72)}\sin[2\pi\,35(x-0.72)],
$$

where

$$
c=(0.15,0.34,0.50,0.525,0.72,0.88),
$$

$$
a=(0.60,0.42,0.50,0.40,0.28,0.11),\quad
w=(0.012,0.014,0.010,0.010,0.016,0.012).
$$

[TerahertzLayerEcho signal](../../assets/images/TF139_TerahertzLayerEcho.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Bipolar echoes with close interfaces and dispersive tail |
| Close pair | Centers at 0.50 and 0.525 |
| Deep reflection | Weak amplitude 0.11 at $x=0.88$ |
| Main challenge | Resolving close bipolar echoes while retaining a weak tail |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $c_k,a_k,w_k$ | Echo centers, amplitudes, and widths | As above |
| $9,35$ | Tail decay and cycle frequency | As shown |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF139_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF139_python.md)



## Recommended Uses

- Terahertz-layer-profile denoising
- Bipolar-interface resolution
- Weak-tail preservation

## Provenance

**Status:** Terahertz-layer-imaging-inspired deterministic surrogate.

---

[← Previous: MicrofluidicDropletTrain](TF138_MicrofluidicDropletTrain.md) | [Category 8 Catalog](index.md) | [Next: BridgeStrainEvent →](TF140_BridgeStrainEvent.md)
