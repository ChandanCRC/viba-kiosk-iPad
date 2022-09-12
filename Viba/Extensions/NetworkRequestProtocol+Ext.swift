//  Viba
//  Created by Radhachandan Chilamkurthy

import Foundation
import NetworkClient

extension NetworkRequestProtocol {
    var baseURL: String {
        Configuration.baseUrl.description
    }

    var apiKey: String? {
        nil
    }
}
