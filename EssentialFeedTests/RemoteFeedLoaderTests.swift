//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Serdar Buhan on 02/12/2022.
//

import XCTest

class RemoteFeedLoader {
    func load() {
        HTTPClient.shared.get(from: URL(string: "http://a-url.com")!)
    }
}

class HTTPClient {
    static var shared = HTTPClient() // Global state. allows this to be changed in tests

    func get(from url: URL) {}
}

class HTTPClientSpy: HTTPClient {
    var requestedURL: URL?

    override func get(from url: URL) {   // Move the test logic from the RemoteFeedLoader to HTTPClientSpy
        requestedURL = url
    }
}

final class RemoteFeedLoaderTests: XCTestCase {

    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClientSpy()
        HTTPClient.shared = client
        _ = RemoteFeedLoader()

        XCTAssertNil(client.requestedURL)
    }

    /*
     RemoteFeedLoadeer needs to use HTTPClient to invoke the network request

        Doing it with a global state now. Not a singleton anymore
     */

    func test_load_requestDataFromURL() {
        // Arrange
        let client = HTTPClientSpy()
        HTTPClient.shared = client
        let sut = RemoteFeedLoader()

        // Act
        sut.load()

        // Assert
        XCTAssertNotNil(client.requestedURL)
    }
}
