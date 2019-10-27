//
//  ResetButton.swift
//  Switcharoo
//
//  Created by Laurent B on 27/10/2019.
//  Copyright © 2019 Laurent B. All rights reserved.
//

import SwiftUI

struct ResetButton: View {
    
    var action: (() -> Void)?
    var body: some View {
        Group {
            Button(action: {
                self.action?()
            }) {
                Text("Reset Letters")
                    .font(.title)
                    .padding()
            }
            .buttonStyle(BorderlessButtonStyle())
            .background(Color.green)
        .clipShape(Capsule())
            .foregroundColor(.white)
            
            Text("(10 Points Penalty)")
                .font(.headline)
                .foregroundColor(.white)
                .shadow(color: .red, radius: 5)
                .shadow(color: .red, radius: 5)
            
        }
    }
}

struct ResetButton_Previews: PreviewProvider {
    static var previews: some View {
        ResetButton()
    }
}
