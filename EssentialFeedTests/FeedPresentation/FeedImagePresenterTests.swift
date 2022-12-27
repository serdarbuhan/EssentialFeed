//
//  FeedImagePresenterTests.swift
//  EssentialFeedTests
//
//  Created by Serdar Buhan on 23/12/2022.
//

import XCTest
import EssentialFeed

class FeedImagePresenterTests: XCTestCase {

    func test_map_createsViewModel() {
        let image = uniqueImage()

        let viewModel = FeedImagePresenter.map(image)

        XCTAssertEqual(viewModel.description, image.description)
        XCTAssertEqual(viewModel.location, image.location)
    }
}
