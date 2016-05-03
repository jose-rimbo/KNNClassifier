function [ratio] = KNN(K,distance_type, train, test, minW)    
    clc;
    
    %Manhattan = 1
    %Euclidian = 2 
    %Minkowsk  = 3
    DISTANCE_TYPE = distance_type;

    matches = 0;

    for(k=1:size(test,1))
        x = test(k,:);
        d = [];

        %Manhattan
        if(DISTANCE_TYPE==1)
            for (i=1:size(train,1))  
                temp = [0 0 0 0];    
                for (j=4:size(test,2))
                    temp(1,j-3) = abs(test(k,j)- train(i,j)) ;     
                end
                d = [d; sum(temp)];    
            end
        end

        %Euclidian
        if(DISTANCE_TYPE==2)
            for (i=1:size(train,1))  
                temp = [0 0 0 0];    
                for (j=4:size(test,2))
                    temp(1,j-3) = power(test(k,j)- train(i,j),2) ;     
                end
                d = d.^(1/2);
                d = [d; sum(temp)];    
            end
        end
    
        %Minkowsk
        if(DISTANCE_TYPE==3)
            for (i=1:size(train,1))  
                temp = [0 0 0 0];    
                for (j=4:size(test,2))
                    temp(1,j-3) = power(test(k,j)- train(i,j),minW) ;     
                end
                d = d.^(1/minW);
                d = [d; sum(temp)];    
            end
        end

        result = [train d];
        result = sortrows(result,8);
        result = result(1:K,:);


        sums = [0 0 0];
        qtd_classes = [0 0 0];

        for (i=1:size(result,1)) 
            index = 0;
            for j=1:3
                if(result(i,j)==1)
                    index = j;
                    break;
                end;
            end   

            qtd_classes(1,index) = qtd_classes(1,index)+1;
            sums(1,index) = sum(1,index) + result(i,8);

        end

        [index,index] = min(sums./qtd_classes);
        if (test(k,index)==1)
            matches = matches+1;
        end;

    end;

    ratio = matches/size(test,1);

end





