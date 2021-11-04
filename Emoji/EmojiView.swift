//
//  EmojiView.swift
//  Emoji
//
//  Created by KimJaeYoun on 2021/11/04.
//

import SwiftUI

struct EmojiView: View {
    
    let emoji: Emoji
    var body: some View {
        Text(emoji.icon)
            .font(.largeTitle)
            .padding()
            .background(Color.blue)
            .clipShape(Circle())
    }
}
