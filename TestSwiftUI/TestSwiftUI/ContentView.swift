//
//  ContentView.swift
//  TestSwiftUI
//
//  Created by Zheng Li on 2019/6/11.
//  Copyright © 2019 ainopara. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, *)
struct ContentView : View {
    var body: some View {
        Text("Hello World")
    }
}

#if DEBUG
@available(iOS 13.0, *)
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
