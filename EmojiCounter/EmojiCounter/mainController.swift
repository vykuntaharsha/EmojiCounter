//
//  mainController.swift
//  EmojiCounter
//
//  Created by Harsha Vykunta on 11/09/17.
//  Copyright © 2017 Harsha Vykunta. All rights reserved.
//

import UIKit

class mainController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.counter) , userInfo: nil , repeats: true)
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var seconds = 60
    var timer = Timer()
    var previousString = ""
    var score = 0
    var emojisPassed: [String] = []
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBAction func emojiChecker(_ sender: UITextField) {
        if(sender.text == nil){
            return
        }
        if(previousString.hasPrefix(sender.text!)){
            previousString = sender.text!
            return
        }
        let emoji = sender.text!.substring(from: previousString.endIndex)
        if emojisPassed.contains(emoji){
            score += 1
        }
        
        previousString = sender.text!
        scoreLabel.text = "score: \(score)"
        
    }
    
    
    @IBOutlet weak var textField: UITextField!
    
    
    func counter(){
        seconds -= 1
        timeLabel.text = String(seconds)
        if(seconds==0){
            timer.invalidate()
            scoreLabel.isEnabled = false
            textField.isEnabled = false
        }
    }

    

}
