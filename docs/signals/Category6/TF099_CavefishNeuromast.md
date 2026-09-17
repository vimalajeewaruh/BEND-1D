# CavefishNeuromast


## Overview

The **CavefishNeuromast** signal combines a rapid sensory onset, sustained stimulation with adaptation, a secondary response, and a biphasic off-response.

## Mathematical Definition

Let $s(x;c,w)=[1+e^{-(x-c)/w}]^{-1}$ and $g(x;c,w)=e^{-((x-c)/w)^2/2}$. Then

$$
\begin{aligned}
f(x)={}&0.10+0.018\sin(8\pi x)+0.62g(x;0.30,0.012)\\
&+0.30[s(x;0.31,0.010)-s(x;0.69,0.018)]\\
&-0.12I(0.33\le x<0.69)[1-e^{-6(x-0.33)}]\\
&+0.16g(x;0.52,0.025)-0.18g(x;0.71,0.016)+0.10g(x;0.755,0.025).
\end{aligned}
$$

[CavefishNeuromast signal](../../assets/images/TF099_CavefishNeuromast.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Onset, sustained adaptation, and off-response |
| Stimulation | Approximately 0.31–0.69 |
| Local features | Onset peak, secondary response, negative off peak, rebound |
| Main challenge | Recovering physiologically meaningful changes at several time scales |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $0.30$ | Onset-response center | 0.30 |
| $6$ | Adaptation rate | 6 |
| $0.71,0.755$ | Off-response centers | As shown |

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
