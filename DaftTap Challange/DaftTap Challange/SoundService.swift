//
//  SoundService.swift
//  DaftTap Challange
//
//  Created by Aleksander  on 12/05/2019.
//

import Foundation
import AVFoundation

class SoundService {
    
    static var audioPlayer:AVAudioPlayer?
    
    enum SoundObjects {
        
        case pat
        case endGame
        case bestScore
    }
    
    static func playSounds(_ effect:SoundObjects) {
        
        var soundName = ""
        
        switch effect {
            
        case .pat:
            soundName = "patSound"
        case .endGame:
            soundName = "endAlertSound"
        case .bestScore:
            soundName = "highScore"
        }
        
        let bundlePath = Bundle.main.path(forResource: soundName, ofType: "wav")
        
        guard bundlePath != nil else {
            
            print("Couldn't find sound file named \(soundName) in the bundle")
            return
            
        }
        
        let soundUrl = URL(fileURLWithPath: bundlePath!)
        do {
            
            audioPlayer = try AVAudioPlayer(contentsOf: soundUrl)
            
            audioPlayer?.play()
            
        }
        catch {
            
            print("Couldn't create the audio player object for sound file \(soundName)")
            
        }
    }
    
    
    
}
