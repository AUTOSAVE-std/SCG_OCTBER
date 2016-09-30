
#define echoPin 2 // Echo Pin
#define trigPin 3 // Trigger Pin
#define LEDPin 13 // Onboard LED

int maximumRange = 35; // Maximum range needed
int minimumRange = 0; // Minimum range needed
int one;

bool isLED;
void setup() {
  Serial.begin (9600);
  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);
  pinMode(LEDPin, OUTPUT); // Use LED indicator (if required)
}

int AUTOSAVEsensor(int xtrigPin, int xechoPin) {
  digitalWrite(xtrigPin, LOW);
  delayMicroseconds(2);
  digitalWrite(xtrigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(xtrigPin, LOW);
  int xduration = pulseIn(xechoPin, HIGH);
  int xdistance = xduration / 58.2;
  if (xdistance >= maximumRange || xdistance <= minimumRange) {
    xdistance = 0;
  }
  return xdistance;
}

void loop() {

  isLED = false;

  one = AUTOSAVEsensor(trigPin, echoPin);

  if (one != 0) {
    Serial.println(one, DEC);
    digitalWrite(LEDPin, LOW);
  }
  digitalWrite(LEDPin, HIGH);
  //Delay 100ms before next reading.
  delay(10);
}
