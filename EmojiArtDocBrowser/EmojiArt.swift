//
//  EmojiArt.swift
//  EmojiArtDocBrowser
//
//  Created by Aashirwad Sinha on 12/1/19.
//  Copyright © 2019 Credit Suisse. All rights reserved.
//

import Foundation

struct EmojiArt: Codable {
    var url: URL
    var emojis = [EmojiInfo]()
    
    struct EmojiInfo: Codable {
        let x: Int
        let y: Int
        let text: String
        let size: Int
    }
    
    // take some JSON and try to init an EmojiArt from it
    init?(json: Data) {
        if let newValue = try? JSONDecoder().decode(EmojiArt.self, from: json) {
            self = newValue
        } else {
            return nil
        }
    }
    
    // return this EmojiArt as a JSON data
    var json: Data? {
        return try? JSONEncoder().encode(self)
    }
    
    init(url: URL, emojis: [EmojiInfo]) {
        self.url = url
        self.emojis = emojis
    }
}
