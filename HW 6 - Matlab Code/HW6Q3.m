% HW6 Q3

%% Defining given values

Pr = .7062; % Prentell #
v = 16.44 * 10 ^ -6; % Kinematic viscosity 
V = 1; % velocity 
k = .02671; % thermal conductivity

Tinf = 45; % air temp
Ts = 20; % surface temp

syms x

%% Laminar Case

laminar = (5 * x) / ((Pr ^ (1/3)) * sqrt(x / v));

%% Turbulent Case

turbulent = .37 * x * ((x/v)^(-1/5));

%% Solving for x

EQ = laminar == turbulent;

x = double(solve(EQ, x));

%% Solving for Heat Flux for both cases

syms hTurb hLam

% Turbulent

NuTurb = .0296 * ((x / v)^(4/5)) * (Pr^(1/3));

TurbEQ = NuTurb == hTurb * x / k;

hTurb = solve(TurbEQ, hTurb);

heatFluxTurb = hTurb * (Tinf - Ts);

% Laminar

NuLam = .332 * ((V * x /v)^(1/2)) * (Pr ^ (1/3));

LamEQ = NuLam == hLam * x / k;

hLam = solve(LamEQ, hLam);

heatFluxLam = hLam * (Tinf - Ts);

