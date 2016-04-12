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
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func recordAudio(sender: AnyObject) {
        print("record button pressed")
        recordingLabel.text = "Recording in Progress"
    }
    
    @IBAction func stopRecording(sender: AnyObject) {
        print("stop recording button pressed")
    }
    
}

