//
//  TopicComposeViewController.swift
//  TestSwiftUI
//
//  Created by Zheng Li on 2019/6/10.
//  Copyright © 2019 ainopara. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

final class TopicComposeViewController: UIViewController {

    let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        label.text = "Hi"
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.leftAnchor.constraint(equalTo: view.leftAnchor),
            label.rightAnchor.constraint(equalTo: view.rightAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
//        label.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        view.setNeedsLayout()
        view.layoutIfNeeded()
    }

}

extension TopicComposeViewController: UIViewControllerRepresentable {

    func makeUIViewController(context: UIViewControllerRepresentableContext<TopicComposeViewController>) -> TopicComposeViewController {
        return TopicComposeViewController()
    }

    func updateUIViewController(_ uiViewController: TopicComposeViewController, context: UIViewControllerRepresentableContext<TopicComposeViewController>) {
    }
}
