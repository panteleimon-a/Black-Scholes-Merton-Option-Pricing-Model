% Black-Scholes-Merton Option Pricing Model
% Author: Angelidis Panteleimon
% Refactored for clarity and modularity

function BSM()
    % Main entry point for the Black-Scholes-Merton Option Pricing Model

    % User input
    stockprice = input("Stock price: ");
    strikeprice = input("Strike price: ");
    volatility = input("Stock's standard deviation: ");
    duration = input("Duration (months): ");
    r = input("Risk-free rate: ");

    % Calculate call and put prices
    [C, P, Prices_C, Prices_P] = bsm_option(stockprice, strikeprice, volatility, duration, r);

    % Display results
    fprintf("Call option price: %2.2f\n", C);
    fprintf("Put option price: %2.2f\n", P);
    fprintf('Call option price if stock price changes -10,-5,0,5 and 10pps respectively\n');
    fprintf("C=%f\n", real(Prices_C));
    fprintf('Put option price if stock price changes -10,-5,0,5 and 10pps respectively\n');
    fprintf("P=%f\n", real(Prices_P));
end

function [C, P, Prices_C, Prices_P] = bsm_option(stockprice, strikeprice, volatility, duration, r)
    % Symbolic numbers for BS model function
    S = sym(stockprice);        % current stock price (spot price)
    K = sym(strikeprice);       % exercise price (strike price)
    sigma = sym(volatility);    % stock's std
    T = sym(duration/12);       % expiration in years
    r = sym(r);                 % annualized risk-free interest rate

    % Calculate option price
    PV_K = K * exp(-r * T);
    d1 = (log(S / K) + (r + sigma^2 / 2) * T) / (sigma * sqrt(T));
    d2 = d1 - sigma * sqrt(T);

    % Create N-distribution function
    syms t d
    N = @(d, T) int(exp(-t^2 / 2), t, -Inf, d) * 1 / sqrt(2 * sym(pi));

    % Call and put option prices
    Csym = N(d1, T) * S - N(d2, T) * PV_K;
    digits(6);
    C = double(vpa(Csym));

    Psym = PV_K * N(-d2, T) - S * N(-d1, T);
    digits(6);
    P = double(vpa(Psym));

    % Sensitivity analysis for stock price changes
    j = 0;
    for i = -10:5:10
        j = j + 1;
        d1_changed = (log((1 + i / 100) * S / K) + (r + sigma^2 / 2) * T) / (sigma * sqrt(T));
        C_sym = N(d1_changed, T) * (1 + i / 100) * S - N(d2, T) * PV_K;
        digits(6);
        Prices_C(j) = double(vpa(C_sym));
        P_sym = PV_K * N(-d2, T) - (1 + i / 100) * S * N(-d1_changed, T);
        digits(6);
        Prices_P(j) = double(vpa(P_sym));
    end
end
