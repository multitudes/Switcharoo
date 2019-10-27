//
//  ContentView.swift
//  Switcharoo
//
//  Created by Laurent B on 27/10/2019.
//  Copyright © 2019 Laurent B. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    
    @State var activeLetters = [String](repeating: "Blank", count: 4)
    @State var tray = [String](repeating: "Blank", count: 10)
    
    let allowedWords = Bundle.main.words(from: "words.txt")
    let startWords = Bundle.main.words(from: "start.txt")
    
    var body: some View {
        VStack(spacing: 20) {
            Image("Switcharoo")
            .padding()
            
        Spacer()
            HStack {
                ForEach(0..<4) { number in
                    Letter(text:  self.activeLetters[number])
                    
                }
            }
            Spacer()
            
            HStack {
                ForEach(0..<10) { number in
                    Letter(text: self.tray[number])
                    
                }
            }
        }
        .frame(width: 1024, height: 768)
    .background(Image("Background"))
    .onAppear(perform: startGame)
    }
    
    func startGame() {
        let newWords = startWords.randomElement() ?? "CAPE"
        activeLetters = newWords.map(String.init)
        tray = (1...10).map { _ in self.randomLetter() }
    }
    
    func randomLetter() -> String {
        String("AAAAABBCCDDDDEEEEEEEFGGGHIIIJKLLLLMMMMNNNNOOOOPPPQRRRRSSSSTTTTTUUUUVWWXYZ".randomElement() ?? "E")
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
