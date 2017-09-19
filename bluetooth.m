%Christopher Coogan

%Super simple bluetooth-serial reader
%%

%Set up bluetooth communication
b=Bluetooth('HC-06',1);
%%
%Open bluetooth connection
fopen(b);

i=0;
acc_values = [];
while (i<50)
    %Look for start bit
    read_vals=fread(b,1);
    if(read_vals==49)
        %Print out x,y,z values from Arduino
        acc_values = cat(1, acc_values, fread(b,3));
    end
    i=i+1;
end
%Close bluetooth connection
fclose(b);