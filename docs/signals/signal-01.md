# Percolation
![Signal 1](../assets/images/TF001_Percolation.pdf)

## Overview

The **Percolation** signal represents a critical onset occurring at a
specified threshold. Before the threshold, the signal remains zero.
After the threshold, it increases according to a fractional power law.

The signal is continuous at the threshold but is not differentiable
there. It therefore represents a critical transition that is
substantially different from both an abrupt jump and a fully smooth
transition.

This deterministic signal is a simplified surrogate for the emergence
of a connected cluster near a percolation threshold. It is not itself
a realization of a stochastic spatial percolation process.

## Mathematical Definition

For $0 \leq x \leq 1$, the signal is defined by

$$f(x)=(x-p_c)_+^\beta,$$

where $(u)_+=\max(u,0).$

Equivalently,

$$
f(x)=
\begin{cases}
0, & x\leq p_c,\\
(x-p_c)^\beta, & x>p_c.
\end{cases}
$$

The default parameter values are $p_c=0.38, \qquad \beta=0.41.$

Here, $p_c$ specifies the location of the critical threshold, while
$\beta$ controls the rate at which the signal emerges after the
threshold.

For $x>p_c$, the derivative is

$$
f'(x)=\beta(x-p_c)^{\beta-1}.
$$

Because $0<\beta<1$, the exponent $\beta-1$ is negative. Therefore,

$$
f'(x)\longrightarrow\infty
\qquad
\text{as}
\qquad
x\downarrow p_c.
$$

The signal is consequently continuous at $x=p_c$, but it has an
unbounded right derivative at that point. Thus, $p_c$ is a derivative
singularity rather than a jump discontinuity.

## Morphological Characteristics

| Property | Description |
|---|---|
| Signal family | Critical-transition and singular signals |
| Signal type | Deterministic and nonstationary |
| Domain | $0\leq x\leq 1$ |
| Critical threshold | $p_c=0.38$ |
| Critical exponent | $\beta=0.41$ |
| Continuity | Continuous everywhere |
| Differentiability | Not differentiable at $x=p_c$ |
| Jump discontinuities | None |
| Oscillatory behavior | None |
| Localized feature | Critical onset at $p_c$ |
| Behavior before threshold | Constant at zero |
| Behavior after threshold | Fractional power-law increase |
| Primary challenge | Preserving the threshold and derivative singularity |

## Parameters

| Parameter | Description | Default | Allowed values |
|---|---|---:|---|
| `n` | Number of sampled observations | 1024 | Integer $n\geq 2$ |
| `pc` | Location of the critical threshold | 0.38 | $0<p_c<1$ |
| `beta` | Critical growth exponent | 0.41 | $0<\beta<1$ for a singular derivative |
| `amplitude` | Global amplitude multiplier | 1.0 | Positive real number |

Changing $p_c$ moves the critical onset along the signal domain.
Changing $\beta$ controls the shape of the transition. Smaller values
of $\beta$ produce a sharper onset, while values closer to one produce
a more gradual post-threshold increase.

## MATLAB Implementation

```matlab
% Percolation signal
clear;
close all;
clc;

% Signal parameters
n = 1024;
pc = 0.38;
beta = 0.41;
amplitude = 1.0;

% Sampling locations
x = linspace(0, 1, n);

% Generate the Percolation signal
f = amplitude * max(x - pc, 0).^beta;

% Plot the signal
figure('Color', 'w');
plot(x, f, 'b-', 'LineWidth', 1.8);
hold on;

% Mark the critical threshold
xline(pc, '--r', ...
    'p_c', ...
    'LineWidth', 1.2, ...
    'LabelVerticalAlignment', 'middle');

hold off;

xlabel('x');
ylabel('f(x)');
title('Percolation Signal');
grid on;
box on;
xlim([0, 1]);

% Save the image for the GitHub Pages website
exportgraphics( ...
    gcf, ...
    'percolation.png', ...
    'Resolution', 300);
```

The generated image should be uploaded to:

```text
docs/assets/images/percolation.png
```

## Python Implementation

```python
import numpy as np
import matplotlib.pyplot as plt

# Signal parameters
n = 1024
pc = 0.38
beta = 0.41
amplitude = 1.0

# Sampling locations
x = np.linspace(0, 1, n)

# Generate the Percolation signal
f = amplitude * np.maximum(x - pc, 0) ** beta

# Plot the signal
plt.figure(figsize=(8, 4))

plt.plot(
    x,
    f,
    color="blue",
    linewidth=1.8,
    label="Percolation signal"
)

# Mark the critical threshold
plt.axvline(
    pc,
    color="red",
    linestyle="--",
    linewidth=1.2,
    label=r"$p_c$"
)

plt.xlabel("x")
plt.ylabel("f(x)")
plt.title("Percolation Signal")
plt.xlim(0, 1)
plt.grid(True, alpha=0.3)
plt.legend()
plt.tight_layout()

# Save the image for the GitHub Pages website
plt.savefig(
    "percolation.png",
    dpi=300,
    bbox_inches="tight"
)

plt.show()
```

## Recommended Uses

The Percolation signal can be used to evaluate whether a signal
processing or statistical method can:

- detect the location of a critical onset;
- preserve continuity around a singular point;
- distinguish a derivative singularity from a jump;
- recover fractional power-law behavior;
- avoid oversmoothing the critical transition;
- avoid introducing artificial oscillations near the threshold;
- estimate the local regularity around $p_c$.

The signal is particularly useful for studying denoising,
change-point detection, singularity detection, wavelet analysis, and
other multiscale procedures.

## Provenance

**Status:** Critical-onset surrogate.

The signal is motivated by the power-law behavior of an order
parameter near a percolation threshold. It should be interpreted as a
deterministic benchmark signal rather than a realization of a spatial
percolation process.

If the values $p_c=0.38$ and $\beta=0.41$ were obtained from a
particular publication, physical system, or percolation model, the
corresponding reference should be provided here.

---

[Browse Signals](signals/index.md)
