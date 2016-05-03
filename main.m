minK = 2;
maxK = 20;

loop = 6;

matrix_man = zeros(maxK-minK+1,loop+1);
matrix_euc = zeros(maxK-minK+1,loop+1);
matrix_min3 = zeros(maxK-minK+1,loop+1);
matrix_min4 = zeros(maxK-minK+1,loop+1);

import_data;

for(i=1:loop)
    [train, test] = organize_data(data);    
    for(j=minK:maxK)
       matrix_man(j-minK+1,i) = KNN(j,1,train,test,-1); 
       matrix_euc(j-minK+1,i) = KNN(j,2,train,test, -1); 
       matrix_min3(j-minK+1,i) = KNN(j,3,train,test, 3);         
       matrix_min4(j-minK+1,i) = KNN(j,3,train,test, 4);         
    end       
end;

for(i=minK:maxK)
    matrix_man(i-minK+1,loop+1) = sum(matrix_man(i-minK+1,:))/loop;
    matrix_euc(i-minK+1,loop+1) = sum(matrix_euc(i-minK+1,:))/loop;
    matrix_min3(i-minK+1,loop+1) = sum(matrix_min3(i-minK+1,:))/loop;    
    matrix_min4(i-minK+1,loop+1) = sum(matrix_min4(i-minK+1,:))/loop;    
end

final = zeros(maxK-minK+2,4);

final(:,1) = [matrix_man(:,1); 0];
final(:,2) = [matrix_euc(:,1); 0];
final(:,3) = [matrix_min3(:,1); 0];
final(:,4) = [matrix_min4(:,1); 0];

for i=1:4    
    final(maxK-minK+2,i) = sum(final(:,i))/(maxK-minK+1);        
end


