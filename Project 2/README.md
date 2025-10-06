# Mandelbrot Set Fractal Analysis (MATLAB)

This repository contains MATLAB code for analyzing and approximating the rough circumference of the **Mandelbrot Set fractal**. The project implements a multi-step numerical approach, including boundary approximation, polynomial function fitting, and curve length integration.
<img width="815" height="662" alt="image" src="https://github.com/user-attachments/assets/7bda171e-1c15-4c83-bd36-7919f9cf0b24" />


## 🚀 Project Overview

The core objective of this project is to apply numerical methods to a chaotic mathematical entity—the Mandelbrot Set—to approximate its perimeter length, a classic problem related to the **coastline paradox** . The Mandelbrot Set is defined by the iterative complex function $f_c(z) = z^2 + c$, where $z$ remains bounded after repeated iteration.

## 📁 Repository Structure

The main functionality is contained within the MATLAB scripts, which implement the stages of the analysis.

| File Name | Description | 
| :--- | :--- | 
| `fractal_analysis.m` | Main script that executes all steps (function definition, bisection, polynomial fit, integration). | 
| `Project2 - David Hwang.pdf` | Detailed report outlining the methodology, results, and discussion for the project. | 

## 📐 Methodology

The approximation is carried out in four distinct stages, focusing on the upper half of the fractal boundary due to its symmetry across the real axis.

### 1. Fractal Set Definition

A function, `is_in_set(c)`, determines if a complex point $c$ belongs to the Mandelbrot Set.

* **Criterion:** A point $c$ is considered in the set if $|z|$ remains less than $2.0$ after a fixed number of iterations (e.g., 100 iterations), starting with $z=0$.

### 2. Boundary Approximation using Bisection

The bisection algorithm is employed to precisely locate the boundary of the fractal along various fixed real values.

* The algorithm searches for the transition point between points that belong to the set and those that do not, effectively tracing the upper curve of the cardioid and bulb features.

* This generates a discrete set of $(x, y)$ coordinates that define the boundary.

### 3. Polynomial Function Fitting

A polynomial function is used to approximate the discrete boundary points found in the previous step.

* The MATLAB function `polyfit` is used to fit a polynomial of a suitable degree to the boundary coordinates.

* This step transforms the discrete boundary points into a continuous, differentiable function, $P(x)$, representing the upper boundary.

### 4. Curve Length Integration

The length of the fitted polynomial curve, $P(x)$, is calculated using integral calculus.

* The curve length $L$ for a function $y=P(x)$ from $x=a$ to $x=b$ is given by the integral:
    
<img width="766" height="129" alt="image" src="https://github.com/user-attachments/assets/b39eb5f7-091d-492c-98bf-b985d1729068" />

* The MATLAB function `polyder` is used to find the derivative $\frac{dP}{dx}$, and `integral` is used to compute the definite integral.

* The final total circumference is approximated by doubling the calculated length of the upper curve due to the fractal's symmetry.

## 🚀 How to Run

1.  **Environment:** Ensure you have access to **MATLAB** (R2018a or newer is recommended).

2.  **Open:** Open the main script file, `fractal_analysis.m`, in the MATLAB editor.

3.  **Execute:** Run the script directly from the editor or type the file name in the MATLAB Command Window:

    ```matlab
    fractal_analysis
    ```

4.  **Output:** The script will execute the analysis steps, generate plots visualizing the boundary approximation, and display the final computed rough circumference in the Command Window.

## 📄 Project Report

For a detailed explanation of the math, algorithm implementation, convergence analysis, and visualization results, please refer to the uploaded report:

* **`Project2 - David Hwang.pdf`**
