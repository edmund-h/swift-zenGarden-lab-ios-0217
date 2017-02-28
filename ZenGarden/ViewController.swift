//
//  ViewController.swift
//  ZenGarden
//
//  Created by Flatiron School on 6/30/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var swordInRock1: UIImageView!
    @IBOutlet weak var shrub1: UIImageView!
    @IBOutlet weak var rockManRock: UIImageView!
    @IBOutlet weak var rakeManRake: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        swordInRock1.isUserInteractionEnabled = true
        shrub1.isUserInteractionEnabled = true
        rockManRock.isUserInteractionEnabled = true
        rakeManRake.isUserInteractionEnabled = true
        
        let items = [swordInRock1, shrub1, rockManRock, rakeManRake]
        items.forEach({
            let dragger = UIPanGestureRecognizer(target: self, action: #selector (dragView))
            ($0!).addGestureRecognizer(dragger)
            print ("added!")
        })
        
            
        
    }
    
    
   
    func dragView (_ sender: UIPanGestureRecognizer) {
        let point = sender.location(in: view)
        sender.view!.center = point
        print (point)
    }
    
}

