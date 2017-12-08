%Christopher Coogan

%Super simple bluetooth-serial reader
%%

%Set up bluetooth communication
%accel, gyro, mag
%b = Bluetooth('RNBT-195D',1);
%b = serial('COM8','BaudRate',115200); % Serial port
b = serial('COM7','BaudRate',115200); % Bluetooth
fopen(b)
%%
imuNum=1
z=0;
while z <10
for i=1:20
    imuData{i} = fgets(b);
    accel{i} = strfind(imuData{i}, '-1');
    gyro{i} = strfind(imuData{i}, '-2');
    mag{i} = strfind(imuData{i}, '-3');

end

[o,foundAccelPos] = find(cellfun(@(x)isequal(x,1),accel));
[o,foundGyroPos] = find(cellfun(@(x)isequal(x,1),gyro));
[o,foundMagPos] = find(cellfun(@(x)isequal(x,1),mag));

acclTimeVals(1) = str2num(imuData{foundAccelPos(1)+1});
acclTimeVals(2) = str2num(imuData{foundAccelPos(1)+2});
acclTimeVals(3) = str2num(imuData{foundAccelPos(1)+3});
gyroTimeVals(1) = str2num(imuData{foundGyroPos(1)+1});
gyroTimeVals(2) = str2num(imuData{foundGyroPos(1)+2});
gyroTimeVals(3) = str2num(imuData{foundGyroPos(1)+3});
magTimeVals(1) = str2num(imuData{foundMagPos(1)+1});
magTimeVals(2) = str2num(imuData{foundMagPos(1)+2});
magTimeVals(3) = str2num(imuData{foundMagPos(1)+3});
z=z+1

imuValues{z} = [
    acclTimeVals(1:3)
    gyroTimeVals(1:3)
    magTimeVals(1:3)
    ]

end
%close port when done collecting data
%fclose(b);
