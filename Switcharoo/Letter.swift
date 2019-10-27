//
//  Letter.swift
//  Switcharoo
//
//  Created by Laurent B on 27/10/2019.
//  Copyright © 2019 Laurent B. All rights reserved.
//

import SwiftUI

enum DragState {
    case unknown
    case good
    case bad
}


struct Letter: View {
    @State var dragAmount = CGSize.zero
    @State var dragState = DragState.unknown
    var onChanged: ((CGPoint, String) -> DragState)?
    
    var text: String
    
    var body: some View {
        Image(text)
            .frame(width: 90, height: 130)
            .offset(dragAmount)
            .zIndex(dragAmount == .zero ? 0 : 1)
            .shadow(color: dragColor, radius: dragAmount == .zero ? 0 : 10)
            .shadow(color: dragColor, radius: dragAmount == .zero ? 0 : 10)
            .gesture(
                DragGesture(coordinateSpace: .global)
                    .onChanged {
                        self.dragAmount = CGSize(width: $0.translation.width, height: -$0.translation.height)
                        self.dragState = self.onChanged?($0.location, self.text) ?? .unknown
                }
                .onEnded { _ in
                    self.dragAmount = .zero
                }
        )
    }
    var dragColor: Color {
        switch dragState {
        case .unknown:
            return .black
        case .good:
            return .green
        case .bad:
            return .red
            
        }
    }
    
}

struct Letter_Previews: PreviewProvider {
    static var previews: some View {
        Letter(text: "A")
    }
}
