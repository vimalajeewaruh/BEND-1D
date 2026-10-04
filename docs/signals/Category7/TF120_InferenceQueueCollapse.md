# InferenceQueueCollapse

## Overview

The **InferenceQueueCollapse** signal combines a gradual request-load increase, a queueing cliff, a damped autoscaling oscillation, and partial stabilization.

## Mathematical Definition

Define the smooth step

```math
S(x;c,w)=\left[1+e^{-(x-c)/w}\right]^{-1}.
```

Define the gradual request-load trend

```math
B(x)=b_0+mx.
```

Define the queueing-cliff component

```math
Q(x)=A_QS(x;c_Q,w_Q).
```

Define the partial stabilization component

```math
S_R(x)=-A_SS(x;c_S,w_S).
```

Let

```math
u=(x-c_Q)_+.
```

For $x\geq c_Q$, define the damped autoscaling response

```math
R(x)=
A_Re^{-\alpha_Ru}
\sin(2\pi f_Ru),
```

with $R(x)=0$ for $x<c_Q$.

The signal is

```math
f(x)=B(x)+Q(x)+S_R(x)+R(x).
```

[View InferenceQueueCollapse signal](../../assets/images/TF120_InferenceQueueCollapse.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Ramp, queueing cliff, damped response, and stabilization |
| Request load | Gradual increase with slope $m$ |
| Queueing transition | Sharp positive transition near $c_Q$ |
| Autoscaling response | Damped oscillation beginning at $c_Q$ |
| Stabilization | Partial level reduction beginning near $c_S$ |
| Main challenge | Retaining autoscaling dynamics around large level changes |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $b_0$ | Baseline level | 0.12 |
| $m$ | Request-load slope | 0.22 |
| $A_Q$ | Queueing-cliff magnitude | 0.55 |
| $c_Q$ | Queueing-cliff location | 0.50 |
| $w_Q$ | Queueing-cliff transition width | 0.018 |
| $A_S$ | Stabilization reduction magnitude | 0.35 |
| $c_S$ | Stabilization onset location | 0.72 |
| $w_S$ | Stabilization transition width | 0.025 |
| $A_R$ | Autoscaling-response amplitude | 0.12 |
| $\alpha_R$ | Autoscaling-response decay rate | 5 |
| $f_R$ | Autoscaling-response frequency | 13 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF120_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF120_python.md)


## Recommended Uses

- Inference-system telemetry smoothing
- Queue-collapse localization
- Damped-controller-response preservation

## Provenance

**Status:** AI-inference-queueing-inspired deterministic infrastructure surrogate.

---

[← Previous: MoELoadImbalance](TF119_MoELoadImbalance.md) | [Category 7 Catalog](index.md) | [Next: CuspChirpStep →](TF121_CuspChirpStep.md)
