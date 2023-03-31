clf
clear all
addpath('C:\Program Files\MATLAB\R2021b\examples\globaloptim\main')

figure(1)
ndim = 2;
N = 100;
x = linspace(-50, 50, N);
y = linspace(-50, 50, N);
for i = 1:N,
    for j = 1:N,
        Z(j, i) = griewank([x(i) y(j)]);
    end;
end;
imagesc(x, y, Z);
hold on;
surf(x, y, Z)
view(-35, 25)
colormap(parula(25))
shading interp
xlabel('x')
ylabel('y')
zlabel('z')

% Use a metaheuristic here
rng(233904926);
%%%%%%%%%%%%%%%%% Genetic Algorithms
% options = optimoptions('ga', 'PlotFcn', {@gaplotbestf, @gaplotscorediversity});
% fun = @griewank;
% x = ga(fun, 2, [], [], [], [], [], [], [], options)

%%%%%%%%%%%%%%%%% Simulated Annealing
% x0 = [0 0];
% fun = @griewank;
% lb=[-50, -50];
% ub = [50,50];
% options = optimoptions('simulannealbnd', ...
% 'PlotFcn', {@saplotbestf, @saplotf, @saplotbestx, @saplottemperature});
% x = simulannealbnd(fun, x0, lb, ub, options)

%%%%%%%%%%%%%%%%%% Particle Swarm
% nvars = 2;
% fun = @griewank;
% lb=[-50, -50];
% ub = [50,50];
% options = optimoptions('particleswarm', 'PlotFcn', @pswplotbestf);
% [x, fval] = particleswarm(fun, nvars, lb, ub, options)

%%%%%%%%%%%%%%%%% Simulated Annealing annealingfcn
% x0 = [0 0];
% fun = @griewank;
% lb=[-50, -50];
% ub = [50,50];
% options = optimoptions('simulannealbnd', ...
% 'PlotFcn', {@saplotbestf, @saplotf, @saplotbestx, @saplottemperature}, AnnealingFcn='annealingboltz');
% x = simulannealbnd(fun, x0, lb, ub, options)

%%%%%%%%%%%%%%%%% Genetic Algorithms MutationFcn
% options = optimoptions('ga', 'PlotFcn', {@gaplotbestf, @gaplotscorediversity}, MutationFcn='mutationadaptfeasible');
% fun = @griewank;
% x = ga(fun, 2, [], [], [], [], [], [], [], options)

%%%%%%%%%%%%%%%%% Particle swarm SelfAdjustmentWeight
nvars = 2;
fun = @multirosenbrock;
lb=-10*ones(1, nvars);
ub = -lb;
options = optimoptions('particleswarm', 'PlotFcn', @pswplotbestf, SelfAdjustmentWeight=23);
[x, fval] = particleswarm(fun, nvars, lb, ub, options)


figure(1)
zl = zlim
hold on;
plot3([x(1) x(1)], [x(2) x(2)], zl, 'r-*')