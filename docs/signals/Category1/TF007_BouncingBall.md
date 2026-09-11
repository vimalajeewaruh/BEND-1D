# BouncingBall

The **BouncingBall** signal represents repeated inelastic impacts using a sequence of ballistic parabolic arcs. Successive arcs become shorter and lower, while the impact times accumulate at $x=1$. The signal is continuous, but its slope changes abruptly at every impact.

## Mathematical Definition

Let $e=0.72$ be the coefficient of restitution. Successive durations and maximum heights satisfy $d_{k+1}=e\,d_k$ and $H_{k+1}=e^2H_k.$

On the interval $[a_k,a_k+d_k]$, define

$$
f(x)=4H_k u(1-u),
\qquad
u=\frac{x-a_k}{d_k}.
$$

The impact locations satisfy $a_{k+1}=a_k+d_k$. Choosing $a_1=0$ and $d_1=1-e$ causes the impact times to accumulate at $x=1$. The overall amplitude may be fixed by setting $H_1=1$.

[View BouncingBall signal](../../assets/images/TF007_BouncingBall.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Repeated motifs and event trains |
| Secondary tags | Impacts, multiscale, accumulating events |
| Continuity | Continuous |
| Differentiability | Slope discontinuities at impacts |
| Time scales | Geometrically decreasing |
| Amplitudes | Geometrically decreasing |
| Main challenge | Recovering progressively shorter and weaker arcs |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $e$ | Coefficient of restitution | 0.72 |
| $d_1$ | First-arc duration | $1-e$ |
| $H_1$ | First-arc height normalization | 1 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF007_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF008_python.md)



## Recommended Uses

- Recovery of repeated impact-like events
- Testing resolution at progressively shorter scales
- Preservation of slope discontinuities
- Evaluation of weak late-event recovery

## Provenance

**Status:** Inelastic-impact morphology surrogate. The normalization $H_1=1$ fixes the otherwise arbitrary initial amplitude.

---

[← Previous: Fano](TF006_Fano.md) | [Signal Catalog](index.md) | [Next: ImpactSpring →](TF008_ImpactSpring.md)
