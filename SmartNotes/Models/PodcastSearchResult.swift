//
//  PodcastSearchResult.swift
//  SmartNotes
//
//  Created by Shehani Hansika on 16.03.26.
//

import Foundation

struct iTunesSearchResponse: Codable {
    let results: [PodcastSearchResult]
}

struct PodcastSearchResult: Codable, Identifiable {
    
    let id: Int
    let title: String
    let author: String
    let imageUrl: String
    let feedUrl: String
    
    enum CodingKeys: String, CodingKey {
        case id = "trackId"
        case title = "trackName"
        case author = "artistName"
        case imageUrl = "artworkUrl600"
        case feedUrl = "collectionViewUrl"
    }
        
}

