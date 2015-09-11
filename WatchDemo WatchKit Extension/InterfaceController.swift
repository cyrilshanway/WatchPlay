//
//  InterfaceController.swift
//  WatchDemo WatchKit Extension
//
//  Created by Cyrilshanway on 2015/9/11.
//  Copyright (c) 2015年 Cyrilshanway. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var actionImg: WKInterfaceImage!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    @IBAction func playTapped() {
        
        actionImg.setImageNamed("action")
        actionImg.startAnimatingWithImagesInRange(
            NSRange(location: 0, length: 3),
            duration: 0.3,
            repeatCount: 3)
        
        
        delay(0.9) {
            // do stuff
            var imageName = arc4random_uniform(3)
            
            // watch不支持動畫，沒有layer
            
            self.actionImg.setImageNamed("action\(imageName)")
        }
        
        
    }
}
