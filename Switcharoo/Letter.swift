//
//  Letter.swift
//  Switcharoo
//
//  Created by Laurent B on 27/10/2019.
//  Copyright © 2019 Laurent B. All rights reserved.
//

import SwiftUI

struct Letter: View {
    @State var dragAmount = CGSize.zero
    var text: String
    
    var body: some View {
    Image(text)
        .frame(width: 90, height: 130)
        .offset(dragAmount)
        .gesture(
            DragGesture(coordinateSpace: .global)
                .onChanged {
                    self.dragAmount = CGSize(width: $0.translation.width, height: -$0.translation.height)
            }
            .onEnded { _ in
                self.dragAmount = .zero
             }
        )
    }
    
}

struct Letter_Previews: PreviewProvider {
    static var previews: some View {
        Letter(text: "A")
    }
}
