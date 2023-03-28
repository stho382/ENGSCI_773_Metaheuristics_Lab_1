figure(1)
N = 100;
x = linspace(-6, 2, N);
y = linspace(-4, 4, N);
for i = 1:N,
for j = 1:N,
Z(j, i) = ps_example([x(i) y(j)]);
end;
end;
surf(x, y, Z)
shading interp
colormap('jet')
xlabel('x')
ylabel('y')
zlabel('z')

rng default
options = optimoptions('ga', 'PlotFcn', {@gaplotbestf, @gaplotscorediversity});
fun = @ps_example;
x = ga(fun, 2, [], [], [], [], [], [], [], options)

figure(1)
zl = zlim
hold on;
plot3([x(1) x(1)], [x(2) x(2)], zl, 'r-*')