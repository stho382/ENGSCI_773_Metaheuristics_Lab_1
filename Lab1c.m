clf
clear all
addpath('C:\Program Files\MATLAB\R2022b\examples\globaloptim\main')
figure(1)
ndim = 2;
N = 100;
x = linspace(-2, 2, N);
y = linspace(-1, 3, N);
for i = 1:N,
for j = 1:N,
Z(j, i) = multirosenbrock([x(i) y(j)]);
end;
end;
surf(x, y, Z)
colormap(parula(25))
shading interp
xlabel('x')
ylabel('y')
zlabel('z')

rng default;
nvars = 2;
fun = @multirosenbrock;
lb=-10*ones(1, nvars);
ub = -lb;
options = optimoptions('particleswarm', 'PlotFcn', @pswplotbestf);
[x, fval] = particleswarm(fun, nvars, lb, ub, options)
figure(1)

zl = zlim
hold on;
plot3([x(1) x(1)], [x(2) x(2)], zl, 'r-*')