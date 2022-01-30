# MINLP Distillation Test Set
This repository contains the data needed for the computational results presented in 

Radhakrishna Tumbalam Gooty, Rakesh Agrawal, and Mohit Tawarmalani. Advances in MINLP to Identify Energy Efficient Distillation Configurations. Preprint available at https://arxiv.org/pdf/2010.12113.pdf

Folder `duality_gap_across_scenarios` contains the `gms`/`lp` format files for all the cases and scenarios described in Table 3, Section 7 (Effect of Individual Cuts on Relaxation) of the manuscript. The parameter settings for all the cases can be found in the caption of Table 3.

Folder `test_set` contains the Matlab script (`gentestset.m`) used for the generation of the test set described in Section 8 (Computational Results) of the manuscript. Within the folder, files `feedcases.dat` and `alphacases.dat` contain the parameter settings for all the 496 cases in the test set. In the file `feedcases.dat`, the first column contains the case number, columns 2 through 6 (F_1, F_2, F_3, F_4, F_5) contain the composition of components C_1 through C_5 in the process feed. In the file, `alphacases.dat`, the first column contains the case number, columns 2 through 6 (alpha_1, alpha_2, alpha_3, alpha_4, alpha_5) contain the relative volatilities of components C_1 through C_5 w.r.t to the heaviest component i.e., C_5.

Folder `five_component_results` contains the `gms`/`lp` format files for a few cases selected from the test set. The parameter settings (feed composition and relative volatilities) can be found in the excel file `Parameters.xlsx` within the folder. Each instance folder has three sub-folders: `Approach_1`, `Approach_2`, and `Approach_3` (see Section 8, Computational Results, for more details). `Approach_1` contains the `lp` format files for the MIP relaxation and `gms` files for finding feasible solutions for each iteration (see Approach 1 in Section 8). `Approach_2` and `Approach_3` contain `gms` files for the MINLP formulations mentioned in Approach 2 and Approach 3 (see Section 8), respectively.  

Excel file `six_component_results.xlsx` contains the computational results for a few randomly generated six-component mixtures. The parameter settings for these mixtures can be found within the excel file.
