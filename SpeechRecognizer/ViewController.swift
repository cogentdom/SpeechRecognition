//
//  ViewController.swift
//  SpeechRecognizer
//
//  Created by Dominik Huffield on 4/13/21.
//

import UIKit
import InstantSearchVoiceOverlay

class ViewController: UIViewController, VoiceOverlayDelegate {
    
    let voiceOverlay = VoiceOverlayController()

    @IBOutlet var myButton: UIButton!
    @IBOutlet var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myButton.backgroundColor = .systemRed
        myButton.setTitleColor(.white, for: .normal)
        // Do any additional setup after loading the view.
    }

    @IBAction func didTapButton() {
        voiceOverlay.delegate = self
        voiceOverlay.settings.autoStart = false
        voiceOverlay.settings.autoStop = true
        voiceOverlay.settings.autoStopTimeout = 5
        
        voiceOverlay.start(on: self, textHandler: { text, final, _ in
            
            if final {
                print("Final text: \(text)")
                self.myLabel.text = text
            }
            else {
//                print("In progress: \(text)")
            }
            
        }, errorHandler: { error in
            
        })
    }
    
    func recording(text: String?, final: Bool?, error: Error?) {
        
    }
 
}

