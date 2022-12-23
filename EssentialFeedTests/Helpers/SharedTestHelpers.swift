//
//  SharedTestHelpers.swift
//  EssentialFeedTests
//
//  Created by Serdar Buhan on 12/12/2022.
//

import Foundation

func anyNSError() -> NSError {
    return NSError(domain: "any error", code: 0)
}

func anyURL() -> URL {
    URL(string: "http://any-url.com")!
}

func anyData() -> Data {
    return Data("any data".utf8)
}
