//
//  ViewController.swift
//  20AB
//
//  Created by Alex Alajbegovic on 10/26/17.
//  Copyright © 2017 Alex Alajbegovic. All rights reserved.
//

import UIKit

var score = 0

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var box1: UIImageView!
    @IBOutlet weak var box2: UIImageView!
    @IBOutlet weak var box3: UIImageView!
    @IBOutlet weak var box4: UIImageView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let leftSwipe = UISwipeGestureRecognizer(target:self, action: #selector(swipeAction(swipe:)))
        leftSwipe.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(leftSwipe)
        
        let rightSwipe = UISwipeGestureRecognizer(target:self, action: #selector(swipeAction(swipe:)))
        rightSwipe.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(rightSwipe)
        
        let upSwipe = UISwipeGestureRecognizer(target:self, action: #selector(swipeAction(swipe:)))
        upSwipe.direction = UISwipeGestureRecognizerDirection.up
        self.view.addGestureRecognizer(upSwipe)
        
        let downSwipe = UISwipeGestureRecognizer(target:self, action: #selector(swipeAction(swipe:)))
        downSwipe.direction = UISwipeGestureRecognizerDirection.down
        self.view.addGestureRecognizer(downSwipe)
        
    }
    
    @objc func swipeAction(swipe: UISwipeGestureRecognizer){
        switch swipe.direction {
        case UISwipeGestureRecognizerDirection.left:
            score = score + 1
            let scoreString = String(score)
            scoreLabel.text = scoreString
            
            
            
            if box1.center.y != box2.center.y, box1.center.y != box3.center.y, box1.center.y != box4.center.y{
                box1.center = CGPoint(x:box1.center.x - 60, y: box1.center.y)
            }
            if box2.center.y != box1.center.y, box2.center.y != box3.center.y, box2.center.y != box4.center.y{
                box2.center = CGPoint(x:box2.center.x - 60, y: box2.center.y)
            }
            if box3.center.y != box1.center.y, box3.center.y != box2.center.y, box3.center.y != box4.center.y{
                box3.center = CGPoint(x:box3.center.x - 60, y: box3.center.y)
            }
            if box4.center.y != box1.center.y, box4.center.y != box2.center.y, box4.center.y != box3.center.y{
                box4.center = CGPoint(x:box4.center.x - 60, y: box4.center.y)
            }
            
            
            
        case UISwipeGestureRecognizerDirection.right:
            score = score + 1
            let scoreString = String(score)
            scoreLabel.text = scoreString
            
            if box1.center.y != box2.center.y, box1.center.y != box3.center.y, box1.center.y != box4.center.y{
                box1.center = CGPoint(x:box1.center.x + 60, y: box1.center.y)
            }
            if box2.center.y != box1.center.y, box2.center.y != box3.center.y, box2.center.y != box4.center.y{
                box2.center = CGPoint(x:box2.center.x + 60, y: box2.center.y)
            }
            if box3.center.y != box1.center.y, box3.center.y != box2.center.y, box3.center.y != box4.center.y{
                box3.center = CGPoint(x:box3.center.x + 60, y: box3.center.y)
            }
            if box4.center.y != box1.center.y, box4.center.y != box2.center.y, box4.center.y != box3.center.y{
                box4.center = CGPoint(x:box4.center.x + 60, y: box4.center.y)
            }
            
       case UISwipeGestureRecognizerDirection.up:
            score = score + 1
            let scoreString = String(score)
            scoreLabel.text = scoreString
            
            if box1.center.x != box2.center.x, box1.center.x != box3.center.x, box1.center.x != box4.center.x{
                box1.center = CGPoint(x:box1.center.x, y: box1.center.y - 60)
            }
            if box2.center.x != box1.center.x, box2.center.x != box3.center.x, box2.center.x != box4.center.x{
                box2.center = CGPoint(x:box2.center.x, y: box2.center.y - 60)
            }
            if box3.center.x != box1.center.x, box3.center.x != box2.center.x, box3.center.x != box4.center.x{
                box3.center = CGPoint(x:box3.center.x, y: box3.center.y - 60)
            }
            if box4.center.x != box1.center.x, box4.center.x != box2.center.x, box4.center.x != box3.center.x{
                box4.center = CGPoint(x:box4.center.x, y: box4.center.y - 60)
            }
       case UISwipeGestureRecognizerDirection.down:
            score = score + 1
            let scoreString = String(score)
            scoreLabel.text = scoreString
            if box1.center.x != box2.center.x, box1.center.x != box3.center.x, box1.center.x != box4.center.x{
                box1.center = CGPoint(x:box1.center.x, y: box1.center.y + 60)
            }
            if box2.center.x != box1.center.x, box2.center.x != box3.center.x, box2.center.x != box4.center.x{
                box2.center = CGPoint(x:box2.center.x, y: box2.center.y + 60)
            }
            if box3.center.x != box1.center.x, box3.center.x != box2.center.x, box3.center.x != box4.center.x{
                box3.center = CGPoint(x:box3.center.x, y: box3.center.y + 60)
            }
            if box4.center.x != box1.center.x, box4.center.x != box2.center.x, box4.center.x != box3.center.x{
                box4.center = CGPoint(x:box4.center.x, y: box4.center.y + 60)
            }
        default:
            let scoreString = String(score)
            scoreLabel.text = scoreString
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}



