#include <Arduino.h>
#include <RF24.h>
#include <nRF24L01.h>

//fuck arduino labels lmoa
//this is the real shit
#define PIN_CSN PCINT9
#define PIN_CE PCINT10
#define PIN_LED PCINT8
#define PIN_MX_A1 PCINT2
#define PIN_MX_A2 PCINT0
#define PIN_MX_B1 PCINT1
#define PIN_MX_B2 PCINT3

#define INTERVAL 50

RF24 radio(PIN_CE, PIN_CSN);

const byte address[6] = "00001";

struct packet
{
    uint8_t PWM_LED = 30;
    uint8_t PWM_MAIN;
    uint8_t PWM_BACK;
} data;
uint8_t battery = 0;
uint16_t x = 0;
uint8_t current_time = 0;
uint8_t previous_time = 0;
uint8_t PWM_counter = 0;

void handlePWM();

void setup()
{
    radio.begin();
    radio.openReadingPipe(0, address);
    //radio.setPALevel(RF24_PA_MIN);
    radio.startListening();
    pinMode(PIN_LED, OUTPUT);
    pinMode(PIN_MX_B2, OUTPUT);
    pinMode(PIN_MX_B1, OUTPUT);
    pinMode(PIN_MX_A2, OUTPUT);
    pinMode(PIN_MX_A1, OUTPUT);
}

void loop()
{
    if (radio.available())
    {
        radio.read(&data, sizeof(data));
    }
    handlePWM();
}

void handlePWM()
{
    PWM_counter = micros() / INTERVAL;
    if(PWM_counter < data.PWM_LED) digitalWrite(PIN_LED, HIGH);
    else digitalWrite(PIN_LED, LOW);

    if(PWM_counter < data.PWM_MAIN)
    {
        digitalWrite(PIN_A1, HIGH);
        digitalWrite(PIN_B1, HIGH);
    } else
    {
        digitalWrite(PIN_A1, LOW);
        digitalWrite(PIN_B1, LOW);
    }

    if(PWM_counter < data.PWM_BACK)
    {
        if(bitRead(data.PWM_BACK, 8))
        {
            digitalWrite(PIN_A2, HIGH);
            digitalWrite(PIN_A1, LOW);
        }
        else
        {
            digitalWrite(PIN_A1, HIGH);
            digitalWrite(PIN_A2, LOW);
        }
    } else
    {
        if(bitRead(data.PWM_BACK, 8))
            digitalWrite(PIN_A2, LOW);
        else
            digitalWrite(PIN_A1, LOW);
    }
}