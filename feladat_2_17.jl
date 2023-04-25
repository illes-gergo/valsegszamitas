using Distributions, Plots

mu0 = 1.5
mu1 = 1.54

sigma = 3e-2
n = 10.8
ndist0 = Normal(mu0,sigma/sqrt(n))
ndist1 = Normal(mu1,sigma/sqrt(n))

display(quantile(ndist0,0.99))
display(quantile(ndist1,0.02))