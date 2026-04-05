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
            // Light blue background
            Color(red: 0.92, green: 0.95, blue: 0.98)
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 28) {

                    // ── GREETING ROW ──────────────────────────────
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Good Evening")
                                .font(.subheadline)
                                .foregroundStyle(Color.gray)
                            Text("SmartNotes")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundStyle(Color(red: 0.1, green: 0.1, blue: 0.15))
                        }
                        Spacer()
                        // Profile avatar circle
                        Circle()
                            .fill(Color.white)
                            .frame(width: 44, height: 44)
                            .overlay(
                                Image(systemName: "person.fill")
                                    .foregroundStyle(Color(red: 0.2, green: 0.4, blue: 0.7))
                            )
                            .overlay(
                                Circle()
                                    .stroke(Color(red: 0.2, green: 0.4, blue: 0.7).opacity(0.2), lineWidth: 1)
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
                .fontWeight(.semibold)
                .foregroundStyle(Color(red: 0.1, green: 0.1, blue: 0.15))
            Spacer()
            Button("See All") { }
                .font(.subheadline)
                .foregroundStyle(Color(red: 0.2, green: 0.4, blue: 0.7))
        }
        .padding(.horizontal)
    }
}

#Preview {
    HomeView()
}
