//
//  ImageCommentsPresenter.swift
//  EssentialFeed
//
//  Created by Serdar Buhan on 27/12/2022.
//

import Foundation

public final class ImageCommentsPresenter {
    public static var title: String {
        return NSLocalizedString("IMAGE_COMMENTS_VIEW_TITLE",
                                 tableName: "ImageComments",
                                 bundle: Bundle(for: Self.self),
                                 comment: "Title for the image comments view")
    }
}
