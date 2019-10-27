//
//  Shuffletray.swift
//  Switcharoo
//
//  Created by Laurent B on 27/10/2019.
//  Copyright © 2019 Laurent B. All rights reserved.
//

import SwiftUI

struct Shuffletray: View {
    
    var action: (() -> Void)?
    
    var body: some View {
        HStack {
            Spacer()
            
            Button(action: {
                self.action?()
            }) {
                Text("Shuffle tray")
                    .font(.headline)
                .padding()
            }
            .buttonStyle(BorderlessButtonStyle())
            .background(Color.red)
            .clipShape(Capsule())
            .foregroundColor(.white)
        }
        .padding([.trailing, .bottom])
    }
}

struct Shuffletray_Previews: PreviewProvider {
    static var previews: some View {
        Shuffletray()
    }
}
