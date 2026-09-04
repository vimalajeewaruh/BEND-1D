---
layout: default
title: Category 7 Benchmarking Role
---

# Category 7 Benchmarking Role

Category 7 extends BEND-1D toward contemporary applications and deliberately artificial stress tests. The signals emphasize weak anomalies beside dominant components, close or overlapping events, abrupt regime changes, phase-sensitive oscillations, chirps, short-lived states, and nested multiscale structure.

## Morphology Summary

| Signal | Benchmark morphology |
|---|---|
| QuantumRamseyDrift | Phase drift, visibility decay, and calibration change |
| QuantumLeakageBurst | Small leakage bursts and finite level shift |
| FusionELMSawtooth | Repeated sawteeth with narrow energetic bursts |
| TokamakDisruption | Growing oscillation, precursor, and abrupt collapse |
| CalciumTransientTrain | Overlapping fast-rise, slow-decay responses |
| NanoporeCurrent | Unequal piecewise levels and very short states |
| CopyNumberGenome | Long segments, deletion, and focal amplification |
| SpatialTranscriptScan | Smooth trend, tissue domain, hotspot, and weak domain |
| SemiconductorMetrology | Drift, tool periodicity, recalibration, and defect |
| LithographyEdge | Multiscale roughness and localized edge defects |
| ParticlePileup | Overlapping asymmetric pulses and a close pair |
| CryogenicPulse | Weak precursor, sharp pulse, long decay, and secondary event |
| SpaceWeatherStorm | Sudden commencement, depression, substorms, and recovery |
| GNSSMultipathSlip | Oscillatory background, sharp slip, and reacquisition |
| HyperspectralMineral | Unequal absorption bands, close pair, and weak feature |
| SideChannelPower | Repeated computation transients and weak perturbation |
| SecurityBeacon | Irregular traffic bursts and weak periodic beacon |
| GPUThermalThrottle | Thermal rise, throttle transition, and controller oscillation |
| MoELoadImbalance | Finite routing imbalance with internal oscillation |
| InferenceQueueCollapse | Ramp, queueing cliff, oscillatory response, and stabilization |
| CuspChirpStep | Cusp, accelerating chirp, trend, and step |
| PeakForest | Signed peaks spanning many widths and amplitudes |
| HiddenNeedle | Narrow weak needle inside a broad feature |
| NestedWavePackets | Nested packets with increasing frequency and localization |
| CancellationTrap | Near-cancellation with fragile residual structure |

## Use in Denoising Experiments

All native functions are defined on $0\le x\le1$. For samples $f_0(x_i)$ and Gaussian noise standard deviation $\sigma$, a centered power-SNR normalization is recommended:

$$
\bar f_0=\frac{1}{N}\sum_{i=1}^{N}f_0(x_i),\qquad
P_0=\frac{1}{N}\sum_{i=1}^{N}[f_0(x_i)-\bar f_0]^2,
$$

$$
f(x_i)=\bar f_0+[f_0(x_i)-\bar f_0]
\sqrt{\frac{\mathrm{SNR}_{\mathrm{target}}\,\sigma^2}{P_0}}.
$$

This transformation retains the DC level and the signal morphology while equalizing centered power. Any uncentered-power alternative should be stated explicitly.

## Reporting Guidance

- Give all denoisers the same noisy realization within each Monte Carlo replication.
- Report signal-wise AMSE before aggregation.
- Use relative AMSE and geometric aggregation when comparing heterogeneous signals.
- Include morphology-specific and poor-case performance, not only a global mean.
- For TF123 and TF125, complement global error with local feature diagnostics.
- State the sampling grid, noise model, SNR convention, boundary rule, and random seed.

---

[← Return to Category 7 Catalog](index.md)
