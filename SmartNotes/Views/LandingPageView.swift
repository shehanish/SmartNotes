//
//  ContentView.swift
//  SmartNotes
//
//  Created by Shehani Hansika on 05.03.26.
//

import SwiftUI

struct LandingPageView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                // Light blue background
                Color(red: 0.92, green: 0.95, blue: 0.98)
                    .ignoresSafeArea()

                VStack(spacing: 24) {
                    Spacer()

                    // App icon - clean and minimal
                    ZStack {
                        Circle()
                            .fill(Color(red: 0.2, green: 0.4, blue: 0.7).opacity(0.1))
                            .frame(width: 110, height: 110)
                        Image(systemName: "headphones.circle.fill")
                            .font(.system(size: 60))
                            .foregroundStyle(Color(red: 0.2, green: 0.4, blue: 0.7))
                    }

                    // Title and badge
                    VStack(spacing: 8) {
                        Text("SmartNotes")
                            .font(.system(size: 36, weight: .semibold))
                            .tracking(0.3)
                            .foregroundStyle(Color(red: 0.1, green: 0.1, blue: 0.15))

                        Text("Podcast summaries made simple")
                            .font(.subheadline)
                            .fontWeight(.regular)
                            .foregroundStyle(Color.gray)
                            .padding(.horizontal, 14)
                            .padding(.vertical, 6)
                            .background(Color.white)
                            .clipShape(Capsule())
                    }

                    // Tagline
                    Text("Listen, summarize, and save notes\nfrom your favorite podcasts.")
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(Color(red: 0.3, green: 0.3, blue: 0.35))
                        .padding(.horizontal, 32)

                    Spacer()

                    // Feature bullets
                    VStack(spacing: 16) {
                        FeatureBullet(icon: "waveform",   text: "Stream any podcast")
                        FeatureBullet(icon: "doc.text.fill",   text: "Instant summaries")
                        FeatureBullet(icon: "bookmark.fill",  text: "Save important notes")
                    }
                    .padding(.horizontal, 40)

                    Spacer()

                    // Get Started → navigates to HomeView
                    NavigationLink(destination: HomeView()) {
                        Text("Get Started")
                            .font(.headline)
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 14)
                            .background(Color(red: 0.2, green: 0.4, blue: 0.7))
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .padding(.horizontal, 32)
                    }

                    Text("Free to use · No account needed")
                        .font(.caption)
                        .foregroundStyle(Color(red: 0.5, green: 0.5, blue: 0.55))
                        .padding(.bottom, 32)
                }
            }
            .navigationBarHidden(true)
        }
    }
}

// Reusable feature bullet row
private struct FeatureBullet: View {
    let icon: String
    let text: String

    var body: some View {
        HStack(spacing: 14) {
            Image(systemName: icon)
                .font(.system(size: 16, weight: .regular))
                .foregroundStyle(Color(red: 0.2, green: 0.4, blue: 0.7))
                .frame(width: 32, height: 32)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))

            Text(text)
                .font(.body)
                .foregroundStyle(Color(red: 0.3, green: 0.3, blue: 0.35))

            Spacer()
        }
    }
}

#Preview {
    LandingPageView()
}
