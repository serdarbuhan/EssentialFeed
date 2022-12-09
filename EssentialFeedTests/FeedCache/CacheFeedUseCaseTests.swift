//
//  CacheFeedUseCaseTests.swift
//  EssentialFeedTests
//
//  Created by Serdar Buhan on 09/12/2022.
//

import XCTest

class LocalFeedLoader {
    init(store: FeedStore) {

    }
}

class FeedStore {
    var deleteCachedFeedCallCount = 0
}

class CacheFeedUseCaseTests: XCTestCase {

    func test_init_doesNotDeleteCacheUponCreation() {
        let store = FeedStore()
        _ = LocalFeedLoader(store: store) // test driving the interfaces use case need. Store can be anything
        XCTAssertEqual(store.deleteCachedFeedCallCount, 0)
    }
}
