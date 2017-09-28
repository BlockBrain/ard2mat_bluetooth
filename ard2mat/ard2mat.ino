int x_data;
int y_data;
int z_data;

void setup()
{
Serial.begin(9600);
pinMode(A0,INPUT);
pinMode(A1,INPUT);
pinMode(A2,INPUT);
x_data = analogRead(A0);
y_data = analogRead(A1);
z_data = analogRead(A2);

//Just for testing purposes:
x_data = 1;
y_data = 2;
z_data = 3;
}
void loop()
{
      Serial.write('1'); //Place holder for start byte
      Serial.write(x_data);
      Serial.write(y_data);
      Serial.write(z_data);
}
