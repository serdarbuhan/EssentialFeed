//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Serdar Buhan on 02/12/2022.
//

import XCTest

class RemoteFeedLoader {
    let url: URL    // user of RemoteFeedLoader needs to know this url. Not the remote feed loader. It should be able to load from any url.
    let client: HTTPClient

    init(url: URL, client: HTTPClient) { // generic. production code is clean
        self.url = url
        self.client = client
    }

    func load() {
        client.get(from: url)
    }
}

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
        let url = URL(string: "http://a-url.com")!
        let client = HTTPClientSpy()
        _ = RemoteFeedLoader(url: url, client: client)

        XCTAssertNil(client.requestedURL)
    }

    func test_load_requestDataFromURL() {
        let url = URL(string: "https://a-given-url.com")! // test case urls and logic is completely on the test side
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(url: url, client: client)

        sut.load()

        XCTAssertEqual(client.requestedURL, url)
    }
}
