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
    @State var buttonFrames = [CGRect](repeating: .zero, count: 4)
    
    
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
                        .allowsHitTesting(false)
                        .overlay(
                            GeometryReader { geo in
                                Color.clear
                                    .onAppear {
                                        
                                        self.buttonFrames[number] = geo.frame(in: .global)
                                }
                        })
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
    func letterMoved(location: CGPoint, letter: String) -> DragState {
        if let match = buttonFrames.firstIndex(where: {
            $0.contains(location)
        }) {
            if activeLetters[match] == letter { return .bad }
            var testLetters = activeLetters
            testLetters[match] = letter
            
            let testWord = String(testLetters.joined())
            if allowedWords.contains(testWord) {
                return .good
            } else {
                return .bad
            }
        }
        else {
            return .unknown
        }
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
