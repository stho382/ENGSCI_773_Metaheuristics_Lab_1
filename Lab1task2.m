clf
clear all
addpath('C:\Program Files\MATLAB\R2022b\examples\globaloptim\main')

figure(1)
ndim = 2;
N = 10000;
x = -50:1:50;
y = linspace(-50, 50, N);
for i = 1:length(x),
    for j = 1:N,
        X(j, i) = x(i);
        Y(j, i) = y(j);
        Z(j, i) = griewank([x(i) y(j)]);
    end;
end;
zl = [min(min(Z)), max(max(Z))];
c = colormap(parula(25));
[m, n] = size(Z);
for i = 1:length(x),
    for j = 1:N,
        cind = round((Z(j, i) - zl(1)) / (zl(2) - zl(1)) * 24 + 1);
%        disp(cind)
        C(j, i) = cind;
    end;
end;
imagesc(x, y, C);
hold on;
scatter3(X(:), Y(:), Z(:), 5, C(:), 'filled')
view(0.25, 14)
colormap(c)
xlabel('x')
ylabel('y')
zlabel('z')

% Use a GA with integer values for x(1) here

figure(1)
zl = zlim
hold on;
plot3([x(1) x(1)], [x(2) x(2)], zl, 'r-*')
