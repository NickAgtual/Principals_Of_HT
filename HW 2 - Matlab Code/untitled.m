%% HW3 Q1

%% Defining Variables

w = 2; % Width between cylinders (m)

k = .5; % Thermal conductivity (W/mk)

D1 = .3; % Diameter of cylinder 1 (m)

D2 = .2; % Diameter of cylinder 2 (m)

T1 = 95; % Surface temp 1 (deg C)

T2 = 5; % Surface temp 2 (deg C)

%% Shape Factor

S = (2 * pi) ./ ...
    acosh((4 * (w ^ 2) - (D1 ^ 2) - (D2 ^ 2)) ./ (2 * D1 * D2));