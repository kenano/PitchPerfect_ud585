//
//  ViewController.swift
//  PitchPerfect-UdacityApp
//
//  Created by Kenan Ozdamar on 4/11/16.
//  Copyright © 2016 Kenan Ozdamar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecordingButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        stopRecordingButton.enabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func recordAudio(sender: AnyObject) {
        print("record button pressed")
        
        //change status label
        recordingLabel.text = "Recording in Progress"
        
        //enable/disable buttons
        stopRecordingButton.enabled = true
        recordButton.enabled = false
    }
    
    @IBAction func stopRecording(sender: AnyObject) {
        print("stop recording button pressed")
        
        //change status label
        recordingLabel.text = "Tap to Record"
        
        //enable/disable buttons
        stopRecordingButton.enabled = false
        recordButton.enabled = true
    }
    
}

