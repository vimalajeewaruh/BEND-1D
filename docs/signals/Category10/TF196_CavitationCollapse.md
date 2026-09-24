# CavitationCollapse


## Overview

Very narrow pressure impulses occur singly and in clusters, and every event excites a damped high-frequency ring-down.

## Mathematical Definition

For the vectors $(c_k,a_k,w_k,\nu_k)$ in the code and
$G(x;c,w)=e^{-((x-c)/w)^2/2}$,
$$
f(x)=\sum_{k=1}^{6}\left[
a_kG(x;c_k,w_k)+I(x\ge c_k)(0.18a_k)e^{-35(x-c_k)}
\sin\{2\pi\nu_k(x-c_k)\}\right].
$$

[CavitationCollapse signal](../../assets/images/TF196_CavitationCollapse.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Fluid machinery |
| Structure | Six Gaussian impulses with causal oscillatory tails |
| Regularity | Strongly localized multiscale transients |
| Main challenge | Resolve close impulses while retaining post-event ringing |

## Parameters

| Parameter | Value |
|---|---|
| Event centers | $0.18,0.225,0.46,0.69,0.735,0.84$ |
| Pulse widths | $0.002$–$0.0035$ |
| Ring frequencies | $62$–$105$ cycles/unit |


## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF196_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF196_python.md)




## Recommended Uses

- Impulse-cluster resolution
- Ring-down preservation
- High-dynamic-range transient denoising

## Provenance

This is a deterministic benchmark surrogate inspired by fluid machinery measurement morphology. It is not a calibrated physical simulator.

[← Previous: MeltPoolSpatter](TF195_MeltPoolSpatter.md) · [Category 10 catalog](index.md) · [Next: ModeBeatingDecay →](TF197_ModeBeatingDecay.md)

