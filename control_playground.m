% Prepreparations
close all

% System Transfer Function + Gain
sys = tf([1], [1 2 1 0]);
k = 1;

% Open-Loop System Root Locus
figure
rlocus(sys * k)

% Open-Loop System Step Response
figure
step(k * sys)

% Open-Loop Nyquist Plot using Custom Function (to see encirclements with r=inf)
figure
nyqlog(k * sys)

% Open-Loop Nyquist Plot with Unit Circle
figure 
nyquist(sys * k)
% hold on;
% n = 1000; %// Define number of points on circle
% theta = linspace(0, 2*pi, n);
% x = cos(theta);
% y = sin(theta);
% plot(x, y); %// Unit circle to visualize 

% Open-Loop Bode Plot
figure
bode(k * sys)

% Closed-Loop Bode Plot
figure
bode(feedback(k * sys, [1]))

% Open-Loop Nichols Plot
figure
nichols(sys * k)

% Linear System Analyzer can switch between different types of graphs
% linearSystemAnalyzer(sys * k)

% Display the values of Wc, Wp, Gm, Pm (Gm is not calculated correctly)
%[Gm,Pm,Wcg,Wcp] = margin(sys * k)

% Closed-Loop System Transfer Function
sys_fb = feedback(k * sys, [1]);

% Closed-Loop Nyquist Plot (Just to visualize it)
figure
nyquist(sys_fb)

% Closed-Loop Nichols Plot (Just to visualize it)
% figure
% nichols(sys_fb)

% Closed-Loop System Step Response
figure
step(sys_fb)