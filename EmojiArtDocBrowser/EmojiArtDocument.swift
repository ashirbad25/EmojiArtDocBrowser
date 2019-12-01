//
//  EmojiArtDocument.swift
//  EmojiArtDocBrowser
//
//  Created by Aashirwad Sinha on 12/1/19.
//  Copyright © 2019 Credit Suisse. All rights reserved.
//

import UIKit

class EmojiArtDocument: UIDocument {
    var emojiArt: EmojiArt? // the model for this Document
    var thumbnail: UIImage?  // thumbnail image for this Document
    
    // Convert the model into a JSON Data
    override func contents(forType typeName: String) throws -> Any {
        return emojiArt?.json ?? Data()
    }
    
    // Convert JSON Data into the Model
    override func load(fromContents contents: Any, ofType typeName: String?) throws {
        if let json = contents as? Data {
            emojiArt = EmojiArt(json: json)
        }
    }
    
    // overridden to add a key-value pair
    // to the dictionary of "file attributes" on the file UIDocument writes
    // the added key-value pair sets a thumbnail UIImage for the UIDocument
    override func fileAttributesToWrite(to url: URL, for saveOperation: UIDocumentSaveOperation) throws -> [AnyHashable : Any] {
        var attributes = try super.fileAttributesToWrite(to: url, for: saveOperation)
        if let thumbnail = self.thumbnail {
            attributes[URLResourceKey.thumbnailDictionaryKey] = [URLThumbnailDictionaryItem.NSThumbnail1024x1024SizeKey:thumbnail]
        }
        return attributes
    }
}

