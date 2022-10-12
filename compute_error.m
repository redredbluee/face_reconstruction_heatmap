for ii=0:1
    %origin_filename = strcat('E:\用户数据\桌面\ICME\mesh\human\ori\ori-00',num2str(ii),'.off')
    %compare_filename = strcat('E:\用户数据\桌面\ICME\mesh\human\our\error_ourtest_00',num2str(ii),'.off')
    origin_filename = 'C:\Users\Administrator\Desktop\fuck\high_smile\gt\origin-000.off'
    compare_filename = 'C:\Users\Administrator\Desktop\fuck\high_smile\coma\old_pred-000.off'
    %compare_filename = 'C:\Users\Administrator\Desktop\fuck\high_smile\our\pred-014.off'
    fid = fopen(origin_filename, 'r');
    format1 = fgetl(fid);
    num=str2num(fgetl(fid));
    input1=zeros(num(1,1),3);
    input1_col=zeros(num(1,1),3);
    for i=1:  num(1,1)
        input1_col(i,:)=str2num(fgetl(fid));
        input1(i,:)=input1_col(i,1:3);
    end
    fclose(fid);
    fid = fopen(compare_filename, 'r');
    format1 = fgetl(fid);
    num=str2num(fgetl(fid));
    input2=zeros(num(1,1),3);
    input2_col=zeros(num(1,1),3);
    for i=1:  num(1,1)
        input2_col(i,:)=str2num(fgetl(fid));
        input2(i,:)=input2_col(i,1:3);
    end
    fclose(fid);
    
    error = sqrt(sum((input2-input1).^2,2));
    write2txt('errresult',error);
    add_color( compare_filename ,error);
end


