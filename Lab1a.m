clf
clear all
addpath('C:\Program Files\MATLAB\R2022b\examples\globaloptim\main')
figure(1)
dejong5fcn
xlabel('x')
ylabel('y')
zlabel('z')
fun = @dejong5fcn;
% x0 = [0 0];
% x = simulannealbnd(fun, x0)
x0 = [0 0];
lb = [-64 -64];
ub = [64 64];
% options = optimoptions('simulannealbnd');
% x = simulannealbnd(fun, x0, lb, ub, options)
options = optimoptions('simulannealbnd', ...
'PlotFcn', {@saplotbestf, @saplotf, @saplotbestx, @saplottemperature});
x = simulannealbnd(fun, x0, lb, ub, options)
figure(1)
zl = zlim
hold on;
plot3([x(1) x(1)], [x(2) x(2)], zl, 'r-*')
Page 5 of 12