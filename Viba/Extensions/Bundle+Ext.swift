//  Viba
//  Created by Radhachandan Chilamkurthy

import Foundation

extension Bundle {
    static var appName: String {
        guard let appName = main.object(forInfoDictionaryKey: "APP_NAME") as? String else {
            fatalError("App name missing in Plist")
        }
        return appName
    }

    static var baseUrl: String {
        guard let baseUrl = main.object(forInfoDictionaryKey: "API_BASE_URL") as? String else {
            fatalError("Base url missing in Plist")
        }
        return baseUrl
    }

    static var appVersion: String {
        guard let appVersion = main.object(forInfoDictionaryKey: "APP_VERSION") as? String else {
            fatalError("App version missing in Plist")
        }
        return appVersion
    }

    static var bundleId: String {
        guard let appBundleId = main.object(forInfoDictionaryKey: "APP_BUNDLE_ID") as? String else {
            fatalError("App bundle id missing in Plist")
        }
        return appBundleId
    }
}
