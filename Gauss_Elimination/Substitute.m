function [ x ] = Substitute( A,b,n )
%Esta funcion realiza la sustitucion para calcular la solucion
%final del sistema de ecuaciones

x = zeros(n,1); % Inicializo el vector x con ceros
x(n) = b(n)/A(n,n); % Calculo el ultimo a partir de A(n,n) y b(n)

% Recorro las filas desde la ultima hasta la primera
for i = n-1:-1:1
    
    sum = 0; % Inicializo la variable sum con cero
    for j = i+1:n % Recorro las columnas
        sum = sum + A(i,j)*x(j); % Sumo A(i,j)*x(j) en cada paso
    end
    x(i) = (b(i) - sum)/A(i,i); % Calculo la solucion de cada una
end

end

