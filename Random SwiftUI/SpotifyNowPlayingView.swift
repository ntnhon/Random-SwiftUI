//
//  SpotifyNowPlayingView.swift
//  Random SwiftUI
//
//  Created by Thanh-Nhon Nguyen on 10/05/2021.
//

import SwiftUI

fileprivate extension Color {
    static var spotify: Color {
        Color(red: 30/255, green: 215/255, blue: 96/255)
    }
}

fileprivate struct TileView: View {
    var delayedSeconds: Double = 0.0
    @State private var currentStep = 0
    @State private var height: CGFloat = 0
    var body: some View {
        GeometryReader { geometry in
            Rectangle()
                .fill(Color.spotify)
                .frame(width: geometry.size.width, height: height)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + delayedSeconds) { Timer.scheduledTimer(withTimeInterval: 0.25, repeats: true) { _ in
                            withAnimation {
                                let fullHeight = geometry.size.height
                                switch currentStep {
                                case 0: height = fullHeight / 2
                                case 1: height += fullHeight / 8
                                case 2: height = fullHeight
                                default: height = fullHeight / 8
                                }
                                if currentStep <= 3 {
                                    currentStep += 1
                                } else {
                                    currentStep = 0
                                }
                            }
                        }
                    }
                }
        }
    }
}

struct SpotifyNowPlayingView: View {
    var body: some View {
        GeometryReader { geometry in
            let spacing = geometry.size.width / 40
            let tileWidth = (geometry.size.width - spacing * 3) / 4
            let tileHeight = geometry.size.height
            HStack(spacing: spacing) {
                ForEach([0.0, 0.3, 0.1, 0.2], id: \.self) {
                    TileView(delayedSeconds: $0)
                        .frame(width: tileWidth, height: tileHeight)
                        .rotationEffect(.init(radians: .pi))
                }
            }
        }
    }
}

struct SpotifyNowPlayingView_Previews: PreviewProvider {
    static var previews: some View {
        SpotifyNowPlayingView()
            .frame(width: 40, height: 40, alignment: .center)
    }
}
