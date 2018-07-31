function [ A,b,s ] = Pivot( A,b,s,n,k )
%Esta funcion realiza el pivoteo, en caso de ser necesario 

p = k; % Inicializo p con el valor de k
big = abs(A(k,k)/s(k)); % Guardo el valor en big
for ii = k+1:n
    dummy = abs(A(ii,k)/s(ii)); % Guardo el valor en una variable auxiliar
    if dummy > big % Si es mayor que big, guardo los valores
        big = dummy;
        p = ii;
    end
end

if p ~= k % Si p es distinto de k, hago el intercambio
    for jj = k:n
        dummy = A(p,jj);
        A(p,jj) = A(k,jj);
        A(k,jj) = dummy;
    end
    
    dummy = b(p);
    b(p) = b(k);
    b(k) = dummy;
    dummy = s(p);
    s(p) = s(k);
    s(k) = dummy;
end

end

