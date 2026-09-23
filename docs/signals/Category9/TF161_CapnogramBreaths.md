# Capnogram Breaths

## Overview

This deterministic capnogram surrogate contains five repeated breaths. Each breath has a rapid expiratory upstroke, a sloping alveolar plateau, and a rapid inspiratory return. The fourth breath has a stronger shark-fin slope and a localized cleft, providing a small pathological departure from the repeated morphology.

## Mathematical Definition

Define the smooth logistic transition

$$
L(x;c,w)=\frac{1}{1+\exp\{-(x-c)/w\}}.
$$

For breath starts

$$
t=(0.010,0.205,0.400,0.595,0.790),
$$

let $r_k=t_k+0.045$, $d_k=t_k+0.145$, and

$$
G_k(x)=L(x;r_k,0.0035)-L(x;d_k,0.0035).
$$

The plateau slopes are

$$
p_k(x)=0.80+0.12\frac{x-r_k}{d_k-r_k},\qquad k\ne4,
$$

and

$$
p_4(x)=0.70+0.34\frac{x-r_4}{d_4-r_4}.
$$

The signal is

$$
f(x)=\sum_{k=1}^{5}G_k(x)p_k(x)
-0.12\exp\left[-\frac12\left(\frac{x-0.685}{0.009}\right)^2\right],
\qquad 0\le x\le1.
$$

[Capnogram Breaths](../../assets/images/TF161_CapnogramBreaths.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Recurrent pulse morphology |
| Signal type | Smooth gated plateaus with a localized defect |
| Main structure | Five repeated capnogram breaths |
| Local anomaly | Shark-fin fourth plateau and small cleft |
| Main challenge | Preserve a weak abnormality within repeated structure |

## Parameters

| Parameter | Value | Meaning |
|---|---:|---|
| $t_k$ | listed above | Breath start times |
| Rise offset | $0.045$ | Start-to-upstroke delay |
| Fall offset | $0.145$ | Start-to-downstroke delay |
| Gate width | $0.0035$ | Transition smoothness |
| Cleft center | $0.685$ | Location of the localized depression |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF0160_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF0160_python.md)



## Recommended Uses

- Recurrent pulse denoising
- Preservation of plateau slopes and fast transitions
- Detection of a weak local defect in a periodic record

## Provenance

This is a deterministic, application-oriented surrogate inspired by time-domain capnography. It is not a physiological simulator or a clinical reference trace.

[← Previous: Fresnel Occultation](TF160_FresnelOccultation.md) · [Category 9 catalog](index.md) · [Next: Diffusion MRI IVIM →](TF162_DiffusionMRIIVIM.md)
