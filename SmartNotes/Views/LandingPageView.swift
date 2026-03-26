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
                // Background gradient
                LinearGradient(
                    colors: [Color(red: 0.1, green: 0.1, blue: 0.35), .purple],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing)
                    .ignoresSafeArea()

                VStack(spacing: 24) {
                    Spacer()

                    // App icon
                    ZStack {
                        Circle()
                            .fill(.white.opacity(0.15))
                            .frame(width: 110, height: 110)
                        Image(systemName: "headphones")
                            .font(.system(size: 52, weight: .medium))
                            .foregroundStyle(.white)
                    }

                    // Title and badge
                    VStack(spacing: 8) {
                        Text("SmartNotes")
                            .font(.system(size: 38, weight: .bold))
                            .foregroundStyle(.white)

                        Text("Podcast · AI Summaries")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .padding(.horizontal, 14)
                            .padding(.vertical, 6)
                            .background(.white.opacity(0.2))
                            .clipShape(Capsule())
                    }

                    // Tagline
                    Text("Listen to any podcast and get\nAI-powered highlights & notes.")
                        .font(.title3)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.white.opacity(0.85))
                        .padding(.horizontal, 32)

                    Spacer()

                    // Feature bullets
                    VStack(spacing: 16) {
                        FeatureBullet(icon: "waveform",   text: "Stream podcasts instantly")
                        FeatureBullet(icon: "sparkles",   text: "AI-generated episode summaries")
                        FeatureBullet(icon: "note.text",  text: "Save highlights as smart notes")
                    }
                    .padding(.horizontal, 40)

                    Spacer()

                    // Get Started → navigates to HomeView
                    NavigationLink(destination: HomeView()) {
                        Text("Get Started")
                            .font(.headline)
                            .foregroundStyle(Color(red: 0.1, green: 0.1, blue: 0.35))
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 16)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .padding(.horizontal, 32)
                    }

                    Text("Free to use · No account needed")
                        .font(.footnote)
                        .foregroundStyle(.white.opacity(0.55))
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
                .font(.system(size: 18, weight: .semibold))
                .foregroundStyle(.white)
                .frame(width: 36, height: 36)
                .background(.white.opacity(0.15))
                .clipShape(RoundedRectangle(cornerRadius: 10))

            Text(text)
                .font(.subheadline)
                .foregroundStyle(.white.opacity(0.9))

            Spacer()
        }
    }
}

#Preview {
    LandingPageView()
}
