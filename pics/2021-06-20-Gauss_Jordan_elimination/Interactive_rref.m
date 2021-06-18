function [] = Interactive_rref( A,b )
[m,n]=size(A);
[m1,n1]=size(b);
if m ~= m1 
    disp('Input matrix size incompatible')
else
    augA=A;
    augA(:,n+1)=b; A=augA
    [m,n]=size(A);
    % Initialization
    load chirp.mat;ychirp=y;  % a chirp will sound when a row has been reduced
    load gong.mat;ygong=y; % a gong will sound if a pivot cannot be found
    tol = max(m,n)*eps(class(A))*norm(A,'inf');

    % Gauss-Jordan starts
        % Loop over the entire matrix.
        i = 1;    %  index to a row is i
        j = 1;    %  index to a column is j
        jb = [];  % record for the pivot columns
        while (i <= m) && (j <= n)
            clc,A
           % Find value and index of largest element in the remainder of column j.
           [p,k] = max(abs(A(i:m,j)));  % Find value and index of largest element in the remainder of column j.
           k = k+i-1;  %  Row number of the largest element
           if (p <= tol)
              % The column is negligible, zero it out.
              A(i:m,j) = zeros(m-i+1,1);  % Column j is not pivot column, zero remaining entries.
              prompt = ['Column ',num2str(j),' does not have pivot below row ',...
                  num2str(i),' Need to move to next column. Hit enter to continue'];
              sound(ygong);x = input(prompt);
              j = j + 1;
           else
              % Remember column index
              X = [' Found a pivot in column ',num2str(j),' in the (',...
                  num2str(k),',',num2str(j),') position'];disp(X)
              jb = [jb j];  % Record the pivot column
              % Swap i-th and k-th rows to get the largest pivot value in the row.
              X = [' Swap row ',num2str(i),' and ',num2str(k)];disp(X)
              A([i k],j:n) = A([k i],j:n)
              % Divide the pivot row by the pivot element.
              disp('Make the pivot one')
              A(i,j:n) = A(i,j:n)/A(i,j)
              % Subtract multiples of the pivot row from all the other rows.
              for k1 = [1:i-1 i+1:m]
                 X = ['In row ',num2str(k1),' the entry (',num2str(k1),',',num2str(j),...
                          ') will be zeroed with a row replacement'];
                 disp(X), A(k1,j:n) = A(k1,j:n) - A(k1,j)*A(i,j:n)
              end
              prompt = ['Reduced column ',num2str(j),' and is on row ',...
                  num2str(j),' Hit enter to continue'];sound(ychirp, Fs); x = input(prompt);
              i = i + 1;  % move to next row
              j = j + 1;  % move to next column
           end
        end
    end
end