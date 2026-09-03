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

[View BouncingBall signal](../assets/images/TF007_BouncingBall.png)

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

~~~matlab
N = 1024;
x = linspace(0,1,N);
e = 0.72;
d = 1-e;
H = 1;
a = 0;
f = zeros(size(x));

while d > 1/(10*N) && a < 1
    idx = (x >= a) & (x <= min(a+d,1));
    u = (x(idx)-a)/d;
    f(idx) = 4*H*u.*(1-u);
    a = a+d;
    d = e*d;
    H = e^2*H;
end
f(end) = 0;

plot(x,f,'LineWidth',1.3)
xlabel('x'); ylabel('f(x)');
title('TF007 — BouncingBall'); grid on
exportgraphics(gcf,'TF007_BouncingBall.png','Resolution',300);
~~~

## Python Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt

N = 1024
x = np.linspace(0, 1, N)
e = 0.72
d, H, a = 1-e, 1.0, 0.0
f = np.zeros_like(x)

while d > 1/(10*N) and a < 1:
    idx = (x >= a) & (x <= min(a+d, 1))
    u = (x[idx]-a)/d
    f[idx] = 4*H*u*(1-u)
    a += d
    d *= e
    H *= e**2
f[-1] = 0.0

plt.plot(x, f, linewidth=1.3)
plt.xlabel("x"); plt.ylabel("f(x)")
plt.title("TF007 — BouncingBall")
plt.grid(alpha=0.3)
plt.tight_layout()
plt.savefig("TF007_BouncingBall.png", dpi=300)
~~~

## Recommended Uses

- Recovery of repeated impact-like events
- Testing resolution at progressively shorter scales
- Preservation of slope discontinuities
- Evaluation of weak late-event recovery

## Provenance

**Status:** Inelastic-impact morphology surrogate. The normalization $H_1=1$ fixes the otherwise arbitrary initial amplitude.

---

[← Previous: Fano](TF006_Fano.md) | [Signal Catalog](index.md) | [Next: ImpactSpring →](TF008_ImpactSpring.md)
