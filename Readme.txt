This folder contains the prototype implementation of the Arhcitecture for pattern recognition called Holographic Graph Neuron (HoloGN). The approach is described in the paper "Holographic Graph Neuron: a Bio-Inspired Architecture for Pattern Processing". The preprint of the paper is available at http://arxiv.org/abs/1501.03784

Folder contains the following functions:

bin2com - Transforms the array or vector of binary values into array or vector or complex values

hologn_encoder - HoloGN encoder. It creates distributed representation for a pattern across graph neurons 

item_memory_c - HoloGN decoder. It recalls the closest vector in item-memory and outputs corresponding index

letters_encoding - Creates distributed representation (HGN) for every image of letter  

majority_sum - Performs bundling of array of HD-vectors

plot_letter - Displays two figures with images (undistorted and noisy) used for benchamrking of the HoloGN with HGN 


Folder contains the following data in .mat format:

Letters - Provides set of images of letters. Fig. 4 in the original paper

Letters_noisy - Provides set of noisy images of letters. Fig. 5 in the original paper

There are three scenarios, which are using the above mentioned functions and data:


1. Scenario_recall_pattens_with_distortions - represents simulations presented in Fig. 6 in the paper

2. Simulation_accuracy_agains_noise_in_bundle - represents simulations presented in Fig. 7 in the paper

3. Simulation_acc_againsts_number_in_bundle - represents simulations presented in Fig. 8 in the paper