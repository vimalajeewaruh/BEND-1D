# Cantilever

The **Cantilever** signal combines normalized first- and third-mode cantilever responses with a weak crack or hinge perturbation. The result is a globally smooth multimode structure containing a small localized slope defect at $x_c=0.63$.

## Mathematical Definition

For a mode parameter $\beta$, define

$$
\phi_\beta(x)=
\cosh(\beta x)-\cos(\beta x)
-c_\beta\left[\sinh(\beta x)-\sin(\beta x)\right],
$$

where $c_\beta=\frac{\cosh\beta+\cos\beta}{\sinh\beta+\sin\beta}.$

The two modal parameters are $\beta_1=1.8751040687,\quad \beta_3=7.8547574382.$

Using maximum-absolute-value normalization,

$$
\widetilde{\phi}_\beta(x)=
\frac{\phi_\beta(x)}{\max_{0\leq t\leq1}|\phi_\beta(t)|}.
$$

With $x_c=0.63$, define the slope-defect term

$$
h(x)=(x-x_c)_+-(1-x_c)x,
\qquad
(v)_+=\max(v,0).
$$

The benchmark is

$$
f(x)=
\widetilde{\phi}_{\beta_1}(x)
+0.18\widetilde{\phi}_{\beta_3}(x)
+0.12h(x).
$$

[View Cantilever signal](../../assets/images/TF018_Cantilever.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Multimode smooth structure with a slope defect |
| Signal type | Deterministic and nonstationary |
| Dominant component | First cantilever mode |
| Weak component | Third cantilever mode |
| Local defect | Derivative change at $x_c=0.63$ |
| Main challenge | Retaining a weak localized defect within global modal structure |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $\beta_1$ | First-mode parameter | 1.8751040687 |
| $\beta_3$ | Third-mode parameter | 7.8547574382 |
| $x_c$ | Defect location | 0.63 |
| $0.18$ | Third-mode weight | 0.18 |
| $0.12$ | Defect weight | 0.12 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF018_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF018_python.md)



## Recommended Uses

- Structural-mode denoising
- Slope-defect preservation
- Detection of weak local features
- Multiscale smooth-signal evaluation

## Provenance

**Status:** Cantilever-mode-inspired deterministic structural surrogate.

---

[← Previous: Klatno](TF017_Klatno.md) | [Category 2 Catalog](index.md) | [Next: WaterHammer →](TF019_WaterHammer.md)

