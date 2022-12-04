//
//  URLSessionHTTPClientTests.swift
//  EssentialFeedTests
//
//  Created by Serdar Buhan on 04/12/2022.
//

import XCTest

class URLSessionHTTPClient {
    private let session: URLSession

    init(session: URLSession) {
        self.session = session
    }

    func get(from url: URL) {
        session.dataTask(with: url) { _, _, _ in }
    }
}

class URLSessionHTTPClientTests: XCTestCase {

    func test_getFromURL_createsDataTaskWithURL() {
        let url = URL(string: "http://any-url.com")!
        let session = URLSessionSpy()
        let sut = URLSessionHTTPClient(session: session)
        sut.get(from: url)
        XCTAssertEqual(session.receivedURLs, [url])
    }

    // MARK: - Helpers

    // Subclassing the class we don't own. We don't know their implementation. It can change in the future
    // Mocking classes you don't own can create problems
    // there are other methods in URLSession that you don't override
    private class URLSessionSpy: URLSession {
        var receivedURLs = [URL]()

        override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
            receivedURLs.append(url)
            return FakeURLSessionDataTask()
        }

    }

    private class FakeURLSessionDataTask: URLSessionDataTask {

    }
}
