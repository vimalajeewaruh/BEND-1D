"""Hard- and soft-thresholding denoising example using BEND-1D."""

from pathlib import Path

import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import pywt

import bend1d


def wavelet_threshold(y, wavelet="db4", level=5, mode="hard"):
    """Denoise a 1-D signal using a MAD universal wavelet threshold."""
    y = np.asarray(y, dtype=float).reshape(-1)
    maximum_level = pywt.dwt_max_level(y.size, pywt.Wavelet(wavelet).dec_len)
    level = min(int(level), maximum_level)

    coefficients = pywt.wavedec(y, wavelet, level=level, mode="symmetric")
    finest_details = coefficients[-1]
    sigma_hat = (
        np.median(np.abs(finest_details - np.median(finest_details)))
        / 0.6744897501960817
    )
    threshold = sigma_hat * np.sqrt(2.0 * np.log(y.size))

    # Keep the approximation coefficients and threshold every detail level.
    thresholded = [coefficients[0]]
    thresholded.extend(
        pywt.threshold(details, threshold, mode=mode)
        for details in coefficients[1:]
    )

    estimate = pywt.waverec(thresholded, wavelet, mode="symmetric")
    return estimate[: y.size], sigma_hat, threshold


def main():
    # Experiment configuration
    signal_id = "TF001"
    sample_size = 1024
    noise_sigma = 0.20
    target_snr = 5.0
    wavelet = "db4"
    decomposition_level = 5
    replications = 100
    random_seed = 12345

    output_folder = Path("figures")
    output_folder.mkdir(exist_ok=True)

    # Generate and normalize a clean BEND-1D signal.
    x, native_signal, metadata = bend1d.generate(signal_id, sample_size)
    clean_signal, normalization = bend1d.normalize_snr(
        native_signal,
        sigma=noise_sigma,
        target_snr=target_snr,
        units="linear",
    )

    rng = np.random.default_rng(random_seed)
    hard_mse = np.empty(replications)
    soft_mse = np.empty(replications)

    first_noisy = None
    first_hard = None
    first_soft = None
    first_sigma_hat = None
    first_threshold = None

    # Paired Monte Carlo experiment: both methods receive the same noise.
    for replication in range(replications):
        noise = noise_sigma * rng.standard_normal(sample_size)
        noisy_signal = clean_signal + noise

        hard_estimate, sigma_hat, threshold = wavelet_threshold(
            noisy_signal,
            wavelet=wavelet,
            level=decomposition_level,
            mode="hard",
        )
        soft_estimate, _, _ = wavelet_threshold(
            noisy_signal,
            wavelet=wavelet,
            level=decomposition_level,
            mode="soft",
        )

        hard_mse[replication] = np.mean((hard_estimate - clean_signal) ** 2)
        soft_mse[replication] = np.mean((soft_estimate - clean_signal) ** 2)

        if replication == 0:
            first_noisy = noisy_signal
            first_hard = hard_estimate
            first_soft = soft_estimate
            first_sigma_hat = sigma_hat
            first_threshold = threshold

    mse_values = np.column_stack((hard_mse, soft_mse))
    method_names = ["Hard thresholding", "Soft thresholding"]
    amse = mse_values.mean(axis=0)
    sd_mse = mse_values.std(axis=0, ddof=1)
    se_amse = sd_mse / np.sqrt(replications)
    ci_half_width = 1.96 * se_amse

    results = pd.DataFrame(
        {
            "Method": method_names,
            "AMSE": amse,
            "SD_MSE": sd_mse,
            "SE_AMSE": se_amse,
            "CI95_Lower": amse - ci_half_width,
            "CI95_Upper": amse + ci_half_width,
        }
    )

    print(f"Signal: {metadata['ID']} {metadata['Name']}")
    print(f"Sample size: {sample_size}")
    print(f"Target linear SNR: {target_snr:.3f}")
    print(f"Noise standard deviation: {noise_sigma:.3f}")
    print(f"Wavelet: {wavelet}")
    print(f"Monte Carlo replications: {replications}")
    print(f"First estimated noise SD: {first_sigma_hat:.6f}")
    print(f"First universal threshold: {first_threshold:.6f}")
    print("\nDenoising Results")
    print("=================")
    print(results.to_string(index=False, float_format=lambda value: f"{value:.8f}"))

    # Representative denoising result from the first replication.
    fig, axis = plt.subplots(figsize=(10, 5))
    axis.plot(x, clean_signal, color="black", linewidth=2.0, label="Clean signal")
    axis.plot(
        x,
        first_noisy,
        ".",
        color="0.70",
        markersize=2.5,
        label="Noisy signal",
    )
    axis.plot(x, first_hard, color="#D95319", linewidth=1.4, label="Hard thresholding")
    axis.plot(x, first_soft, color="#0072BD", linewidth=1.4, label="Soft thresholding")
    axis.set(
        xlabel="x",
        ylabel="Signal value",
        title=(
            f"{metadata['ID']} {metadata['Name']}: Wavelet denoising\n"
            f"SNR={target_snr:g}, sigma={noise_sigma:g}, wavelet={wavelet}"
        ),
        xlim=(0, 1),
    )
    axis.grid(True, alpha=0.3)
    axis.legend(loc="best")
    fig.tight_layout()
    fig.savefig(output_folder / f"{signal_id}_denoised_signals.png", dpi=300)

    # AMSE comparison with approximate 95% Monte Carlo confidence intervals.
    fig, axis = plt.subplots(figsize=(7, 5))
    colors = ["#D95319", "#0072BD"]
    axis.bar(method_names, amse, yerr=ci_half_width, capsize=6, color=colors)
    axis.set_ylabel("Average mean squared error (AMSE)")
    axis.set_title(f"{metadata['ID']} {metadata['Name']}: Denoising performance")
    axis.grid(axis="y", alpha=0.3)
    fig.tight_layout()
    fig.savefig(output_folder / f"{signal_id}_amse_comparison.png", dpi=300)

    results.to_csv(output_folder / f"{signal_id}_denoising_results.csv", index=False)
    plt.show()


if __name__ == "__main__":
    main()
