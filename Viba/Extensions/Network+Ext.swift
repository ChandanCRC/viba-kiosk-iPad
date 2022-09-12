//  Viba
//  Created by Radhachandan Chilamkurthy

import Foundation
import NetworkClient

extension Network {
    static var certificate: SecCertificate? {
        switch SecCertificate.loadFromBundle() {
        case let .success(cert):
            return cert
        case let .failure(error):
            print(error)
            return nil
        }
    }

    static var session: Network {
        guard let certificate = certificate else {
            return Network()
        }

        let network = Network(configuration: .defaultConfig,
                              delegateQueue: OperationQueue(),
                              pinning: SSLPinning.certificatePinning(certificate: certificate, hash: SecCertificate.hashKey))
        return network
    }
}
