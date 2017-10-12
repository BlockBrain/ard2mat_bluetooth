%Christopher Coogan

%Super simple bluetooth-serial reader
%%

%Set up bluetooth communication
arduino1 = serial('COM5','BaudRate',115200); % Bluetooth
arduino2 = serial('COM5','BaudRate',115200); % Bluetooth

%%
%Open bluetooth connection
fopen(arduino1);
fopen(arduino1);

accel_X = [];
accel_y = [];
accel_z = [];
arduinoOneAccel = 0;
arduinoTwoAccel = 0;
i = 0;
%Collect accelerometer data from arduinos
while (i<200)
    arduinoOneAccel = cat(1, accel, str2double(fgets(arduino1)));
    arduinoTwoAccel = cat(1, accel, str2double(fgets(arduino2)));
    i = i+1
end
fclose(arduino1);
fclose(arduino2);
%%
%separate axes from accelerometer data
for i = 1:3:198
    %Arduino 1
       %Accelerometer
    accel_x_1(i) = arduinoOneAccel(i);
    accel_y_1(i) = arduinoOneAccel(i+1);
    accel_z_1(i) = arduinoOneAccel(i+2);
       %Gyrometer
    gyro_x_1(i) = arduinoOneAccel(i+3);
    gyro_y_1(i) = arduinoOneAccel(i+4);
    gyro_z_1(i) = arduinoOneAccel(i+5);
        %Magnetometer
    mag_x_1(i) = arduinoOneAccel(i+6);
    mag_y_1(i) = arduinoOneAccel(i+7);
    mag_z_1(i) = arduinoOneAccel(i+8);
    %Arduino 2
       %Accelerometer
    accel_x_2(i) = arduinoTwoAccel(i);
    accel_y_2(i) = arduinoTwoAccel(i+1);
    accel_z_2(i) = arduinoTwoAccel(i+2);
       %Gyrometer
    gyro_x_2(i) = arduinoTwoAccel(i+3);
    gyro_y_2(i) = arduinoTwoAccel(i+4);
    gyro_z_2(i) = arduinoTwoAccel(i+5);
        %Magnetometer
    mag_x_2(i) = arduinoTwoAccel(i+6);
    mag_y_2(i) = arduinoTwoAccel(i+7);
    mag_z_2(i) = arduinoTwoAccel(i+8);
end
%Throw away 0 values
accel_x_1 = accel_x_1(accel_x_1~= 0);
accel_y_1 = accel_y_1(accel_y_1~= 0);
accel_z_1 = accel_z_1(accel_z_1~= 0);
accel_x_2 = accel_x_2(accel_x_2~= 0);
accel_y_2 = accel_y_2(accel_y_2~= 0);
accel_z_2 = accel_z_2(accel_z_2~= 0);
