# LeafNyctinasty


## Overview

Two daily opening–closing cycles have deliberately unequal transition speeds, making the waveform nearly periodic but distinctly nonsinusoidal.

## Mathematical Definition

With $L(x;c,w)=[1+e^{-(x-c)/w}]^{-1}$,
$$
\begin{aligned}
f(x)={}&0.12+0.78[L(x;0.08,0.025)-L(x;0.38,0.050)]\\
&+0.72[L(x;0.57,0.022)-L(x;0.88,0.060)]
+0.025\sin(10\pi x).
\end{aligned}
$$

[LeafNyctinasty signal](../../assets/images/TF209_LeafNyctinasty.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Botany |
| Structure | Two pairs of asymmetric logistic gates plus weak oscillation |
| Regularity | Smooth repeated transitions without true jumps |
| Main challenge | Preserve unequal opening and closing rates |

## Parameters

| Parameter | Value |
|---|---|
| First cycle | $0.08$–$0.38$ |
| Second cycle | $0.57$–$0.88$ |
| Opening widths | $0.025,0.022$ |
| Closing widths | $0.050,0.060$ |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF209_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF209_python.md)



## Recommended Uses

- Quasi-periodic transition denoising
- Asymmetry preservation
- Cycle-shape recovery

## Provenance

This is a deterministic benchmark surrogate inspired by botany measurement morphology. It is not a calibrated physical or clinical simulator.

[← Previous: SapFlowLag](TF208_SapFlowLag.md) · [Category 10 catalog](index.md) · [Next: FungalGrowthPulse →](TF210_FungalGrowthPulse.md)

