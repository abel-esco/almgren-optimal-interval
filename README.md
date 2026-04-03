# Localization of the Optimal Interval in a Simplified Almgren Problem

MATLAB experiments supporting the theoretical proofs regarding the localization of the minimizing interval in a simplified 1D Almgren variational problem.

## Problem

Let $q(x)$ be a continuous function that is strictly decreasing on $(-\infty, 0]$ and strictly increasing on $[0, \infty)$.

Define the area functional:
$$A(a) = \int_{a}^{a+1} q(x) dx$$

The goal is to determine where the interval $[a, a+1]$ should be placed to minimize the area under the curve. The theoretical result proves that the unique minimizing interval must necessarily straddle the origin.

## Computational Experiments

MATLAB was used to evaluate the area functional numerically, verifying the analytical proofs for specific piecewise-defined potential energies characterized by asymmetric polynomial growth rates (e.g., $q(x) = x^6$ for $x < 0$ and $q(x) = 10x^2$ for $x \ge 0$).

The script `smallest_interval.m` utilizes `fminbnd` and numerical integration to compute the global minimum. Crucially, the search boundaries are restricted to `[-1, 0]`, computationally verifying the mathematical proof that the unique optimizer must exist within this exact window.

### Example Plot of the Area Functional:
*(Leave your current image link here)*

Example plot of the area functional:

![Area Functional Plot](figures/area_functional_plot.png)

## Repository Structure

src/  
MATLAB scripts used for numerical experiments.

src/utils/  
Helper scripts created during experimentation.

figures/  
Plots illustrating the behavior of the area functional.

## Author

Abel E.
CS @ Kennesaw State University
