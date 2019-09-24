import processing.serial.*; //Libreria que conecta Processing con Arduino
Serial MiSerial;

String portStream;
int BOTON = 0;
int BOTON2 = 0;

void setup() {
  size (400, 300);
  String NombrePuerto = Serial.list()[0]; //Puerto en el que se conecta Arduino
  MiSerial = new Serial(this, NombrePuerto, 9600);
  MiSerial.bufferUntil ('\n');
}

void draw() {

  if (portStream!= null) {
    if (portStream.length() == 6 && portStream.charAt(0) == 'S' && portStream.charAt(3) == 'E') {
      BOTON = int (portStream.substring (1, 2));
      BOTON2 = int (portStream.substring (1, 2));

      if (BOTON == 1) {
        fill (0, 255, 0);
        rect(0, 0, 200, 300);
      } else {
        fill (200);
        rect(0, 0, 200, 300);
      }

      if (BOTON2 == 1) {
        fill (#FFF700);
        rect(200, 0, 200, 300);
      } else {
        fill (200);
        rect(200, 0, 200, 300);
      }
    }
  }
}

void serialEvent (Serial MiSerial) {
  portStream = MiSerial.readString();
}
