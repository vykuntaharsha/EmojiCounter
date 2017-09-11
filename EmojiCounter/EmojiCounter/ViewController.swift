//
//  ViewController.swift
//  EmojiCounter
//
//  Created by Harsha Vykunta on 10/09/17.
//  Copyright © 2017 Harsha Vykunta. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let url = URL(string: "https://emojigenerator.herokuapp.com/emojis/api/v1?count=100")
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil{
                print("failed to load url")
            }else{
                if let content = data{
                    do{
                        let emotes = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        if let emojisData = emotes["emojis"] as? NSArray{
                            self.emojis = emojisData as! [String]
                        }
                    }catch{
                        print ("error reading")
                    }
                }
            }
        }
        task.resume()
                
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }

        var emojis: [String] = []

    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "mainSegue"{
            
            if let mainVC = segue.destination as? mainController {
                mainVC.emojisPassed = self.emojis
                
                
            }
        }
        
    }
 
    

}

