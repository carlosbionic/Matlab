% Defino la matriz del problema (4x4, compleja)
A = [-16.75j 11.75j 2.5j 2.5j;11.75j -19.25j 2.5j 5j;2.5j 2.5j -5.8j 0;2.5j 5j 0 -8.3j];

% Paso de polares a cartesianas
% [x1,y1] = pol2cart(-90*6.28/360,1.00)
% [x2,y2] = pol2cart(-135*6.28/360,0.68)

% Defino el vector b
b = [0;0;-1j;-0.481-0.481j];

% Resuelvo el sistema usando el metodo de Gauss
[x,er] = Gauss(A,b,0.001);
fprintf('Solución en cartesianas:\n');
x

%Chequeo si A*x - b = 0 (con 5 decimales de precision)
if round(mtimes(A,x)-b,5) == 0
    fprintf('La solución es correcta!!\n\n');
else
    fprintf('La solución es incorrecta\n\n');
end

% Imprimo la solucion en polares
fprintf('Solución en polares:\n');
[theta, rho] = cart2pol(real(x), imag(x));
rho
theta = theta*360/6.28
