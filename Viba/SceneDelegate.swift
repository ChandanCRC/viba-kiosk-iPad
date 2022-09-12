//  Viba
//  Created by Radhachandan Chilamkurthy

import SwiftTraveller
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate, TravellerProtocol {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            self.window = window
            window.makeKeyAndVisible()
            storySwitch(story: .accountSetup, destination: .login)
        }
    }
}
