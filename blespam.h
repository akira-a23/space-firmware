#ifndef BLE_ADVERTISER_H
#define BLE_ADVERTISER_H

#include <BLEDevice.h>
#include <BLEUtils.h>
#include <BLEScan.h>

class BLEAdvertiser {
public:
    BLEAdvertiser();
    void startFakeAdvertising();
    void stopAdvertising();

private:
    BLEAdvertising *_adv;
    std::string getRandomPayload();
};

#endif // BLE_ADVERTISER_H
