//  Viba
//  Created by Radhachandan Chilamkurthy

import Foundation

protocol UserDefaultsHelperProtocol {
    func set<T: Codable>(for type: T, using key: UserDefaultsKeys)
    func get<T: Codable>(for type: T.Type, using key: UserDefaultsKeys) -> T?
    func setAny<T>(for value: T.Type, using key: UserDefaultsKeys)
    func getAny<T>(using key: UserDefaultsKeys) -> T?
    func clear(forKey key: UserDefaultsKeys)
    func clearAll()
    func dataSynchronize()
    func removeSuite(suiteName: String)
}

protocol UserDefaultsProtocol: AnyObject {
    func set(_ value: Any?, forKey defaultName: String)
    func object(forKey defaultName: String) -> Any?
    @discardableResult
    func synchronize() -> Bool
    func removeObject(forKey defaultName: String)
    func dictionaryRepresentation() -> [String: Any]
    func removeSuite(named suiteName: String)
}

protocol PropertListEncoderProtocol: AnyObject {
    func encode<T>(_ value: T) throws -> Data where T: Encodable
}

protocol PropertyListDecoderProtocol: AnyObject {
    func decode<T>(_ type: T.Type, from data: Data) throws -> T where T: Decodable
}

extension UserDefaults: UserDefaultsProtocol {
    static var suiteName: UserDefaults {
        UserDefaults(suiteName: Bundle.main.bundleIdentifier)!
    }
}

extension PropertyListEncoder: PropertListEncoderProtocol {}
extension PropertyListDecoder: PropertyListDecoderProtocol {}
