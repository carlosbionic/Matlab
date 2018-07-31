function [ A,b,er ] = Eliminate( A,s,n,b,tol,er )
%ELIMINATE Summary of this function goes here
%   Detailed explanation goes here
for k = 1:n-1
    [A,b,s] = Pivot(A,b,s,n,k);
    if abs(A(k,k)/s(k)) < tol
        er = -1;
        break
    end
    
    for i = k+1:n
        factor = A(i,k)/A(k,k);
        for j = k+1:n
            A(i,j) = A(i,j) - factor*A(k,j);
        end
        b(i) = b(i) - factor*b(k);
    end
end

if abs(A(n,n)/s(n)) < tol
    er = -1;
end

end

