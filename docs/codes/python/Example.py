import numpy as np
import matplotlib.pyplot as plt
import bend1d


x, f, metadata = bend1d.generate("TF001", 1024);

print(metadata)



x, f, metadata = bend1d.generate("TF001", 1024)

print("Signal ID:", metadata["ID"])
print("Signal name:", metadata["Name"])
print("Category:", metadata["Category"])
print("Sample size:", len(f))

plt.figure(figsize=(9, 4))
plt.plot(x, f, linewidth=1.5)
plt.xlabel("x")
plt.ylabel("Signal value")
plt.title(f'{metadata["ID"]}: {metadata["Name"]}')
plt.grid(True)
plt.tight_layout()
plt.show()

