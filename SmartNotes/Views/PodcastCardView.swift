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
                RoundedRectangle(cornerRadius: 12)
                    .fill(LinearGradient(
                        colors: [.purple, .blue],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing))
                    .frame(width: 70, height: 70)
                Image(systemName: podcast.imageName)
                    .font(.system(size: 28))
                    .foregroundStyle(.white)
                
            }
            // Podcast info
            VStack(alignment: .leading, spacing: 4) {
                Text(podcast.title)
                    .font(.headline)
                    .foregroundStyle(.white)

                Text(podcast.author)
                    .font(.subheadline)
                    .foregroundStyle(.white.opacity(0.6))

                Text("\(podcast.episodeCount) episodes")
                    .font(.caption)
                    .foregroundStyle(.purple)
            }

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(.white.opacity(0.4))
        }
        .padding()
        .background(Color(red: 0.16, green: 0.16, blue: 0.22))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: .black.opacity(0.3), radius: 8, x: 0, y: 4)
    }
}


// Big square card used in horizontal scroll sections (Featured, Trending)
struct PodcastFeaturedCardView: View {
    let podcast: Podcast

    // Each podcast gets a unique gradient colour pair
    private var gradientColors: [Color] {
        let options: [[Color]] = [
            [.purple, .blue],
            [.orange, .pink],
            [.teal, .green],
            [.indigo, .purple]
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
                .foregroundStyle(.white.opacity(0.35))
                .frame(width: 160, height: 160)

            // Dark gradient overlay so text is readable
            LinearGradient(
                colors: [.clear, .black.opacity(0.75)],
                startPoint: .center,
                endPoint: .bottom)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .frame(width: 160, height: 160)

            // Title + author at the bottom
            VStack(alignment: .leading, spacing: 2) {
                Text(podcast.title)
                    .font(.subheadline)
                    .bold()
                    .foregroundStyle(.white)
                    .lineLimit(1)

                Text(podcast.author)
                    .font(.caption2)
                    .foregroundStyle(.white.opacity(0.75))
                    .lineLimit(1)
            }
            .padding(10)
        }
        .frame(width: 160, height: 160)
    }
}

#Preview {
    ZStack {
        Color(red: 0.1, green: 0.1, blue: 0.15).ignoresSafeArea()

        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Featured Cards")
                    .foregroundStyle(.white).bold().padding(.horizontal)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 14) {
                        ForEach(Podcast.sampleData) { podcast in
                            PodcastFeaturedCardView(podcast: podcast)
                        }
                    }
                    .padding(.horizontal)
                }

                Text("List Cards")
                    .foregroundStyle(.white).bold().padding(.horizontal)

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

