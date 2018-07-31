function [ x,A ] = Gauss( A,b,tol )
%Metodo de resolucion de sistemas de ecuaciones
%mediante el metodo de Gauss
%
%   Esta funcion hace uso de tres funciones
%   Eliminate, Pivot y Substitute

[n,m] = size(A); % Calculo la dimension del sistema
s = zeros(n,1); % Inicializo el array s con ceros
er = 0; 
for i = 1:n
    s(i) = abs(A(i,1)); % Calculo el valor absoluto del elemento (i,1)
    for j = 2:n
        if abs(A(i,j)) > s(i) % Chequeo si es mayor que s(i)
            s(i) = abs(A(i,j)); % Si es mayor, lo guardo
        end
    end
end

% Llamo a la funcion Eliminate
[A,b,er] = Eliminate(A,s,n,b,tol,er);

if er ~= -1
    % Llamo a la funcion Substitute (para calcular la solucion del sistema)
    x = Substitute(A,b,n);
end

end

