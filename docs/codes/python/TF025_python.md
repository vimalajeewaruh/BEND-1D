~~~python
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from scipy.interpolate import PchipInterpolator

N = 1024
table = pd.read_csv("Platinum5Y_monthly.csv")
P = table["Price"].to_numpy(dtype=float)
if P.size != 60:
    raise ValueError("Expected exactly 60 monthly prices.")

Ps = P.copy()
Ps[1:-1] = (P[:-2] + 6*P[1:-1] + P[2:]) / 8

xm = np.linspace(0, 1, 60)
x = np.linspace(0, 1, N)
f0 = PchipInterpolator(xm, Ps)(x)

fstd = (f0-f0.mean()) / np.sqrt(np.mean((f0-f0.mean())**2))

plt.plot(x, f0, linewidth=1.6, label="Lightly smoothed PCHIP")
plt.plot(xm, P, "o", markersize=3, label="Monthly observations")
plt.xlabel("x"); plt.ylabel("US dollars per troy ounce")
plt.title("TF025 — Platinum5Y")
plt.grid(alpha=0.3); plt.legend(); plt.tight_layout()
plt.savefig("TF025_Platinum5Y.png", dpi=300)
~~~
