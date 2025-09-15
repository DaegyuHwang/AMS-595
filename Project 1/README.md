### #Monte Carlo Algorithm

This repository contains MATLAB code that estimates the value of π using the Monte Carlo method.
The project explores different approaches to the simulation, including fixed-point and precision-based termination, and packages the final algorithm into a reusable function.

### #Methodology
The core principle of this simulation is based on the relationship between the area of a circle and a square. 
By randomly generating points within a unit square, the ratio of points that fall inside a quarter-circle inscribed in that square is an approximation of the ratio of their areas. 
By counting the number of points inside the circle and dividing by the total number of points, we can approximate π/4. Multiplying this ratio by 4 gives us an estimate for π.

### #Features
This project is divided into three main tasks, each building on the previous one.

#### Task 1: Fixed-Point Simulation
-Estimates π using a fixed number of random points (10,000) inside a for loop.

-Calculates the deviation and absolute deviation from the true value of π at each step.

-Plots the convergence of the computed value of π.

-Compares the precision (percentage) to the computational cost (time) of the simulation.

#### Task 2: Precision-Based Simulation

-Estimates π using a while loop that continues until a specified level of precision is reached.

-The loop terminates when the gap between the maximum and minimum of the last 50 computed values of π falls below a fixed threshold (0.00005), demonstrating the Law of Large Numbers.

-Reports the total number of iterations required to achieve the desired stability.

#### Task 3: Reusable Function

-Encapsulates the simulation logic from Task 2 into a reusable function named compute_pi.

-The function takes a user-defined precision level as input, allowing for dynamic control over the accuracy of the result.

-Plots the generated random points, differentiating between those inside and outside the quarter-circle with color.

-Displays the final computed value of π both in the command window and as a text annotation on the plots.

-Returns the final computed value, which can be stored in a variable.


### #How to Use
Open the Project_1.m file in MATLAB.

To run the simulation, simply call the function from the MATLAB Command Window, providing your desired precision level as the input argument.

% Example: Run the simulation with a precision of 0.0001
result = compute_pi(0.0001);

The program will automatically generate two plots and display the final computed value and the number of iterations completed.

