//
//  ContentView.swift
//  Emoji
//
//  Created by KimJaeYoun on 2021/11/04.
//

import SwiftUI

struct ContentView: View {
    
    let emojis = [
        Emoji(icon: "π", name: "Happy", description: "λλ νλ³΅ν©λλ€"),
        Emoji(icon: "π―", name: "Stare", description: "νλ³΅νμ§μμμ"),
        Emoji(icon: "πΏ", name: "Heated", description: "λ μ μ£Όν κ±°μΌ")
    ]
    
    var body: some View {
        VStack(spacing: 30) {
            ForEach(emojis) { emoji in
                EmojiView(emoji: emoji)
                    .onTapGesture {
                        save(emoji)
                    }
            }
        }
    }
    
    func save(_ emoji: Emoji) {
        print("save \(emoji)")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
