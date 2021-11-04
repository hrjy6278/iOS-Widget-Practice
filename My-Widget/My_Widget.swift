//
//  My_Widget.swift
//  My-Widget
//
//  Created by KimJaeYoun on 2021/11/04.
//

import WidgetKit
import SwiftUI
import Emoji

struct EmojiEntry: TimelineEntry {
    let date: Date
    let emoji: Emoji
}

struct Provider: TimelineProvider {
    
    func placeholder(in context: Context) -> EmojiEntry {
        EmojiEntry(date: Date(), emoji: Emoji(icon: "🥱",
                                              name: "졸려요",
                                              description: "너무너무 졸려요"))
    }
    
    func getSnapshot(in context: Context, completion: @escaping (EmojiEntry) -> Void) {
        let entry = EmojiEntry(date: Date(), emoji: Emoji(icon: "🥱",
                                                          name: "졸려요",
                                                          description: "너무너무 졸려요"))
        
        completion(entry)
        
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<EmojiEntry>) -> Void) {
        let entry = EmojiEntry(date: Date(), emoji: Emoji(icon: "🥱",
                                                          name: "졸려요",
                                                          description: "너무너무 졸려요"))
        let timeline = Timeline(entries: [entry], policy: .atEnd)
        
        completion(timeline)
    }
}


struct WidgetEntryView: View {
    let entry: Provider.Entry
    var body: some View {
        EmojiView(emoji: entry.emoji)
    }
}

@main
struct MyWiget: Widget {
    private let kind = "My_Wiget"
    
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind,
                            provider: Provider()) { entry in
            WidgetEntryView(entry: entry)
        }
    }
}
