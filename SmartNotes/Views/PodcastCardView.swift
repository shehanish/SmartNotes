//
//  PodcastCardView.swift
//  SmartNotes
//
//  Created by Shehani Hansika on 10.03.26.
//

import SwiftUI

struct PodcastCardView: View {
    let podcast: Podcast // this card will receives One podcast to display
    
    var body: some View {
        HStack(spacing: 14) {
            
            //artwork box
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                    .frame(width: 70, height: 70)
                Image(systemName: podcast.imageName)
                    .font(.system(size: 28))
                    .foregroundStyle(Color(red: 0.2, green: 0.4, blue: 0.7))
                
            }
            // Podcast info
            VStack(alignment: .leading, spacing: 4) {
                Text(podcast.title)
                    .font(.headline)
                    .foregroundStyle(Color(red: 0.1, green: 0.1, blue: 0.15))

                Text(podcast.author)
                    .font(.subheadline)
                    .foregroundStyle(Color.gray)

                Text("\(podcast.episodeCount) episodes")
                    .font(.caption)
                    .foregroundStyle(Color(red: 0.2, green: 0.4, blue: 0.7))
            }

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray.opacity(0.5))
        }
        .padding()
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 14))
        .shadow(color: Color.black.opacity(0.08), radius: 6, x: 0, y: 2)
    }
}


// Big square card used in horizontal scroll sections (Featured, Trending)
struct PodcastFeaturedCardView: View {
    let podcast: Podcast

    // Each podcast gets a unique gradient colour pair
    private var gradientColors: [Color] {
        let options: [[Color]] = [
            [Color(red: 0.95, green: 0.95, blue: 0.97), Color.white],
            [Color(red: 0.9, green: 0.93, blue: 0.98), Color.white],
            [Color(red: 0.92, green: 0.95, blue: 0.95), Color.white],
            [Color(red: 0.97, green: 0.95, blue: 0.9), Color.white]
        ]
        let index = abs(podcast.title.hashValue) % options.count
        return options[index]
    }

    var body: some View {
        ZStack(alignment: .bottomLeading) {

            // Artwork gradient background
            RoundedRectangle(cornerRadius: 16)
                .fill(LinearGradient(
                    colors: gradientColors,
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing))
                .frame(width: 160, height: 160)

            // Centre icon
            Image(systemName: podcast.imageName)
                .font(.system(size: 44))
                .foregroundStyle(Color(red: 0.2, green: 0.4, blue: 0.7).opacity(0.25))
                .frame(width: 160, height: 160)

            // Subtle overlay
            LinearGradient(
                colors: [.clear, Color.black.opacity(0.05)],
                startPoint: .center,
                endPoint: .bottom)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .frame(width: 160, height: 160)

            // Title + author at the bottom
            VStack(alignment: .leading, spacing: 2) {
                Text(podcast.title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color(red: 0.1, green: 0.1, blue: 0.15))
                    .lineLimit(1)

                Text(podcast.author)
                    .font(.caption2)
                    .foregroundStyle(Color.gray)
                    .lineLimit(1)
            }
            .padding(10)
        }
        .frame(width: 160, height: 160)
        .shadow(color: Color.black.opacity(0.06), radius: 6, x: 0, y: 2)
    }
}

#Preview {
    ZStack {
        Color(red: 0.92, green: 0.95, blue: 0.98).ignoresSafeArea()

        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Featured Cards")
                    .foregroundStyle(Color(red: 0.1, green: 0.1, blue: 0.15)).bold().padding(.horizontal)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 14) {
                        ForEach(Podcast.sampleData) { podcast in
                            PodcastFeaturedCardView(podcast: podcast)
                        }
                    }
                    .padding(.horizontal)
                }

                Text("List Cards")
                    .foregroundStyle(Color(red: 0.1, green: 0.1, blue: 0.15)).bold().padding(.horizontal)

                VStack(spacing: 12) {
                    ForEach(Podcast.sampleData) { podcast in
                        PodcastCardView(podcast: podcast)
                            .padding(.horizontal)
                    }
                }
            }
            .padding(.top)
        }
    }
}
