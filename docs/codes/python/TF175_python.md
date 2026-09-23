# TF175 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt

N = 1024
x = np.linspace(0.0, 1.0, N)
sigma, rho, beta = 10.0, 28.0, 8.0/3.0
dt, burn = 0.01, 1200
y = np.zeros((N + burn, 3))
y[0] = [1.0, 1.0, 1.0]

def rhs(v):
    X, Y, Z = v
    return np.array([sigma*(Y-X), X*(rho-Z)-Y, X*Y-beta*Z])

for k in range(len(y)-1):
    k1 = rhs(y[k])
    k2 = rhs(y[k] + 0.5*dt*k1)
    k3 = rhs(y[k] + 0.5*dt*k2)
    k4 = rhs(y[k] + dt*k3)
    y[k+1] = y[k] + dt*(k1+2*k2+2*k3+k4)/6.0
f = y[burn:, 0]
f -= np.mean(f)
f /= np.max(np.abs(f))

plt.plot(x, f)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF175 — Lorenz Wing Switch")
plt.grid(True); plt.show()
~~~
