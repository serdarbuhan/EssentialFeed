//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Serdar Buhan on 02/12/2022.
//

import XCTest

class RemoteFeedLoader {
    let client: HTTPClient

    init(client: HTTPClient) { // RemoteFeedLoader does not locate the client anymore. Initializer/constructor injection
        self.client = client
    }

    func load() {
        client.get(from: URL(string: "http://a-url.com")!) // No need to locate the client. It's passed in the initializer
    }
}

// Shared instance is not needed anymore.
// And there is no implementation of the load function. looks like an abstract class

// class HTTPClient { // no need the shared instance anymore
//    func get(from url: URL) {}
//}

protocol HTTPClient {
    func get(from url: URL)
}

class HTTPClientSpy: HTTPClient {
    var requestedURL: URL?

    // No need to override anymore
    func get(from url: URL) {
        requestedURL = url
    }
}

final class RemoteFeedLoaderTests: XCTestCase {

    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClientSpy()
        _ = RemoteFeedLoader(client: client)

        XCTAssertNil(client.requestedURL)
    }

    func test_load_requestDataFromURL() {
        // Arrange
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(client: client)

        // Act
        sut.load()

        // Assert
        XCTAssertNotNil(client.requestedURL)
    }
}
