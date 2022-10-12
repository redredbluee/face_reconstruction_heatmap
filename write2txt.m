function write2txt(savename, error)
fid = fopen(strcat(savename,'.txt'), 'w');
[n,m]=size(error);
for i=1:n
%     fprintf(fid,'%f %f %f\r\n',error(i,1),error(i,2),error(i,3));
    fprintf(fid,'%f\r\n',error(i));
end

fclose(fid);
end
