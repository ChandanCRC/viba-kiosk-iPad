//  Viba
//  Created by Radhachandan Chilamkurthy

import Foundation

enum Configuration {
    case baseUrl
    case appName
    case appVersion
    case bundleId

    var description: String {
        switch self {
        case .baseUrl:
            return Bundle.baseUrl
        case .appName:
            return Bundle.appName
        case .appVersion:
            return Bundle.appVersion
        case .bundleId:
            return Bundle.bundleId
        }
    }
}
