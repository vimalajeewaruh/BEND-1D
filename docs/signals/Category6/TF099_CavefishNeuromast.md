# CavefishNeuromast


## Overview

The **CavefishNeuromast** signal combines a rapid sensory onset, sustained stimulation with adaptation, a secondary response, and a biphasic off-response.

## Mathematical Definition

## Mathematical Definition

Define the smooth step and Gaussian functions

```math
s(x;c,w)=\left[1+e^{-(x-c)/w}\right]^{-1},
```

```math
g(x;c,w)=
\exp\left[
-\frac12\left(\frac{x-c}{w}\right)^2
\right].
```

Define the baseline component

```math
B(x)=b_0+A_B\sin(2\pi f_Bx).
```

Define the onset response

```math
O(x)=A_Og(x;c_O,w_O).
```

Define the sustained stimulation component

```math
S(x)=
A_S
\left[
s(x;c_1,w_1)-s(x;c_2,w_2)
\right].
```

For $c_A\leq x<c_2$, define the adaptation component as

```math
D(x)=
-A_D
\left[
1-e^{-k_D(x-c_A)}
\right],
```

with $D(x)=0$ outside this interval.

Define the secondary response

```math
R(x)=A_Rg(x;c_R,w_R).
```

Define the negative off-response

```math
N(x)=-A_Ng(x;c_N,w_N).
```

Define the rebound response

```math
Q(x)=A_Qg(x;c_Q,w_Q).
```

The signal is

```math
f(x)=B(x)+O(x)+S(x)+D(x)+R(x)+N(x)+Q(x).
```


[View CavefishNeuromast signal](../../assets/images/TF099_CavefishNeuromast.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Onset, sustained adaptation, and off-response |
| Stimulation | Approximately from $c_1$ to $c_2$ |
| Adaptation | Gradual negative adjustment beginning near $c_A$ |
| Local features | Onset peak, secondary response, negative off peak, and rebound |
| Main challenge | Recovering physiologically meaningful changes at several time scales |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $b_0$ | Baseline level | 0.10 |
| $A_B$ | Baseline oscillation amplitude | 0.018 |
| $f_B$ | Baseline oscillation frequency | 4 |
| $A_O$ | Onset-response amplitude | 0.62 |
| $c_O$ | Onset-response center | 0.30 |
| $w_O$ | Onset-response width | 0.012 |
| $A_S$ | Sustained-response amplitude | 0.30 |
| $c_1$ | Stimulation onset location | 0.31 |
| $w_1$ | Stimulation onset width | 0.010 |
| $c_2$ | Stimulation offset location | 0.69 |
| $w_2$ | Stimulation offset width | 0.018 |
| $A_D$ | Adaptation magnitude | 0.12 |
| $c_A$ | Adaptation onset location | 0.33 |
| $k_D$ | Adaptation rate | 6 |
| $A_R$ | Secondary-response amplitude | 0.16 |
| $c_R$ | Secondary-response center | 0.52 |
| $w_R$ | Secondary-response width | 0.025 |
| $A_N$ | Negative off-response magnitude | 0.18 |
| $c_N$ | Negative off-response center | 0.71 |
| $w_N$ | Negative off-response width | 0.016 |
| $A_Q$ | Rebound-response amplitude | 0.10 |
| $c_Q$ | Rebound-response center | 0.755 |
| $w_Q$ | Rebound-response width | 0.025 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF099_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF099_python.md)



## Recommended Uses

- Sensory-response denoising
- Adaptation-profile recovery
- On/off transient preservation

## Provenance

**Status:** Cavefish-neuromast-response-inspired deterministic neuroscience surrogate.

---

[← Previous: TurbiditeSequence](TF098_TurbiditeSequence.md) | [Category 6 Catalog](index.md) | [Next: NeuralBurstAdaptation →](TF100_NeuralBurstAdaptation.md)
