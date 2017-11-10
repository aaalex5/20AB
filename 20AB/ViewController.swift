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

    
    struct box {
        var value:Int!
        var position:Int!
        var Image:UIImageView!
        var hidden:Bool!
    }
    
    var boxArr = [box] ()


    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      
        boxArr = [box(value: 0, position: 6 , Image: box1, hidden: false),
                  box(value: 1, position: 12, Image: box2, hidden: false)]

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
    
    @objc func swipeAction(swipe: UISwipeGestureRecognizer) {
        switch swipe.direction {
        case UISwipeGestureRecognizerDirection.left:
            score = score + 1
            let scoreString = String(score)
            scoreLabel.text = scoreString
            
            for i in 0...boxArr.count - 1 {
                if boxArr[i].position != 1 && boxArr[i].position != 5 &&
                    boxArr[i].position != 9 && boxArr[i].position != 13 {
                    let currentPosition = boxArr[i].position
                    var hasLeft = false
                    for j in 0...boxArr.count - 1 {
                        if boxArr[j].position == currentPosition! - 1 {
                            hasLeft = true
                        }
                    }
                    if hasLeft == false {
                        boxArr[i].Image.center = CGPoint(x: boxArr[i].Image.center.x - 60,
                                                         y: boxArr[i].Image.center.y)
                        boxArr[i].position = boxArr[i].position - 1
                    }
                }
            }
            
        case UISwipeGestureRecognizerDirection.right:
            score = score + 1
            let scoreString = String(score)
            scoreLabel.text = scoreString
            
            for i in 0...boxArr.count - 1 {
                if boxArr[i].position != 4 && boxArr[i].position != 8 &&
                    boxArr[i].position != 12 && boxArr[i].position != 16 {
                    let currentPosition = boxArr[i].position
                    var hasLeft = false
                    for j in 0...boxArr.count - 1 {
                        if boxArr[j].position == currentPosition! + 1 {
                            hasLeft = true
                        }
                    }
                    if !hasLeft {
                        boxArr[i].Image.center = CGPoint(x: boxArr[i].Image.center.x + 60,
                                                         y: boxArr[i].Image.center.y)
                        boxArr[i].position = boxArr[i].position + 1
                    }
                }
            }
            
       case UISwipeGestureRecognizerDirection.up:
            score = score + 1
            let scoreString = String(score)
            scoreLabel.text = scoreString
            for i in 0...boxArr.count - 1 {
                if boxArr[i].position != 1 && boxArr[i].position != 2 &&
                    boxArr[i].position != 3 && boxArr[i].position != 4 {
                    let currentPosition = boxArr[i].position
                    var hasLeft = false
                    for j in 0...boxArr.count - 1 {
                        if boxArr[j].position == currentPosition! - 4 {
                            hasLeft = true
                        }
                    }
                    if !hasLeft {
                        boxArr[i].Image.center = CGPoint(x: boxArr[i].Image.center.x,
                                                         y: boxArr[i].Image.center.y - 60)
                        boxArr[i].position = boxArr[i].position - 4
                    }
                }
            }

       case UISwipeGestureRecognizerDirection.down:
            score = score + 1
            let scoreString = String(score)
            scoreLabel.text = scoreString
            
            for i in 0...boxArr.count - 1 {
                if boxArr[i].position != 13 && boxArr[i].position != 14 &&
                    boxArr[i].position != 15 && boxArr[i].position != 16 {
                    let currentPosition = boxArr[i].position
                    var hasLeft = false
                    for j in 0...boxArr.count - 1 {
                        if boxArr[j].position == currentPosition! + 4 {
                            hasLeft = true
                        }
                    }
                    // Probably make it a for loop so that boxes don't run into eachother
                    // mid-way when swiping
                    if !hasLeft {
                        boxArr[i].Image.center = CGPoint(x: boxArr[i].Image.center.x,
                                                         y: boxArr[i].Image.center.y + 60)
                        boxArr[i].position = boxArr[i].position + 4
                    }
                }
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




