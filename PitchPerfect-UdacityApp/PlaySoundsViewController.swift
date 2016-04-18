//
//  PlaySoundsViewController.swift
//  PitchPerfect-UdacityApp
//
//  Created by Kenan Ozdamar on 4/17/16.
//  Copyright © 2016 Kenan Ozdamar. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    //outlets to buttons.
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    //path to the recorded file.
    var recordedAudioURL: NSURL!
    
    //properties needed to play/maniplulate audio.
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: NSTimer!
    
    //the different types of buttons. this enumeration is used to identify which button was pressed in UI.
    enum ButtonType: Int { case Slow = 0, Fast, Chipmunk, Vader, Echo, Reverb }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //set up AVAudio. this function is included in the Audio extension file.
        setupAudio()
    }
    
    override func viewWillAppear(animated: Bool) {
        
        //set the status (enabled/disabled) of the buttons. this function is included in the Audio extension file.
        configureUI(.NotPlaying)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playSoundForButton(sender: UIButton){
        print("play sound button pressed")
        
        //perform audio manipulation on recording based on which button pressed.
        //playsound method is included in the Audio extension file.
        switch (ButtonType(rawValue: sender.tag)!) {
            case .Slow:
                playSound(rate: 0.5)
            case .Fast:
                playSound(rate: 1.5)
            case .Chipmunk:
                playSound(pitch: 1000)
            case .Vader:
                playSound(pitch: -1000)
            case .Echo:
                playSound(echo: true)
            case .Reverb:
                playSound(reverb: true)
        }
        
        //enable/disable ui buttons
        configureUI(.Playing)
    }
    
    @IBAction func stopButtonPressed(){
        print("stop audio button pressed")
        
        //stops audio.included in the Audio extension file.
        stopAudio()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
