% aircraft vs. F1 aerodynamic comparison
clear; clc; close all;

% ASSUMPTIONS/MODEL LIMITATIONS:
% 1. low speed, incompressible, steady flow (no compressibility effects)
% 2. pre-stall/attached flow only (thin airfoil theory; no stall model)
% 3. 2D lift slope: CL_2D = 2*pi*alpha (alpha in rads)
% 4. finite wing correction via simplified lifting line relation using AR
% only
% 5. drag model: CD = CD0 + CL^2/(pi*AR*e) (CD0 and e = assumed constants)
% 6. no ground effect, endplates, multi-element effects, or wing to wing
% interactions
% 7. results are comparative trends (not absolute CFD quality values)

% angle of attack (degrees)
alpha_deg = -5:1:15;

% convery to radians
alpha = deg2rad(alpha_deg);

% geometry definitions
% aircraft wing
AR_aircraft = 6.7;

% F1 front wing
AR_f1_front = 2.0;

% F1 rear wing
AR_f1_rear = 1.17;

% thin airfoil theory (2D)
CL_2D = 2*pi*alpha;

% 3D lift coefficients
CL_aircraft = CL_2D ./ (1 + CL_2D./(pi*AR_aircraft));
CL_f1_front = CL_2D ./ (1 + CL_2D./(pi*AR_f1_front));
CL_f1_rear = CL_2D ./ (1 + CL_2D./(pi*AR_f1_rear));

% drag assumptions
CD0_aircraft = 0.02;
CD0_f1_front = 0.08;
CD0_f1_rear = 0.10;
e = 0.8; % efficiency factor

% drag coefficient calculation
CD_aircraft = CD0_aircraft + (CL_aircraft.^2)./(pi*AR_aircraft*e);
CD_f1_front = CD0_f1_front + (CL_f1_front.^2)./(pi*AR_f1_front*e);
CD_f1_rear = CD0_f1_rear + (CL_f1_rear.^2)./(pi*AR_f1_rear*e);

% lift to drag ratio
LD_aircraft = CL_aircraft ./ CD_aircraft;
LD_f1_front = CL_f1_front ./ CD_f1_front;
LD_f1_rear = CL_f1_rear ./ CD_f1_rear;

% lift vs. angle of attack plot
figure;
plot(alpha_deg, CL_aircraft, '-o', ...
    alpha_deg, CL_f1_front, '-s', ...
    alpha_deg, CL_f1_rear, '-^');
grid on;
xlabel('Angle of Attack (deg)');
ylabel('Lift Coefficient C_L');
legend('Aircraft Wing', 'F1 Front Wing', 'F1 Rear Wing');
title('Lift Coefficient vs. Angle of Attack')

% lift to drag ratio vs. angle of attack plot
figure;
plot(alpha_deg, LD_aircraft, '-o', ...
    alpha_deg, LD_f1_front, '-s', ...
    alpha_deg, LD_f1_rear, '-^');
grid on;
xlabel('Angle of Attack (deg)');
ylabel('Lift to Drag Ratio');
legend('Aircraft Wing', 'F1 Front Wing', 'F1 Rear Wing');
title('Aerodynamic Efficiency Comparison');

% separate angle of attack for F1 wings (negative AoA for downforce)
alpha_f1_deg = -5:1:15;
alpha_f1 = deg2rad(alpha_f1_deg);

% recompute lift for F1 wings
CL_2D_f1 = 2*pi*alpha_f1;
CL_f1_front = CL_2D_f1 ./ (1 + CL_2D_f1./(pi*AR_f1_front));
CL_f1_rear = CL_2D_f1 ./ (1 + CL_2D_f1./(pi*AR_f1_rear));

% recompute drag for F1 wings
CD_f1_front = CD0_f1_front + (CL_f1_front.^2)./(pi*AR_f1_front*e);
CD_f1_rear = CD0_f1_rear + (CL_f1_rear.^2)./(pi*AR_f1_rear*e);

% plot lift vs. AoA (aircraft vs. F1)
figure;
plot(alpha_deg, CL_aircraft, '-o', ...
    alpha_f1_deg, CL_f1_front, '-s', ...
    alpha_f1_deg, CL_f1_rear, '-^');
grid on;
xlabel('Angle of Attack (deg)');
ylabel('Lift Coefficient C_L');
legend('Aircraft', 'F1 Front Wing', 'F1 Rear Wing');
title('Lift / Downforce Comparison');

% downforce efficiency
DFD_front = abs(CL_f1_front) ./ CD_f1_front;
DFD_rear = abs(CL_f1_rear) ./ CD_f1_rear;

% plot downforce efficiency
figure;
plot(alpha_f1_deg, DFD_front, '-s', ...
    alpha_f1_deg, DFD_rear, '-^');
xlabel('Angle of Attack (deg)');
ylabel('|C_L| / C_D');
legend('F1 Front Wing', 'F1 Rear Wing');
title('Downforce Efficiency Comparison')

% compare all 3 plots
figure;
plot(alpha_deg, LD_aircraft, '-o', ...
    alpha_f1_deg, DFD_front, '-s', ...
    alpha_f1_deg, DFD_rear, '-^');
grid on;
xlabel('Angle of Attack (deg)');
ylabel('Efficiency Metric');
legend('Aircraft L/D', 'F1 Front |CL|/CD', 'F1 Rear |CL|/CD');
title('Aircraft vs. F1 Aerodynamic Efficiency');

% WHAT HAPPENS IS AR CHANGES SLIGHTLY
% sensitivity: change aircraft AR
AR_test = [4, 6.7, 10];

figure; hold on
for i = 1:length(AR_test)
    CL_test = CL_2D ./ (1 + CL_2D./(pi*AR_test(i)));
    CD_test = CD0_aircraft + (CL_test.^2)./(pi*AR_test(i)*e);
    LD_test = CL_test ./ CD_test;
    plot(alpha_deg, LD_test);
end
hold off;
grid on;
xlabel('Angle of Attack (deg)');
ylabel('L/D');
legend('AR = 4', 'AR = 6.7', 'AR = 10');
title('Aircraft Wing Aspect Ratio Sensitivity');

