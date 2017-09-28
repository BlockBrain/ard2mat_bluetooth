%Christopher Coogan

%Super simple bluetooth-serial reader
%%

%Set up bluetooth communication
%b = Bluetooth('RNBT-195D',1);
%b = serial('COM8','BaudRate',115200); % Serial port
b = serial('COM5','BaudRate',115200); % Bluetooth

%%
%Open bluetooth connection
fopen(b);

accel_X = [];
accel_y = [];
accel_z = [];
accel = 0;
i = 0;
while (i<200)
    accel = cat(1, accel, str2double(fgets(b)));
    i = i+1
end
fclose(b);
%%
for i = 1:3:198
    accel_x(i) = accel(i);
    accel_y(i) = accel(i+1);
    accel_z(i) = accel(i+2);
end

accel_x = accel_x(accel_x~= 0);
accel_y = accel_y(accel_y~= 0);
accel_z = accel_z(accel_z~= 0);