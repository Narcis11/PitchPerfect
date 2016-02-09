//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Narcis  Mihai on 01/02/2016.
//  Copyright © 2016 Narcis  Mihai. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {

    @IBOutlet weak var fastButton: UIButton!
    @IBOutlet weak var slowButton: UIButton!
    var audioPlayer : AVAudioPlayer!
    var receivedAudio:RecordedAudio!
    var audioEngine:AVAudioEngine!
    var audioTimePitch:AVAudioUnitTimePitch!
    var audioFile:AVAudioFile!
    @IBOutlet weak var stopButton: UIButton!
    
    @IBOutlet weak var chipmunkButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        //receivedAudio = RecordedAudio()
        //print("File path url: " + String(receivedAudio.filePathUrl))
        //let urlPath:NSURL = receivedAudio.da//NSBundle.mainBundle().URLForResource("movie_quote", withExtension: "mp3")!
        do { audioPlayer = try AVAudioPlayer(contentsOfURL: receivedAudio.filePathUrl, fileTypeHint: nil)}
        catch let error as NSError { print(error.description) }
        audioEngine = AVAudioEngine()
        audioFile = try! AVAudioFile(forReading: receivedAudio.filePathUrl)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func playSlowAudio(sender: AnyObject) {
        print("in playSlowAudio")
        audioPlayer.enableRate = true;
        audioPlayer.rate = 0.6;
        audioPlayer.currentTime = 0.0;
        audioPlayer.play()
        
    }
    
    
    @IBAction func playFastAudio(sender: AnyObject) {
        audioPlayer.enableRate = true;
        audioPlayer.rate = 2;
        audioPlayer.currentTime = 0.0;
        audioPlayer.play()
    }
    
    
    @IBAction func stopAudioPlay(sender: AnyObject) {
        if audioPlayer.playing {
            audioPlayer.stop()
        }
    }
    
    
    @IBAction func playChipmunkAudioEffect(sender: UIButton) {
        playAudioWithVariablePitch(1000)
    }
    
    func playAudioWithVariablePitch(pitch: Float) {
        audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
        
        let audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        
        let changePitchEffect = AVAudioUnitTimePitch()
        changePitchEffect.pitch = pitch
        audioEngine.attachNode(changePitchEffect)
        
        audioEngine.connect(audioPlayerNode, to: changePitchEffect, format: nil)
        audioEngine.connect(changePitchEffect, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        try! audioEngine.start()
        
        audioPlayerNode.play()
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
