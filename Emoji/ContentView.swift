//
//  ContentView.swift
//  Emoji
//
//  Created by KimJaeYoun on 2021/11/04.
//

import SwiftUI

struct ContentView: View {
    
    let emojis = [
        Emoji(icon: "🙄", name: "Happy", description: "나는 행복합니다"),
        Emoji(icon: "😯", name: "Stare", description: "행복하지않아요"),
        Emoji(icon: "👿", name: "Heated", description: "널 저주할거야")
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
