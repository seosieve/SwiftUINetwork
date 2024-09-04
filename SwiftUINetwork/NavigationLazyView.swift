//
//  NavigationLazyView.swift
//  SwiftUINetwork
//
//  Created by 서충원 on 9/4/24.
//

import SwiftUI

struct NavigationLazyView<Content: View>: View {
    
    let closure: () -> Content
    
    init(_ closure: @autoclosure @escaping () -> Content) {
        self.closure = closure
    }
    
    var body: some View {
        closure()
    }
}
