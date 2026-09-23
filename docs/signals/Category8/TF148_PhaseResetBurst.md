# PhaseResetBurst


## Overview

The **PhaseResetBurst** stress test applies an abrupt phase reset to a nearly stationary oscillation without a large amplitude jump, then adds a short high-frequency packet.

## Mathematical Definition

Let $S(x;c,w)=[1+e^{-(x-c)/w}]^{-1}$. Then

$$
f(x)=0.28\sin[36\pi x+0.95S(x;0.48,0.003)]
+0.20e^{-((x-0.67)/0.035)^2/2}\sin(140\pi x).
$$

[PhaseResetBurst signal](../../assets/images/TF148_PhaseResetBurst.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Abrupt phase reset plus localized fast packet |
| Phase reset | Near $x=0.48$ |
| Burst | 70-cycle packet centered at 0.67 |
| Main challenge | Detecting phase change without relying on amplitude discontinuity |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $0.95$ | Phase-reset magnitude | 0.95 radians |
| $0.003$ | Reset width | 0.003 |
| $70$ | Burst cycle frequency | 70 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF0148_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF0148_python.md)


## Recommended Uses

- Phase-reset detection
- High-frequency packet preservation
- Phase-sensitive shrinkage evaluation

## Provenance

**Status:** Deliberately artificial MishMash stress test.

---

[← Previous: FrequencyCrossing](TF147_FrequencyCrossing.md) | [Category 8 Catalog](index.md) | [Next: LacunaryCascade →](TF149_LacunaryCascade.md)
