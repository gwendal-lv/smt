# Sound Morphing Toolbox (SMT) Release Notes

The SMT is a set of Matlab functions that implement a sound morphing algorithm for isolated musical instrument sounds. The SMT was first presented at the [Timbre 2018](https://www.mcgill.ca/timbre2018/) conference. Further information can be found in the article presented at the [CMMR 2019](https://cmmr2019.prism.cnrs.fr) conference.

## Quick setup

1. Download and unzip the files to a folder (e.g., `/userhome/myfolder`)
2. Start Matlab
3. Open the SMT folder (e.g., `/userhome/myfolder`) in Matlab (Navigate to `/userhome/myfolder` under the **Current Folder** menu)
4. Add the SMT folder (e.g., `/userhome/myfolder`) to your Matlab path. Alternatively, run the script `/userhome/myfolder` inside the SMT folder. (Type `/userhome/myfolder` in the **Command Window** or double click on `/userhome/myfolder` to open it in the **Editor** and click on **Run**)
5. Run the script `run_smt.m` to generate the example.
6. Add your own sounds to the _./audio_ subfolder, open and edit `run_smt.m` appropriately to morph your own sounds

## Dependencies

The file `run_smt_dependencies.txt` lists all file dependencies. All required `.m` files can be found in this SMT repository. However, the SMT also requires the Matlab signal processing toolbox.

## Acknowledgements

This project has received funding from the European Union’s Horizon 2020 research and innovation programme under the Marie Sklodowska-Curie grant agreement No 831852 (MORPH)

---

## SMT 0.2.0-alpha.1

Sound Morphing Toolbox (SMT) version 0.2.0 alpha release build 1

### What's new in version 0.2.0

- Fully vectorized sinusoidal analysis
- Vectorized sinusoidal resynthesis
- Namespace `+STFT` for the short-time Fourier transform
- Namespace `+tools` for the core functions
- Refactored codebase into low-level core functionality and high-level calls to core functions
- Added support for power scaling spectral estimation of sinusoidal parameters
- Standardization of nomenclature of entire codebase
- Refactored and restructured partial tracking
- Updated functions in folder `+tools/+spec/` to also handle odd FFT size

### New functions/features

- Function `SM/freq_matching.m` was completely refactored into several local functions called as subroutines
- Partial tracking step has a dedicated function `SM/partial_tracking.m`, which calls the functions `SM/peak2peak_freq_matching.m` and `SM/freq_matching.m`
- Introduced power scaling sinusoidal parameter estimation in functions `XQIFFT/xqifft.m` and `XQIFFT/interp_pow_scaling.m`
- Added functions `tools.sin.is2ptpeak.m`, `tools.sin.is3ptpeak.m`, `tools.sin.ispeak.m`
- Added function `tools.math.quadfit.m` with improved implementation of quadratic fit that also handles _symmetrical spectral peaks_
- Introduced subroutine `SM/parameter_estimation.m`
- Updated function `SM/peak_picking.m` inside _parameter estimation_ to handle _regular_ and _symmetrical_ spectral peaks
- Updated all functions in folder `+tools/+spec/` to be able to handle even or odd size of the DFT

### Deprecated functions/features

- Several functions became deprecated and were replaced

### Bug fixes

- Several bug fixes

---

## SMT 0.1.1

Sound Morphing Toolbox (SMT) version 0.1.1

### What's new in version 0.1.1

- Added CMMR2019 folder
- Added auxiliary plotting functions `CMMR2019/CMMR2019_makefigsinres.m` and `CMMR2019/CMMR2019_makefigpeaktrack.m`

---

## SMT 0.1.0

Sound Morphing Toolbox (SMT) version 0.1.0

### What's new in version 0.1.0

- Initial release

### Acknowledgements for SMT 0.1.0

This work was financed by National Funds through the Portuguese funding agency, FCT - _Fundação para a Ciência e a Tecnologia_ within grant SFRH/BPD/115685/2016.
