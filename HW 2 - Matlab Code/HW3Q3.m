%% HW3 Q3

%% Defining Variables

TE = 300;
TC = 348.5;
TB = 374.6;
TA = 398;
TD = 300;

dY = 5 * 10^-3;
dX = 5 * 10^-3;

k = 20;

qDot = 5 * 10^7;

syms T1 T2 T3

%% Definign Nodal Equations

nodeA = (k * (T2 - TA)) + (k * (TB - TA)) + (qDot * dY * dX * .5) == 0;

node3 = (-4 * T3) + TC + T2 + TB + TE + (qDot * (dY/2) * (dX) * (1/k)) ...
    == 0;

node1 = (k * (TD - T1)) + (k * (TC - T1)) + (k * (T2 - T1)) + (qDot * ...
    dX * dY * .5) == 0;

%% Solving System of Equations

[A, b] = equationsToMatrix([nodeA node3 node1], [T1 T2 T3]);

solutions = linsolve(A, b);

