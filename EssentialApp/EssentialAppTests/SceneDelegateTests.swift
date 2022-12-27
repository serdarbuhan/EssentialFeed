//
//  SceneDelegateTests.swift
//  EssentialAppTests
//
//  Created by Serdar Buhan on 24/12/2022.
//

import XCTest
import EssentialFeediOS
@testable import EssentialApp

class SceneDelegateTests: XCTestCase {

    // Detailed explanation is in this lectures notes:
    // https://academy.essentialdeveloper.com/courses/447455/lectures/17031536
    func test_configureWindow_setsWindowAsKeyAndVisible() {
      let window = UIWindowSpy()
      let sut = SceneDelegate()
      sut.window = window
      sut.configureWindow()
      XCTAssertEqual(window.makeKeyAndVisibleCallCount, 1, "Expected to make window key and visible")
    }

    func test_configureWindow_configuresRootViewController() {
        let sut = SceneDelegate()
        sut.window = UIWindow()

        sut.configureWindow()

        let root = sut.window?.rootViewController
        let rootNavigation = root as? UINavigationController
        let topController = rootNavigation?.topViewController

        XCTAssertNotNil(rootNavigation, "Expected a navigation controller as root, got \(String(describing: root)) instead")
        XCTAssertTrue(topController is ListViewController, "Expected a feed controller as top view controller, got \(String(describing: topController)) instead")
    }

    private class UIWindowSpy: UIWindow {
        var makeKeyAndVisibleCallCount = 0
        override func makeKeyAndVisible() {
            makeKeyAndVisibleCallCount = 1
        }
    }
}
