//
//  TopicComposeView.swift
//  TestSwiftUI
//
//  Created by Zheng Li on 2019/6/10.
//  Copyright © 2019 ainopara. All rights reserved.
//

import SwiftUI

struct TopicComposeView : View {
    var body: some View {
        TopicComposeViewController()
    }
}

#if DEBUG
struct TopicComposeView_Previews : PreviewProvider {
    static var previews: some View {
        TopicComposeView()
    }
}
#endif
