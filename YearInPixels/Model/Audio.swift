//
//  Audio.swift
//  YearInPixels
//
//  Created by Charity Hsu on 9/6/20.
//  Copyright © 2020 Charity Hsu. All rights reserved.
//

import AVFoundation

var player: AVAudioPlayer?

func playSound() {
    let urlString = Bundle.main.path(forResource: "button_tap", ofType: "mp3")
    
    do {
        try AVAudioSession.sharedInstance().setMode(.default)
        try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
        
        guard let urlString = urlString else {
            return
        }
        
        player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
        
        guard let player = player else {
            return
        }
        player.play()
        
    } catch {
        print("something went wrong")
    }
}
