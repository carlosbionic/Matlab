% Variables: delta2, V2
% Variables del problema
% x1: delta2
% x2: V2

u = 1.0; % Esto es el V1, fijo
syms x1 x2 % Defino las variables en forma simbolica

% Defino el sistema
g = [4.0*u*x2*sin(x1) + 0.6 , 4.0*x2^2 - 4.0*u*x2*cos(x1) + 0.3];

% Jacobiano
J = jacobian([g(1),g(2)] , [x1,x2]);

% Error limite 
errormax = 0.0001;
error = 1.0; % Lo tomo como error inicial, esto es arbitrario (mayor que errormax)

% Condiciones iniciales
x1 = 0.0; % Corresponde a x1, o delta2 (en radianes)
x2 = 1.0; % Corresponde a x2, o V2
x = [x1,x2].'; % Vector columna de las condiciones iniciales

while error > errormax

    x1 = x(1);
    x2 = x(2);
    xold = x;
    Jinv = (inv((subs(J)))); % Inversa de la matriz Jacobiana
    a = (subs(g)).'; % Traspongo, para que quede columna
    
    % Newton-Raphson
    x = (x - mtimes(Jinv,a));
    
    error = vpa(norm(x - xold)/norm(x)); % Calculo el error en cada iteracion
    
end

delta2 = vpa(x(1)); % vpa evalua la variable simbolica
delta2 = double(delta2); % Convierte a double

V2 = vpa(x(2));
V2 = double(V2);

errorf = vpa(error);
errorf = double(errorf);

fprintf( 'delta2 = %d\n V2 = %d\n error = %d\n', delta2, V2, errorf );

%{
La solucion deberia dar
x1 = -0.166876 rad
x2 = 0.903057
%}