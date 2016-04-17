//
//  RecordSoundViewController.swift
//  PitchPerfect-UdacityApp
//
//  Created by Kenan Ozdamar on 4/11/16.
//  Copyright © 2016 Kenan Ozdamar. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundViewController: UIViewController, AVAudioRecorderDelegate {

    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecordingButton: UIButton!
    
    //class which handles audio functionality like recording.
    //the ! means this is an implcitly unwrapped optional.
    var audioRecorder:AVAudioRecorder!
    
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
        
        //get the apps document directory to build the directory path to store the recorded file. store it in a String.
        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory,.UserDomainMask, true)[0] as String
        
        //filename for recording.
        let recordingName = "recordedVoice.wav"
        
        //create an array with the path and filename.
        let pathArray = [dirPath, recordingName]
        
        //create a NSURL path and print it.
        let filePath = NSURL.fileURLWithPathComponents(pathArray)
        print(filePath)
        
        //get an instance of AVAudioSession
        //sharedInstance() is a common design pattern is ios for accessing a singelton
        //AVAudioSession is an abstraction over the audio hardware. since there is only one
        //audio hardware for the device there is only once instance of AVAudioSession
        let session = AVAudioSession.sharedInstance()
        
        //set up the audio session.  no error handeling if it fails.
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        
        //set up the recorder. again no error handeling.
        try! audioRecorder = AVAudioRecorder(URL: filePath!, settings: [:])
        
        //set AVAudioRecorder delegate to this class.
        audioRecorder.delegate = self
        
        //?
        audioRecorder.meteringEnabled = true
        
        //record
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
    
    @IBAction func stopRecording(sender: AnyObject) {
        print("stop recording button pressed")
        
        //change status label
        recordingLabel.text = "Tap to Record"
        
        //enable/disable buttons
        stopRecordingButton.enabled = false
        recordButton.enabled = true
        
        //stop audio recording
        audioRecorder.stop()
        
        //get an instance of AVAudioSession
        let audioSession = AVAudioSession.sharedInstance()
        
        //close audiosession
        try! audioSession.setActive(false)
    }
    
    func audioRecorderDidFinishRecording(recorder: AVAudioRecorder, successfully flag: Bool) {
        
        //
        print("AVAudioRecorder has finshed recording.")
        
        if(flag){
            self.performSegueWithIdentifier("stopRecording", sender: audioRecorder.url)
        }else {
            print("Recording save failed.");
        }
        
    }
    
}

