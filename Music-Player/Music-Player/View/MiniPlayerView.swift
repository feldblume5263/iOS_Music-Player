//
//  MiniPlayerView.swift
//  Music-Player
//
//  Created by Junhong Park on 2022/01/15.
//

import SwiftUI
import MediaPlayer

class MiniPlayerViewModel: ObservableObject {
    
}

struct MiniPlayerView: View {
    
    @ObservedObject var playerViewModel = MiniPlayerViewModel()
    @Binding var player: MPMusicPlayerController
    @State var refreshView: Bool = false
    @State var playbackState: MPMusicPlaybackState? = MPMusicPlayerController.applicationMusicPlayer.playbackState
    
    var body: some View {
        HStack {
            Button {
                if playbackState == .paused {
                    playSong()
                } else {
                    pauseSong()
                }
            } label: {
                playbackState == .playing ? Image(systemName: "pause.fill") : Image(systemName: "play.fill")
            }
            .font(.title)
            Spacer()
            VStack {
                Text(player.nowPlayingItem?.title ?? undefinedString)
                HStack {
                    Text(player.nowPlayingItem?.artist ?? undefinedString)
                        .lineLimit(1)
                    Text(" ")
                    Text(player.nowPlayingItem?.albumTitle ?? undefinedString)
                        .lineLimit(1)
                }
            }
            Spacer()
            Image(uiImage: UIImage())
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 50, maxHeight: 50)
                .background(Color.gray)
        }
        .frame(height: 50)
        .padding(EdgeInsets(top: 5, leading: 50, bottom: 5, trailing: 50))
        .onAppear {
        }
        .onReceive(NotificationCenter.default.publisher(for: .MPMusicPlayerControllerPlaybackStateDidChange)){ _ in
            playbackState = MPMusicPlayerController.applicationMusicPlayer.playbackState
        }
    }
    
    private func playSong() {
        player.play()
    }
    
    private func pauseSong() {
        player.pause()
    }
}
