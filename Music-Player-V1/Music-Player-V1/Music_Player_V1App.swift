//
//  Music_Player_V1App.swift
//  Music-Player-V1
//
//  Created by Junhong Park on 2022/01/12.
//

import SwiftUI
import MediaPlayer

@main
struct Music_Player_V1App: App {
    
    
    init() {
        authMediaLibrary()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    private func authMediaLibrary() {
        MPMediaLibrary.requestAuthorization { status in
            if status == .authorized {
                print("Get media permission")
            } else {
                print("Fail to get media permission")
                
            }
            
        }
    }
}
