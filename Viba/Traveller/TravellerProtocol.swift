//  Viba
//  Created by Radhachandan Chilamkurthy

import SwiftTraveller
import UIKit

protocol TravellerProtocol {
    func storySwitch(
        story: Stories,
        destination: Destinations,
        animated: Bool,
        hidesTopBar: Bool,
        hidesBottomBar: Bool,
        modelTransistion: UIModalTransitionStyle
    )

    func push(
        type: Destinations,
        animated: Bool,
        hidesTopBar: Bool,
        hidesBottomBar: Bool,
        modelTransistion: UIModalTransitionStyle,
        modelPresentation: UIModalPresentationStyle
    )
    func pop(type: Destinations?, root: Bool)

    func present(
        type: Destinations,
        animated: Bool,
        hidesTopBar: Bool,
        hidesBottomBar: Bool,
        modelTransistion: UIModalTransitionStyle,
        modelPresentation: UIModalPresentationStyle
    )
    func dismiss()

    func addChild(type: Destinations)
    func removeChild()

    func performSegue(story: Stories, type: Destinations)
    func unWind(story: Stories, type: Destinations)
}

// MARK: Story Switching

extension TravellerProtocol {
    func storySwitch(
        story: Stories,
        destination: Destinations,
        animated: Bool,
        hidesTopBar: Bool,
        hidesBottomBar: Bool,
        viewAnimation: UIView.AnimationOptions
    ) {
        let story = UIStoryboard(name: story.rawValue, bundle: nil)
        Traveller.route.switchRootViewController(
            storyBoard: story,
            controllerDestination: .type(val: destination.rawValue),
            hidesTopBar: hidesTopBar,
            hidesBottomBar: hidesBottomBar,
            animated: animated,
            window: UIWindow.window,
            viewAnimation: viewAnimation
        ).perform()
    }
}

// MARK: Push&Pop

extension TravellerProtocol {
    func push(
        type: Destinations,
        animated: Bool = true,
        hidesTopBar: Bool = true,
        hidesBottomBar: Bool = true,
        modelTransistion: UIModalTransitionStyle = .crossDissolve,
        modelPresentation: UIModalPresentationStyle = .automatic
    ) {
        Traveller.route.push(
            controller: .type(val: type.rawValue),
            animated: animated,
            hidesTopBar: hidesTopBar,
            hidesBottomBar: hidesBottomBar,
            modelTransistion: modelTransistion,
            modelPresentation: modelPresentation
        ).perform()
    }

    func pop(type: Destinations?, root: Bool) {
        guard let destinationType = type else {
            Traveller.route.pop(
                toRootController: root,
                animated: true,
                modelTransistionStyle: .crossDissolve
            ).perform()
            return
        }

        Traveller.route.popToViewController(
            destination: .type(val: destinationType.rawValue),
            animated: true,
            modelTransistionStyle: .crossDissolve
        ).perform()
    }
}

// MARK: Present&Dismiss

extension TravellerProtocol {
    func present(
        type: Destinations,
        animated: Bool,
        hidesTopBar: Bool,
        hidesBottomBar: Bool,
        modelTransistion: UIModalTransitionStyle,
        modelPresentation: UIModalPresentationStyle
    ) {
        Traveller.route.present(
            controller: .type(val: type.rawValue),
            animated: animated,
            hidesTopBar: hidesTopBar,
            hidesBottomBar: hidesBottomBar,
            modelTransistion: modelTransistion,
            modelPresentation: modelPresentation
        ).perform()
    }

    func dismiss() {
        Traveller.route.dismiss(modelTransistionStyle: .crossDissolve, animated: false) { _ in }.perform()
    }
}

// MARK: Add Child&Remove Child

extension TravellerProtocol {
    func addChild(type: Destinations) {
        Traveller.route.addChild(childController: .type(val: type.rawValue), modelTransistionStyle: .crossDissolve).perform()
    }

    func removeChild() {
        Traveller.route.removeChild.perform()
    }
}

// MARK: Perform Segue&Unwind

extension TravellerProtocol {
    func performSegue(story: Stories, type: Destinations) {
        let story = UIStoryboard(name: story.rawValue, bundle: nil)
        Traveller.route.performSegue(
            segue: .type(val: type.rawValue),
            stroyPorotocol: story,
            modelTransistion: .crossDissolve,
            animated: true,
            hidesTopBar: false,
            hidesBottomBar: false
        ).perform()
    }

    func unWind(story: Stories, type: Destinations) {
        let story = UIStoryboard(name: story.rawValue, bundle: nil)
        Traveller.route.unwind(
            destination: .type(val: type.rawValue),
            modelTransistionStyle: .crossDissolve,
            storyBoardSegue: story as! TravellerStoryBoardSegueProtocol
        ).perform()
    }
}
