using Distributions, Plots, StatsPlots
# 2-1 példa

mu = 10;
sigma2 = 0.25;
n = 5;
p = 0.95;
p_f = 1 - (1 - 0.95) / 2;
p_a = (1 - 0.95) / 2;

mu_atlag = mu;
sigma2_atlag = sigma2 / n;

dist_atlag = Normal(mu_atlag, sqrt(sigma2_atlag))
also_hatar = quantile(dist_atlag, p_a)
felso_hatar = quantile(dist_atlag, p_f)


plot(dist_atlag, label="Átlag",xlims=[8,12])
scatter!([felso_hatar, also_hatar], [pdf(dist_atlag, felso_hatar), pdf(dist_atlag, also_hatar)])

dist_meres = Normal(mu, sqrt(sigma2))
also_hatar_meres = quantile(dist_meres, p_a)
felso_hatar_meres = quantile(dist_meres, p_f)

plot!(dist_meres, label="Mérés")
display(scatter!([felso_hatar_meres, also_hatar_meres], [pdf(dist_meres, felso_hatar_meres), pdf(dist_meres, also_hatar_meres)]))

# 2-2 példa
# a: s^2 = chi^2(n)*sigma^2/nu

sigma2 = 0.08;
n = 8;
nu = n - 1;
dist = Chisq(nu);
probab = 0.95;
farkinca = (1 - probab) / 2;

P_Inv(x) = quantile(dist, x)
P(x) = pdf(dist, x)

also_hatar = P_Inv(farkinca)
felso_hatar = P_Inv(1 - farkinca)

megoldas_also = also_hatar * sigma2 / nu
megoldas_felso = felso_hatar * sigma2 / nu

plot(dist, label="Khi^2")
(scatter!([also_hatar, felso_hatar], [P(also_hatar), P(felso_hatar)]))

# b: 

x = P_Inv(0.95) * sigma2 / nu
x_ = P_Inv(0.95)
display(scatter!([x_],[P(x_)]))

# 2-3 példa

x_ = 24.864
n = 10
nu = n - 1

s2 = 0.89422
s = 0.946

konfidencia = 0.95
farkinca = (1-konfidencia)/2

dist = TDist(nu)
P(x) = pdf(dist,x)
P_Inv(x) = quantile(dist,x)

t = P_Inv(farkinca) 
# t = (x_ -mu)*sqrt(n)/s

megoldas_felso = x_+t*s/sqrt(n)
megoldas_also = x_-t*s/sqrt(n)

plot(dist,label="Student")
display(scatter!([-t,t],[P(-t),P(t)]))

# 2-4 példa

n1 = 4
n2 = 7

nu1 = n1-1
nu2 = n2-1

valseg = 0.9

farkinca = (1-valseg)/2

dist = FDist(nu1,nu2)

P(x) = pdf(dist,x)
P_Inv(x) = quantile(dist,x)

megoldas_felso = P_Inv(1-farkinca)
megoldas_also = P_Inv(farkinca)

plot(dist,xlims=[0,10])
display(scatter!([megoldas_felso,megoldas_also],[P(megoldas_felso),P(megoldas_also)]))