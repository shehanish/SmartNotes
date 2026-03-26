//
//  HomeView.swift
//  SmartNotes
//
//  Created by Shehani Hansika on 15.03.26.
//


import SwiftUI

struct HomeView: View {
    let podcasts = Podcast.sampleData

    var body: some View {
        ZStack {
            // Dark background - same style as the design in the image
            Color(red: 0.1, green: 0.1, blue: 0.15)
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 28) {

                    // ── GREETING ROW ──────────────────────────────
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Good Evening 👋")
                                .font(.subheadline)
                                .foregroundStyle(.white.opacity(0.6))
                            Text("SmartNotes")
                                .font(.title)
                                .bold()
                                .foregroundStyle(.white)
                        }
                        Spacer()
                        // Profile avatar circle
                        Circle()
                            .fill(LinearGradient(
                                colors: [.purple, .blue],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing))
                            .frame(width: 44, height: 44)
                            .overlay(
                                Image(systemName: "person.fill")
                                    .foregroundStyle(.white)
                            )
                    }
                    .padding(.horizontal)
                    .padding(.top, 16)

                    // ── CONTINUE LISTENING ────────────────────────
                    SectionHeaderView(title: "Continue Listening")

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 14) {
                            ForEach(podcasts) { podcast in
                                PodcastFeaturedCardView(podcast: podcast)
                            }
                        }
                        .padding(.horizontal)
                    }

                    // ── TRENDING ──────────────────────────────────
                    SectionHeaderView(title: "Trending 🔥")

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 14) {
                            ForEach(podcasts.reversed()) { podcast in
                                PodcastFeaturedCardView(podcast: podcast)
                            }
                        }
                        .padding(.horizontal)
                    }

                    // ── MORE PODCASTS ─────────────────────────────
                    SectionHeaderView(title: "More Podcasts")

                    VStack(spacing: 12) {
                        ForEach(podcasts) { podcast in
                            PodcastCardView(podcast: podcast)
                                .padding(.horizontal)
                        }
                    }
                }
                .padding(.bottom, 40)
            }
        }
        .navigationBarHidden(true)
    }
}

// ── SECTION HEADER ─────────────────────────────────────
// Reusable title + "See All" button used in every section
struct SectionHeaderView: View {
    let title: String

    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
                .bold()
                .foregroundStyle(.white)
            Spacer()
            Button("See All") { }
                .font(.subheadline)
                .foregroundStyle(.purple)
        }
        .padding(.horizontal)
    }
}

#Preview {
    HomeView()
}
