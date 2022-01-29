//
//  ImageTextView.swift
//  TestPreviewIssue2
//
//  Created by Zheng Li on 2022/1/29.
//

import UIKit

public final class ImageTextView: UIView {

    public let stackView = UIView()
    public let imageView = UIImageView()
    public let textLabel = UILabel()

    public override init(frame: CGRect) {
        super.init(frame: frame)
    }

    public convenience init(image: UIImage?, text: String) {
        self.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
