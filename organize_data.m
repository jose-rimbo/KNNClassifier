function [train, test] = organize_data(data)

qtd_classes = [0 0 0];

    for (i=1:size(data,1)) 

        index = 0;
        for j=1:3
            if(data(i,j)==1)
                index = j;
                break;
            end;
        end 

        qtd_classes(1,index) = qtd_classes(1,index)+1;   
    end

    qt_train = round(qtd_classes*(1/3));
    qt_test = qtd_classes-qt_train;
    qt_exit = [0 0 0];

    train = [];
    test = [];
    flag = 0;

    while(qt_exit(1,1)<qt_train(1,1) || qt_exit(1,2)<qt_train(1,2) || qt_exit(1,3)<qt_train(1,3))

        r = randi([1 size(data,1)],1,1);  

        for j=1:3
            if(data(r,j)==1)
                index = j;
                break;
            end;
        end 

        if (qt_exit(1,index)<qt_train(1,index))
            qt_exit(1,index) = qt_exit(1,index)+1;            
            flag = 1;       
        end;    

        if(flag == 1) 
            train = [train; data(r,:)];
            if(r == 1) 
                data = data(2:end,:);
            elseif(r == size(data,1))
                data = data(1:size(data,1)-1,:);
            else
                data = data([1:r-1,r+1:end],:);
            end

            flag = 0;
        end    
    end

    test = data;
end

