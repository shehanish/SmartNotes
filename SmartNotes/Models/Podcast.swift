//
//  Podcast.swift
//  SmartNotes
//
//  Created by Shehani Hansika on 10.03.26.
//
//
import Foundation // This is needed for Codable and other basic functionalities

struct Podcast: Identifiable {
    let id: UUID = UUID() // Unique identifier for each podcast
    let title: String
    let author: String
    let description: String
    let imageName: String // Name of the image asset
    let episodeCount: Int
}

extension Podcast {
    static let sampleData: [Podcast] = [
        Podcast(title: "The Daily",
                author: "The New York Times",
                description: "A daily news podcast that provides insights into current events.",
                imageName: "newspaper",
                episodeCount: 1200),
        Podcast(title: "Huberman Lab",
                author: "Andrew Huberman",
                description: "Science and health tools for everyday life.",
                imageName: "brain.head.profile",
                episodeCount: 180),

        Podcast(title: "How I Built This",
                author: "NPR",
                description: "Stories behind successful companies.",
                imageName: "building.2",
                episodeCount: 320),

        Podcast(title: "Lex Fridman Podcast",
                author: "Lex Fridman",
                description: "Conversations about science and humanity.",
                imageName: "mic",
                episodeCount: 410)
            ]
}

    
    


