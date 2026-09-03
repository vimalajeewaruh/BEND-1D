# A physically motivated library of test functions

Classical wavelet test signals such as Blocks, Bumps, HeaviSine, and Doppler are valuable because they isolate particular regularity classes, but they are intentionally abstract.  To complement such benchmarks, we
consider a library of sixteen deterministic functions motivated by simple mechanisms from physics, mechanics, chemistry, biology, spectroscopy, and finance.  Each function is defined on $0\leq x\leq 1$ in a native, unscaled form.  For denoising experiments the native function can subsequently be multiplied by a constant so that the desired power
signal-to-noise ratio is attained.  The purpose of the library is not to provide detailed mechanistic models, but rather to construct interpretable toy signals whose local regularity, oscillation, concentration, or transient behavior resembles that encountered in applications.

---
## 1. Percolation

A simple surrogate for the emergence of an infinite connected cluster near a percolation threshold is

$$f(x)=(x-p_c)_+^\beta, \qquad p_c=0.38, \qquad \beta=0.41,$$

where $(u)_+=\max(u,0)$.  Since $0<\beta<1$, the function is continuous at $p_c$ but has a singular derivative there.  It therefore represents a critical onset that is substantially different 
from either a jump or a smooth transition.

[View Signal](../docs/assets/images/TF001_Percolation.png)

