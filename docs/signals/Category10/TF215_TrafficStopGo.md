# TrafficStopGo


## Overview

A slowly varying cruising level is repeatedly interrupted by rapid speed loss and slower recovery, with unequal event depths and time scales.

## Mathematical Definition

For $u_k=(x-c_k)_+$,
$$
f(x)=0.72+0.05\sin(2\pi0.8x)
-\sum_{k=1}^{4}I(x\ge c_k)a_k
(1-e^{-u_k/t_{f,k}})e^{-u_k/t_{s,k}},
$$
with the vectors listed below.

[TrafficStopGo signal](../../assets/images/TF215_TrafficStopGo.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Transportation |
| Structure | Low-frequency baseline minus four asymmetric causal pulses |
| Regularity | Smooth, recurrent, and irregular |
| Main challenge | Preserve cycle asymmetry and event-to-event variation |

## Parameters

| Parameter | Value |
|---|---|
| Event centers | $0.18,0.38,0.59,0.78$ |
| Depths | $0.48,0.38,0.55,0.44$ |
| Fast scales | $0.012$–$0.020$ |
| Slow scales | $0.08$–$0.11$ |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF215_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF215_python.md)



## Recommended Uses

- Stop-and-go waveform denoising
- Repeated-event preservation
- Asymmetric recovery estimation

## Provenance

This is a deterministic benchmark surrogate inspired by transportation measurement morphology. It is not a calibrated physical or environmental simulator.

[← Previous: DrumModePacket](TF214_DrumModePacket.md) · [Category 10 catalog](index.md) · [Next: ElevatorRide →](TF216_ElevatorRide.md)

