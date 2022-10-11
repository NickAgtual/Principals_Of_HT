%% Given Data
% Thermal conductivity [W/m]
k = 1.4;
% Surface emmisivity
e = .8;
% Convection heat transfer coefficient [W/m^2]
h = 5;
% Surface Temeprature [Kelvin]
TsK = 600 + 273.15;
% Temperature Gradient [K/m]
tempGrad = 15273;
% Stefan-Boltzmann Constant [W/m^2 * K^4]
sigma = 5.67 * 10^-8;

%% Solving For Lowest Air Temperature
% EdotIn - EdotOut + EdotGen = EdotStore

% Creating symbolic variable T
syms T

% Defining energy balance equation
energyBalance = @(T) -((-k * tempGrad) + (h * (TsK - T)) + ...
    (e * sigma * ((TsK^4) - (T^4)))) == 0;

% Solving fourth order equation for air temperature
% Only outputing real solutions
TairK = solve(energyBalance, T, 'MaxDegree', 4, 'Real', true);

% Eliminating negative solutions
solutions = TairK(TairK > 0);

% Printing solution
fprintf('Minimum Air Temperature: %d Kelvin \n', min(solutions))

   





