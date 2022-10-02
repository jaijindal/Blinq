#define echoPin 2 // attach pin D2 Arduino to pin Echo of HC-SR04
#define trigPin 3 //attach pin D3 Arduino to pin Trig of HC-SR04

#include <SoftwareSerial.h>
#define BTTX 9 
#define BTRX 10
SoftwareSerial SerialBT(BTTX, BTRX); 

#include "DHT.h"
#define DHTPIN 7
#define DHTTYPE DHT11
DHT dht(DHTPIN, DHTTYPE);

float dataSent[3];

// defines variables
long duration; // variable for the duration of sound wave travel
int distance; // variable for the distance measurement

void setup() {
  pinMode(trigPin, OUTPUT); // Sets the trigPin as an OUTPUT
  pinMode(echoPin, INPUT); // Sets the echoPin as an INPUT
  SerialBT.begin(9600);
  SerialBT.println("Bluetooth connection activated");
  dht.begin();
  
}
void loop() {
  // Clears the trigPin condition
  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);
  // Sets the trigPin HIGH (ACTIVE) for 10 microseconds
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);
  // Reads the echoPin, returns the sound wave travel time in microseconds
  duration = pulseIn(echoPin, HIGH);
  // Calculating the distance
  distance = duration * 0.034 / 2; // Speed of sound wave divided by 2 (go and back)
  // Displays the distance on the Serial Monitor
  //Serial.print("Distance: ");
  //Serial.print(distance);
  //Serial.println(" cm")
  float hum = dht.readHumidity();
  float temp = dht.readTemperature();
  dataSent[0] = distance;
  dataSent[1] = temp;
  dataSent[2] = hum;

  
  SerialBT.print(dataSent[0]);
  SerialBT.print(",");
  SerialBT.print(dataSent[1]);
  SerialBT.print(",");
  SerialBT.print(dataSent[2]);
  SerialBT.println();

  
  delay(1500);
}
