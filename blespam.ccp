#include "BLEAdvertiser.h"
#include <BLEDevice.h>
#include <BLEUtils.h>
#include <BLEScan.h>

BLEAdvertiser::BLEAdvertiser() {
    BLEDevice::init("ESP32_BLE_Spam");
    _adv = BLEAdvertising::getInstance();
    _adv->setAdvertisementType(BLE_ADV_TYPE_IND);
    _adv->setAdvertisementInterval(100);
}

void BLEAdvertiser::startFakeAdvertising() {
    char fakeDeviceName[10];
    snprintf(fakeDeviceName, sizeof(fakeDeviceName), "Device_%d", random(1000, 9999));

    BLEAdvertisementData advertisementData;
    advertisementData.setName(fakeDeviceName);
    advertisementData.setManufacturerData(getRandomPayload());

    _adv->setAdvertisementData(advertisementData);
    _adv->start();
    Serial.println("Starting Fake BLE Advertising");
}

void BLEAdvertiser::stopAdvertising() {
    _adv->stop();
    Serial.println("Stopped Fake BLE Advertising");
}

std::string BLEAdvertiser::getRandomPayload() {
    String payload = "";
    for (int i = 0; i < 16; i++) {
        payload += String(random(0, 255), HEX);
    }
    return payload.c_str();
}
