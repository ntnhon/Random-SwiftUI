//
//  RootView.swift
//  Random SwiftUI
//
//  Created by Thanh-Nhon Nguyen on 10/05/2021.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        Form {
            Section(header: Text("Spotify now playing")) {
                HStack {
                    Spacer()
                    SpotifyNowPlayingView()
                        .frame(width: 40, height: 50, alignment: .center)
                    Spacer()
                }
            }

            Section(header: Text("Apple clock")) {
                HStack {
                    Spacer()
                    AppleClockView()
                        .frame(width: 250, height: 250, alignment: .center)
                    Spacer()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
