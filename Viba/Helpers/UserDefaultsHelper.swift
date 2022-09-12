//  Viba
//  Created by Radhachandan Chilamkurthy

import Foundation

final class UserDefaultsHelper: NSObject, UserDefaultsHelperProtocol {
    private var userDefaults: UserDefaultsProtocol
    private var encoder: PropertListEncoderProtocol
    private var decoder: PropertyListDecoderProtocol

    init(
        userDefaults: UserDefaultsProtocol = UserDefaults.suiteName,
        encoder: PropertListEncoderProtocol = PropertyListEncoder(),
        decoder: PropertyListDecoderProtocol = PropertyListDecoder()
    ) {
        self.userDefaults = userDefaults
        self.encoder = encoder
        self.decoder = decoder
    }

    func set<T: Codable>(for type: T, using key: UserDefaultsKeys) {
        let encodedData = try? encoder.encode(type)
        userDefaults.set(encodedData, forKey: key.rawValue)
        dataSynchronize()
    }

    func get<T: Codable>(for type: T.Type, using key: UserDefaultsKeys) -> T? {
        guard let data = userDefaults.object(forKey: key.rawValue) as? Data else {
            return nil
        }
        let decodedObject = try? decoder.decode(type, from: data)
        return decodedObject
    }

    func setAny<T>(for value: T.Type, using key: UserDefaultsKeys) {
        userDefaults.set(value, forKey: key.rawValue)
        dataSynchronize()
    }

    func getAny<T>(using key: UserDefaultsKeys) -> T? {
        if let value = userDefaults.object(forKey: key.rawValue) as? T {
            return value
        }
        return nil
    }

    func dataSynchronize() {
        userDefaults.synchronize()
    }

    func clear(forKey key: UserDefaultsKeys) {
        userDefaults.removeObject(forKey: key.rawValue)
        dataSynchronize()
    }

    func clearAll() {
        userDefaults.dictionaryRepresentation().keys.forEach { key in
            userDefaults.removeObject(forKey: key)
        }
    }

    func removeSuite(suiteName: String) {
        userDefaults.removeSuite(named: suiteName)
    }
}
