# TF014 — Python Implementation

~~~python
import numpy as np

def ecg_beat_signal(x, r_locations, beat_scales):
    """Generate two ECG-like beats with specified R locations and scales."""
    offsets = np.array([-0.15, -0.025, 0, 0.025, 0.16])
    amplitudes = np.array([0.15, -0.12, 1, -0.25, 0.32])
    widths = np.array([0.035, 0.010, 0.008, 0.012, 0.060])
    f = np.zeros_like(x, dtype=float)

    for r, scale in zip(r_locations, beat_scales):
        for offset, amplitude, width in zip(offsets, amplitudes, widths):
            mu = r+offset
            f += scale*amplitude*np.exp(-(x-mu)**2/(2*width**2))
    return f
~~~

