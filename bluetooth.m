%Christopher Coogan

%Super simple bluetooth-serial reader
%%

%Set up bluetooth communication
portNum = [1,2,3];
imuNum = length(portNum);
imuVals(1:3,1:3,1:imuNum) = 1;
for i=1:imuNum
    comPort = sprintf('COM%d',portNum(i));
    %arduino{i} = serial(comPort,'BaudRate',115200); % Bluetooth
    
    %Open bluetooth connection
    %fopen(arduino{i});
end
%%

z = 0;
%Collect accelerometer data from arduinos

% This part needs some work to store the incoming stream into the 3D matrix

while (z<200)
    for i = 1:imuNum
        for j = 1:3
            for k = 1:3
                imuData{i} = cat(1, imuVals(j,k,i), str2double(fgets(arduino{i})));
            end
        end
    end
    z = z+1
end
fclose(arduino1);
%%
%Throw away 0 values
accel_x_1 = accel_x_1(accel_x_1~= 0);
accel_y_1 = accel_y_1(accel_y_1~= 0);
accel_z_1 = accel_z_1(accel_z_1~= 0);
accel_x_2 = accel_x_2(accel_x_2~= 0);
accel_y_2 = accel_y_2(accel_y_2~= 0);
accel_z_2 = accel_z_2(accel_z_2~= 0);
