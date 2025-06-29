# Black-Scholes-Merton Option Pricing Model

The Black-Scholes model, also known as the Black-Scholes-Merton (BSM) model, is a fundamental concept in modern financial theory. This repository provides a MATLAB implementation to estimate the theoretical value of derivatives and other investment instruments, considering the impact of time and risk factors.

## Features

- MATLAB implementation of the Black-Scholes-Merton formula
- Manual approximation of the N-distribution using symbolic functions
- Calculates both call and put option prices
- Sensitivity analysis for stock price changes

## Getting Started

### Prerequisites

- MATLAB (R2018b or later recommended)
- Symbolic Math Toolbox

### Running the Code

1.  Download `BSM.m`.
2.  Open MATLAB and navigate to the folder containing `BSM.m`.
3.  Run the script:
    ```matlab
    BSM
    ```
4.  Enter the required parameters when prompted:
    - Stock price
    - Strike price
    - Stock's standard deviation (volatility)
    - Duration (in months)
    - Risk-free rate

## Usage Example

