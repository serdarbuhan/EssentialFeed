//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Serdar Buhan on 02/12/2022.
//

import XCTest

class RemoteFeedLoader {
    func load() {
        HTTPClient.shared.requestedURL = URL(string: "http://a-url.com")
    }
}

class HTTPClient {
    static let shared = HTTPClient()
    private init() { }

    var requestedURL: URL?
}

final class RemoteFeedLoaderTests: XCTestCase {

    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClient.shared
        _ = RemoteFeedLoader()

        XCTAssertNil(client.requestedURL)
    }

    /*
     RemoteFeedLoadeer needs to use HTTPClient to invoke the network request

        RemoteFeedLoader(client: HTTPClient())  initializer/constructor injection

        let remoteFeedLoader = RemoteFeedLoader()
        remoteFeedLoader.client = HTTPClient()  // property injection

        remoteFeedLoader.load(client) // method injection

        We'll go with singleton instead of these for now.
     */

    func test_load_requestDataFromURL() {
        // Arrange
        let client = HTTPClient.shared
        let sut = RemoteFeedLoader()

        // Act
        sut.load()

        // Assert
        XCTAssertNotNil(client.requestedURL)
    }
}
