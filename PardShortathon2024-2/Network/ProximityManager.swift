//
//  ProximityManager.swift
//  PardShortathon2024-2
//
//  Created by KimDogyung on 11/16/24.
//

import CoreBluetooth
import UserNotifications

class ProximityManager: NSObject, CBPeripheralManagerDelegate, CBCentralManagerDelegate {
    
    private var peripheralManager: CBPeripheralManager?
    private var centralManager: CBCentralManager?
    private let serviceUUID = CBUUID(string: "a0056638-212c-4ddc-b540-e3e2f59413d5") // Unique UUID
    private var userID: String

    init(userID: String) {
        self.userID = userID
        super.init()
        peripheralManager = CBPeripheralManager(delegate: self, queue: nil)
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }

    // MARK: - Start Advertising
    private func startAdvertising() {
        guard let userIDData = userID.data(using: .utf8), userIDData.count <= 20 else {
            print("User ID is too long to fit in advertisement data")
            return
        }
        let advertisementData: [String: Any] = [
            CBAdvertisementDataServiceUUIDsKey: [serviceUUID],
            CBAdvertisementDataLocalNameKey: userID
        ]
        print("Starting advertising with ID: \(userID)")
        peripheralManager?.startAdvertising(advertisementData)
    }

    // MARK: - Start Scanning
    private func startScanning() {
        print("Starting scanning for nearby devices...")
        centralManager?.scanForPeripherals(withServices: [serviceUUID], options: nil)
    }

    // MARK: - Stop Operations
    private func stopAdvertising() {
        print("Stopping advertising...")
        peripheralManager?.stopAdvertising()
    }

    private func stopScanning() {
        print("Stopping scanning...")
        centralManager?.stopScan()
    }

    // MARK: - Peripheral Manager Delegate
    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        switch peripheral.state {
        case .poweredOn:
            startAdvertising()
        case .poweredOff, .unsupported, .unauthorized, .resetting, .unknown:
            stopAdvertising()
            print("Peripheral Manager is in state: \(peripheral.state.rawValue)")
        @unknown default:
            print("Unhandled Peripheral Manager state: \(peripheral.state.rawValue)")
        }
    }

    // MARK: - Central Manager Delegate
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        case .poweredOn:
            startScanning()
        case .poweredOff, .unsupported, .unauthorized, .resetting, .unknown:
            stopScanning()
            print("Central Manager is in state: \(central.state.rawValue)")
        @unknown default:
            print("Unhandled Central Manager state: \(central.state.rawValue)")
        }
    }

    func centralManager(
        _ central: CBCentralManager,
        didDiscover peripheral: CBPeripheral,
        advertisementData: [String: Any],
        rssi RSSI: NSNumber
    ) {
        if let nearbyUserID = advertisementData[CBAdvertisementDataLocalNameKey] as? String {
            print("Discovered nearby user with ID: \(nearbyUserID)")
            sendNotification(for: nearbyUserID)
        }
    }

    // MARK: - Notification
    private func sendNotification(for userID: String) {
        let content = UNMutableNotificationContent()
        content.title = "Nearby User Detected"
        content.body = "User \(userID) is nearby."
        content.sound = .default

        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: nil)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
}
