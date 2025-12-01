# Python Project 4: Regression & Classification Analysis

This repository contains the solutions for Python Project 4. The project covers various machine learning concepts including Gradient Descent, Linear Regression with Normal Equation, Logistic Regression, and Image Classification using PyTorch (ResNet18).

##  Repository Structure

The project is organized into the following Jupyter Notebooks:

* **`Project4_Questions_1_to_4.ipynb`**: Solutions for Questions 1 through 4 (Gradient Descent, Linear Regression, Logistic Regression tuning).
* **`Question5_Part1.ipynb`**: Image classification using the original `train_catvnoncat.h5` and `test_catvnoncat.h5` datasets.
* **`Question5_Part2.ipynb`**: Image classification using a modified dataset split based on the Student ID.
* **`README.md`**: Project overview and instructions.

> **Note:** The dataset files (`train_catvnoncat.h5`, `test_catvnoncat.h5`) must be located in the same directory as the notebooks.

## 🛠 Dependencies

The following Python libraries are required to run the code:

* `numpy`
* `matplotlib`
* `h5py`
* `torch` (PyTorch)
* `torchvision`

## 📝 Project Details

### Question 1: Gradient Descent
- Implemented a Gradient Descent algorithm to find the minimum of the function $f(x) = \sqrt{x^2 + 5}$.
- Analyzed the convergence behavior with different step sizes.

### Question 2: Linear Regression (2D)
- Generated synthetic 2D data.
- Implemented Linear Regression using the **Normal Equation** to find optimal parameters (weights and bias).
- Visualized the data and the regression plane in 3D.

### Question 3: Logistic Regression Tuning
- Tuned hyperparameters for a Logistic Regression model to ensure convergence.
- **Selected Hyperparameters:**
    - Learning Rate: `0.1`
    - Number of Epochs: `3000`
- Visualized the decision boundary for both training and testing sets.

### Question 5: Image Classification with ResNet18
Implemented a binary classifier (Cat vs. Non-Cat) using a pretrained **ResNet18** model.

#### Part 1: Original Dataset (`Question5_Part1.ipynb`)
- **Training Set:** Original `train_catvnoncat.h5`
- **Test Set:** Original `test_catvnoncat.h5`
- Reports indices of misclassified images in the test set.
- Visualizes 4 failed prediction cases.

#### Part 2: Modified Dataset (`Question5_Part2.ipynb`)
- **Data Splitting Logic:**
    - Based on Student ID ending in **38** (Last digit: **8**).
    - **New Training Set:** First 160 images + 8 images = **168 images**.
    - **New Test Set:** Remaining 41 images from the original training file.
- The original test file is discarded.
- Reports Training and Test accuracy.
- Visualizes misclassified images from the new test set.

##  How to Run

1. Clone this repository.
2. Ensure all dependencies are installed.
3. Place the dataset files (`.h5`) in the root directory.
4. Open the `.ipynb` files using Jupyter Notebook, JupyterLab, or VS Code.
5. Run all cells to view the results and visualizations.

---
**Author:** [Your Name]
**Course:** AMS 595 - Python
**Date:** November 2025
