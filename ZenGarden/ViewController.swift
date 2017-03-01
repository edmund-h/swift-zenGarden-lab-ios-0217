//
//  ViewController.swift
//  ZenGarden
//
//  Created by Flatiron School on 6/30/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit
import Darwin

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var kingBoySword: UIImageView!
    @IBOutlet weak var kingBoyShrub: UIImageView!
    @IBOutlet weak var rockManRock: UIImageView!
    @IBOutlet weak var rakeManRake: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        kingBoySword.isUserInteractionEnabled = true
        kingBoyShrub.isUserInteractionEnabled = true
        rockManRock.isUserInteractionEnabled = true
        rakeManRake.isUserInteractionEnabled = true
        
        let items = [kingBoySword, kingBoyShrub, rockManRock, rakeManRake]
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
        
        areAncientsJustified()
    }
    
    func areAncientsJustified (){
        
        let items = [kingBoySword, kingBoyShrub, rockManRock, rakeManRake]
        let rockManRockAxis = 370-rockManRock.center.y
        let kingBoySwordAxis = 370-kingBoySword.center.y
        let shrubrake = distance(kingBoyShrub.center, rakeManRake.center)
        guard (kingBoySword.center.x < 80 && kingBoySword.center.y < 80) ||
            (kingBoySword.center.x > 310 && kingBoySword.center.y > 690) else {return}
        guard shrubrake < 100 else {return}
        guard (rockManRockAxis / -1 * (rockManRockAxis)) !=
            (kingBoySwordAxis / -1 * (kingBoySwordAxis)) else {return}
        
        print ("yay")
        let alertController = UIAlertController(title: "ANCIENTS ARE JUSTIFIED", message: "MU MU", preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "MU MU", style: .default) { (action:UIAlertAction) in
            print("Now scramble");
        }
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion:{
            for item in items {
                item!.center.x = CGFloat(arc4random_uniform(350))
                item!.center.y = CGFloat(arc4random_uniform(750))
            }
        })
        
    }
    
    func distance (_ p1: CGPoint, _ p2:CGPoint)->Float{
        let distance = hypotf(Float(p1.x - p2.x), Float(p1.y - p2.y))
        return distance
    }
}


