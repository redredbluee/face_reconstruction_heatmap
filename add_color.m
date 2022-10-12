function   add_color( filename ,errorL1)
  fid = fopen(filename, 'r');
  format1 = fgetl(fid);
  num=str2num(fgetl(fid));
  input=zeros(num(1,1),3);
  for i=1:  num(1,1)
      inputL1(i,:)=str2num(fgetl(fid));
  end
  tri=zeros( num(1,2),3);   
  for i=1:  num(1,2)
     tritemp=str2num(fgetl(fid));
      tri(i,:) =  tritemp(1,2:4);
  end

fclose(fid);
% bL1=load(errorL1);
errorL1(errorL1>0.01)=0.01;
% error_index = ceil(errorL1*409600);
%errorL1(errorL1>0.001)=0.001;
error_index = ceil(errorL1*4096*100);

error_color=jet(4096)
b1=error_color(error_index,:)

fid = fopen(strcat(filename,'color_error.off'), 'w');

fprintf(fid,'COFF\r\n%d %d %d\r\n',num(1,1),num(1,2),0);
for i=1:num(1,1)
     fprintf(fid,'%f %f %f %f %f %f\r\n',inputL1(i,1),inputL1(i,2),inputL1(i,3),b1(i,1),b1(i,2),b1(i,3));
end
for i=1:num(1,2)
     fprintf(fid,'%d %d %d %d \r\n',3,tri(i,1),tri(i,2),tri(i,3));
end
fclose(fid);

end

