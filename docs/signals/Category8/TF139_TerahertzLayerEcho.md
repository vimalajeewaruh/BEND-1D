# TerahertzLayerEcho


## Overview

The **TerahertzLayerEcho** signal contains six unequal bipolar layer reflections, two closely spaced interfaces, and a weak deep reflection followed by a dispersive oscillatory tail.

## Mathematical Definition

For $k=1,\ldots,K$, define the standardized distance

```math
z_k=\frac{x-c_k}{w_k}.
```

Define the bipolar layer-reflection component

```math
P_k(x)=
a_k z_k e^{-z_k^2/2}.
```

Let

```math
u=(x-c_T)_+.
```

For $x\geq c_T$, define the dispersive oscillatory tail

```math
T(x)=
A_T e^{-\alpha_Tu}
\sin(2\pi f_Tu),
```

with $T(x)=0$ for $x<c_T$.

The signal is

```math
f(x)=
\sum_{k=1}^{K}P_k(x)+T(x).
```

The echo centers, amplitudes, and widths are

```math
\mathbf{c}
=
(0.15,\,0.34,\,0.50,\,0.525,\,0.72,\,0.88),
```

```math
\mathbf{a}
=
(0.60,\,0.42,\,0.50,\,0.40,\,0.28,\,0.11),
```

```math
\mathbf{w}
=
(0.012,\,0.014,\,0.010,\,0.010,\,0.016,\,0.012).
```

[View TerahertzLayerEcho signal](../../assets/images/TF139_TerahertzLayerEcho.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Bipolar echoes with close interfaces and dispersive tail |
| Layer reflections | $K$ unequal bipolar echoes |
| Close pair | Centers at $c_3$ and $c_4$ |
| Dispersive tail | Damped oscillation beginning at $c_T$ |
| Deep reflection | Weak echo centered at $c_6$ |
| Main challenge | Resolving close bipolar echoes while retaining a weak tail |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $K$ | Number of layer reflections | 6 |
| $\mathbf{c}$ | Echo centers | $(0.15,\,0.34,\,0.50,\,0.525,\,0.72,\,0.88)$ |
| $\mathbf{a}$ | Echo amplitudes | $(0.60,\,0.42,\,0.50,\,0.40,\,0.28,\,0.11)$ |
| $\mathbf{w}$ | Echo widths | $(0.012,\,0.014,\,0.010,\,0.010,\,0.016,\,0.012)$ |
| $c_T$ | Tail onset location | 0.72 |
| $A_T$ | Tail amplitude | 0.07 |
| $\alpha_T$ | Tail decay rate | 9 |
| $f_T$ | Tail frequency | 35 |
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
