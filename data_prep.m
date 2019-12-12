Data = all  %The 'all' matrix is copied to Datax_list=Data(:,1); %The x,y list is separated to round its value to a closest integer 
x_list=Data(:,1);
y_list=Data(:,2);
z_list=Data(:,3);
radius=Data(:,4);
x_list=round(x_list);
y_list=round(y_list);
Data=[x_list,y_list,z_list,radius]; %The rounded lists are then concatenated to form a matrix
Data = sortrows(Data,[1 2 4],'descend'); %sorted from highest r to lowest r

x=Data(1,1);% the reference values are set
y=Data(1,2);
big_r=0;     


datas=Data
for i=1:length(datas)                         %the for loop is executed to find the slide with the largest radius and the rest are nullified
    if(datas(i,1)==x)&&(datas(i,2)==y)
        if(datas(i,4)>big_r)
            big_r=datas(i,4);
        else
            datas(i,:)=0;
        
        end
    else
        x=datas(i,1);
        y=datas(i,2);
        big_r=datas(i,4)
        disp('buggy');
    end
end

datas=sortrows(datas,[1 2],'descend'); % The data is sorted jus for my reference

zeros = datas(:,1)==0
datas(zeros,:)=[]  %the zero rows are removed
volume_list=(datas(:,4).^3)*4.186
Volume=sum(volume_list)   %the volume list is found usinf the radius list and is concatenated with the data

