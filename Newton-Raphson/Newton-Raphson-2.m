% Variables: delta2, V2
% Variables del problema
% x1: delta2
% x2: V2

u = 1.0; % Esto es el V1, fijo
syms x1 x2 % Defino las variables en forma simbolica

% Defino el sistema de dos ecuaciones
g = [4.0*u*x2*sin(x1) + 0.6 , 4.0*x2^2 - 4.0*u*x2*cos(x1) + 0.3];

% Jacobiano del sistema g, con respecto de las variables x1, x2
J = jacobian([g(1),g(2)] , [x1,x2]);

% Error limite 
errormax = 0.0001;
error = 1.0; % Lo tomo como error inicial, esto es arbitrario (mayor que errormax)

% Condiciones iniciales
x1 = 0.0; % Corresponde a x1, o delta2 (en radianes)
x2 = 1.0; % Corresponde a x2, o V2
x = [x1,x2].'; % Vector columna de las condiciones iniciales

% Mientras el error sea mayor que el error limite, voy acotando la solucion
while error > errormax

    x1 = x(1); % Guardo x(1) en x1
    x2 = x(2); % Guardo x(2) en x2
    xold = x;  % Guardo el vector x en una variable auxiliar xold
    Jinv = (inv((subs(J)))); % Inversa de la matriz Jacobiana
    a = (subs(g)).'; % Traspongo, para que quede columna
    
    % Newton-Raphson
	% Esto es la diferencia entre el vector x y el producto de la inversa
	% del Jacobiano y el vector a
    x = (x - mtimes(Jinv,a));
    
    error = vpa(norm(x - xold)/norm(x)); % Calculo el error en cada iteracion
    
end

delta2 = vpa(x(1)); % vpa evalua la variable simbolica
delta2 = double(delta2); % Convierte a double

V2 = vpa(x(2)); % vpa evalua la variable simbolica
V2 = double(V2); % Convierte a double

errorf = vpa(error); % vpa evalua la variable simbolica
errorf = double(errorf); % Convierte a double

% Imprimo la solucion
fprintf( 'delta2 = %d\n V2 = %d\n error = %d\n', delta2, V2, errorf );

%{
La solucion deberia dar
x1 = -0.166876 rad
x2 = 0.903057
%}
