//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Narcis  Mihai on 01/02/2016.
//  Copyright © 2016 Narcis  Mihai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recordingButton: UIButton!
    
    @IBOutlet weak var recordingLabel: UILabel!
    
    @IBOutlet weak var stopButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        recordingLabel.hidden = true;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startRecording(sender: AnyObject) {
        recordingLabel.hidden = false;
        recordingButton.enabled = false;
    }
    
    
    @IBAction func stopRecording(sender: AnyObject) {
        recordingButton.enabled = true;
        recordingLabel.hidden = true;
    }

}

