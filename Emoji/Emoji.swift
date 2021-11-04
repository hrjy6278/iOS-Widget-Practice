//
//  Emoji.swift
//  Emoji
//
//  Created by KimJaeYoun on 2021/11/04.
//

import Foundation

struct Emoji: Identifiable, Decodable {
    var id: String { icon }
    let icon: String
    let name: String
    let description: String
}
