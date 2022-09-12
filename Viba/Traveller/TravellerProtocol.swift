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
        viewAnimation: UIView.AnimationOptions
    )

    func push(
        type: Destinations,
        animated: Bool,
        hidesTopBar: Bool,
        hidesBottomBar: Bool,
        modelTransistion: UIModalTransitionStyle,
        modelPresentation: UIModalPresentationStyle
    )

    func pop(
        type: Destinations?,
        root: Bool,
        animated: Bool,
        modelTransistion: UIModalTransitionStyle
    )

    func present(
        type: Destinations,
        animated: Bool,
        hidesTopBar: Bool,
        hidesBottomBar: Bool,
        modelTransistion: UIModalTransitionStyle,
        modelPresentation: UIModalPresentationStyle
    )
    func dismiss()

    func addChild(type: Destinations, modelTransistion: UIModalTransitionStyle)
    func removeChild()

    func performSegue(story: Stories, type: Destinations)
    func unWind(story: Stories, type: Destinations)
}

// MARK: Story Switching

extension TravellerProtocol {
    func storySwitch(
        story: Stories,
        destination: Destinations,
        animated: Bool = true,
        hidesTopBar: Bool = false,
        hidesBottomBar: Bool = false,
        viewAnimation: UIView.AnimationOptions = .transitionCrossDissolve
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

    func pop(
        type: Destinations?,
        root: Bool,
        animated: Bool = true,
        modelTransistion: UIModalTransitionStyle = .crossDissolve
    ) {
        guard let destinationType = type else {
            Traveller.route.pop(
                toRootController: root,
                animated: animated,
                modelTransistionStyle: modelTransistion
            ).perform()
            return
        }

        Traveller.route.popToViewController(
            destination: .type(val: destinationType.rawValue),
            animated: animated,
            modelTransistionStyle: modelTransistion
        ).perform()
    }
}

// MARK: Present&Dismiss

extension TravellerProtocol {
    func present(
        type: Destinations,
        animated: Bool = true,
        hidesTopBar: Bool = false,
        hidesBottomBar: Bool = false,
        modelTransistion: UIModalTransitionStyle = .crossDissolve,
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
    func addChild(type: Destinations, modelTransistion: UIModalTransitionStyle = .crossDissolve) {
        Traveller.route.addChild(childController: .type(val: type.rawValue), modelTransistionStyle: modelTransistion).perform()
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
