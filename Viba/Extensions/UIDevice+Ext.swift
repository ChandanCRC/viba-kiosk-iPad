//  Viba
//  Created by Radhachandan Chilamkurthy

import UIKit

extension UIDevice {
    static var isSimulator: Bool {
        return TARGET_OS_SIMULATOR != 0
    }

    static var isJailBroken: Bool {
        if UIDevice.isSimulator { return false }
        if JailBroken.hasCydiaInstalled() { return true }
        if JailBroken.isContainsSuspiciousApps() { return true }
        if JailBroken.isSuspiciousSystemPathsExists() { return true }
        return JailBroken.canEditSystemFiles()
    }
}
