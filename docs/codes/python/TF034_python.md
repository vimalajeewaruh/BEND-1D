~~~ python
import numpy as np
import matplotlib.pyplot as plt

N = 1024
x = np.linspace(0, 1, N)

env = 0.08 + 0.92 / (1 + np.exp(-35 * (x - 0.32)))

osc = (
    0.62 * np.sin(2 * np.pi * (24 * x + 17 * x**2))
    + 0.38 * np.sin(2 * np.pi * (49 * x + 0.80 * np.sin(2 * np.pi * 1.3 * x)))
    + 0.23 * np.sin(2 * np.pi * 83 * x + 0.35)
    + 0.12 * np.sin(2 * np.pi * 121 * x - 0.8)
)

f = env * osc

plt.figure(figsize=(8, 4))
plt.plot(x, f, linewidth=1.1)
plt.grid(True)

plt.xlabel("x")
plt.ylabel("f(x)")
plt.title("TF034 — EMGRecruitment")

plt.tight_layout()

plt.savefig(
    "TF034_EMGRecruitment.png",
    dpi=300,
    bbox_inches="tight"
)

plt.show()
~~~
