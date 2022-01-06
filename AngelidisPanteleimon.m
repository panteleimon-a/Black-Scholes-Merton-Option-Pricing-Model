%Black Scholes Model Formula by Angelidis Panteleimon fin19013
stockprice=input("Stock price: ");
strikeprice=input("Strike price: ");
volatility=input("Stock's standard deviation: ");
duration=input("Duration: ");
r=input("Risk-free rate: ");
% symbolic numbers for BS model
S = sym(stockprice);        % current stock price (spot price)
K = sym(strikeprice);         % exercise price (strike price)
sigma = sym(volatility);   % stock's std
T = sym(duration/12);       % expiration in years
r = sym(r);       % annualized risk-free interest rate
% calculate option price
PV_K = K*exp(-r*T);
d1 = (log(S/K) + (r + sigma^2/2)*T)/(sigma*sqrt(T));
d2 = d1 - sigma*sqrt(T);
t=sym('t');
d=sym('d');
N(d,t) = int(exp(-((t)^2)/2),t,-Inf,d)*1/sqrt(2*sym(pi));
Csym = N(d1,T)*S - N(d2,T)*PV_K;
%6 numbers precision depiction of the call option price
digits(6);
C = vpa(Csym);
%calculation of the similar put option price
Psym= PV_K*N(-d2,T)-S*N(-d1,T);
%6 numbers precision depiction of the call option price
digits(6);
P = vpa(Psym);
j=0;
C=double(C);
P=double(P);
sprintf("Call option price:%2.2f ", C)
sprintf("Put option price:%2.2f ", P)
for i=-10:5:10
    j=j+1;
    d1_changed(j) = (log((1+i/100)*S/K) + (r + sigma^2/2)*T)/(sigma*sqrt(T));
    C_sym(j) = N(d1_changed(j),T)*(1+i/100)*S - N(d2,T)*PV_K;
    digits(6);
    Prices_C(j)= vpa(C_sym(j));
    P_sym(j)= PV_K*N(-d2,T)-(1+i/100)*S*N(-d1_changed(j),T);
    digits(6);
    Prices_P(j)= vpa(P_sym(j));
end

Prices_C=double(Prices_C);
Prices_P=double(Prices_P);
       fprintf('Call option price if stock price changes -10,-5,0,5 and 10pps respectively\n');     
        fprintf("C=%f\n",real(Prices_C))
        fprintf('Put option price if stock price changes -10,-5,0,5 and 10pps respectively\n');         
        fprintf("P=%f\n",real(Prices_P))
        
    



