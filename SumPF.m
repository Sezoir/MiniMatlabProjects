function SumPF
% SUMPF find an approximation of the sum of reciprocal squares with prime factors

% Short function, which returns the number of primes .
primeFactors = @(x) numel(factor(x));
% Set k as a symbol.
syms k;
% Set f as the function we are using for the sum.
f = (-1)^primeFactors(k)/k^2;
% Find the sum of f between k=1 to 1000000.
double(symsum(f, k, 1, 2))
double(symsum(f, k, 1, 3))
double(symsum(f, k, 1, 4))
double(symsum(f, k, 1, 5))
double(symsum(f, k, 1, 6))
double(symsum(f, k, 1, 7))
% symsum(f, k, 1, 1)
% symsum(f, k, 1, 2)
% symsum(f, k, 1, 10000)
% symsum(f, k, 1, 100000)
% symsum(f, k, 1, 1000000)