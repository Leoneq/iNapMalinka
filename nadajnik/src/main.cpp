#include <Arduino.h>
#include <RF24.h>
#include <nRF24L01.h>

//fuck arduino labels lmoa
//this is the real shit
#define PIN_CSN PCINT7
#define PIN_CE PCINT3
#define PIN_ADC_0 PIN_A0
#define PIN_ADC_1 PIN_A2


#define INTERVAL 50

RF24 radio(PIN_CE, PIN_CSN);

const byte address[6] = "00001";

struct packet
{
    uint8_t PWM_LED = 255;
    uint8_t PWM_TOP = 255;
    uint8_t PWM_BOT = 255;
    uint8_t PWM_BACK = 255;
} data;
uint8_t battery = 0;
uint16_t x = 0;
uint8_t current_time = 0;
uint8_t previous_time = 0;
uint8_t PWM_counter = 0;

void setup()
{
    radio.begin();
    radio.setRetries(15, 15);
    radio.openWritingPipe(address);
    radio.stopListening();
    pinMode(PIN_ADC_0, INPUT);
    pinMode(PIN_ADC_1, INPUT);
}

void loop()
{
    data.PWM_TOP = 55;
    data.PWM_BOT = data.PWM_TOP;
    data.PWM_LED = 55;
    radio.write(&data, sizeof(data));
    delay(60);
}
