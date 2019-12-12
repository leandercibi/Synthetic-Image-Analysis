region=datas; %datas is temporarily copied to region
Cell_data=cat(2,datas,volume_list); %volume list concatenated with datas to form Cell_data

Region1=[]; %null matrices are initiated for all regions
Region2=[];
Region3=[];
Region4=[];
Region5=[];
Region6=[];
Region7=[];
Region8=[];
r=1
volume=250*250*250 %volume of label

for i = 1:length(Cell_data) %the whole cell data is scanned to extract cells that lie within a regions boundaries
    if (Cell_data(i,1)<=250)&&(Cell_data(i,2)>250) && (Cell_data(i,3)<250)
        Region1(r,:)=Cell_data(i,:)
        r=r+1
    end    
end

Cell_density_list1=Region1(:,5)  %cell density for each cell is listed
Cell_density1=sum(Cell_density_list1)  %The volumes of cell in a region are added
Cell_density_r1=(Cell_density1)/(volume) %The cell density ratio is calculated with that of region 1
Cells_in_r1=length(Region1) %number of cells in region1
       

r=1
for i = 1:length(Cell_data)
    if (Cell_data(i,1)>250)&&(Cell_data(i,2)>250) && (Cell_data(i,3)<250)
        Region2(r,:)=Cell_data(i,:)
        r=r+1
    end    
end


Cell_density_list2=Region2(:,5)
Cell_density2=sum(Cell_density_list2)
Cell_density_r2=(Cell_density2)/(volume)  
Cells_in_r2=length(Region2)


r=1
for i = 1:length(Cell_data)
    if (Cell_data(i,1)<=250)&&(Cell_data(i,2)<250) && (Cell_data(i,3)<250)
        Region3(r,:)=Cell_data(i,:)
        r=r+1
    end    
end


Cell_density_list3=Region3(:,5)
Cell_density3=sum(Cell_density_list3)
Cell_density_r3=(Cell_density3)/(volume)
Cells_in_r3=length(Region3)

r=1
for i = 1:length(Cell_data)
    if (Cell_data(i,1)>250)&&(Cell_data(i,2)<=250) && (Cell_data(i,3)<250)
        Region4(r,:)=Cell_data(i,:)
        r=r+1
    end    
end


Cell_density_list4=Region4(:,5)
Cell_density4=sum(Cell_density_list4)
Cell_density_r4=(Cell_density4)/(volume)
Cells_in_r4=length(Region4)

r=1
for i = 1:length(Cell_data)
    if (Cell_data(i,1)<=250)&&(Cell_data(i,2)>250) && (Cell_data(i,3)>250)
        Region5(r,:)=Cell_data(i,:)
        r=r+1
    end    
end


Cell_density_list5=Region5(:,5)
Cell_density5=sum(Cell_density_list5)
Cell_density_r5=(Cell_density5)/(volume)
Cells_in_r5=length(Region5)

r=1
for i = 1:length(Cell_data)
    if (Cell_data(i,1)>250)&&(Cell_data(i,2)>250) && (Cell_data(i,3)>250)
        Region6(r,:)=Cell_data(i,:)
        r=r+1
    end    
end


Cell_density_list6=Region6(:,5)
Cell_density6=sum(Cell_density_list6)
Cell_density_r6=(Cell_density6)/(volume)
Cells_in_r6=length(Region6)

r=1
for i = 1:length(Cell_data)
    if (Cell_data(i,1)<=250)&&(Cell_data(i,2)<=250) && (Cell_data(i,3)>250)
        Region7(r,:)=Cell_data(i,:)
        r=r+1
    end    
end


Cell_density_list7=Region7(:,5)
Cell_density7=sum(Cell_density_list7)
Cell_density_r7=(Cell_density7)/(volume)
Cells_in_r7=length(Region7)

r=1
for i = 1:length(Cell_data)
    if (Cell_data(i,1)>250)&&(Cell_data(i,2)<=250) && (Cell_data(i,3)>250)
        Region8(r,:)=Cell_data(i,:)
        r=r+1
    end    
end


Cell_density_list8=Region8(:,5)
Cell_density8=sum(Cell_density_list8)
Cell_density_r8=(Cell_density8)/(volume)
Cells_in_r8=length(Region8)


r1_nearest=Nearest(Region1);   %the average nearest distance for each region is calculated
r2_nearest=Nearest(Region2);
r3_nearest=Nearest(Region3);
r4_nearest=Nearest(Region4);
r5_nearest=Nearest(Region5);
r6_nearest=Nearest(Region6);
r7_nearest=Nearest(Region7);
r8_nearest=Nearest(Region8);

r_nearest=[1,Cells_in_r1,r1_nearest;2,Cells_in_r2,r2_nearest;3,Cells_in_r3,r3_nearest;4,Cells_in_r4,r4_nearest;5,Cells_in_r5,r5_nearest;6,Cells_in_r6,r6_nearest;7,Cells_in_r7,r7_nearest;8,Cells_in_r8,r8_nearest]
csvwrite('Cell_data_volume',Cell_data);
csvwrite('Cells_region1',Region1);                %All the dataset matrices are saved as a csv file
csvwrite('Cells_region2',Region2);
csvwrite('Cells_region3',Region3);
csvwrite('Cells_region4',Region4);
csvwrite('Cells_region5',Region5);
csvwrite('Cells_region6',Region6);
csvwrite('Cells_region7',Region7);
csvwrite('Cells_region8',Region8);
csvwrite('Average_nearest_distance',r_nearest);





function f = Nearest(rn)  %function to find average nearest distance
    d=2 
    f=1
    for i=1:length(rn) %for a coordinate in one row the distance is measure with the coordinates in the remaining rows
        for j=d:length(rn)
            P(1,1:3)=rn(i,1:3)-rn(j,1:3)
            P=P.^2
            Dist=sqrt(sum(P))
            D_list(f)=Dist
            f=f+1
        end
        d=d+1                         %d is incremented so as to limit the range of calculations as the row goes down
        min_list(i)=min(D_list)
    end
    f=mean(min_list)
end


