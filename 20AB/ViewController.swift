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
        var moved:Bool!
    }
    
    var boxArr = [box] ()


    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      
        boxArr = [box(value: 0, position: 6 , Image: box1, moved: false),
                  box(value: 1, position: 12, Image: box2, moved: false)]

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
                    //Checks if box can move, moves it and updates that it moved for this swipe
                    for k in 0...boxArr.count - 1 {
                        //Checks with the bounds of current formatting of Main box and tiny boxes (compares to 72, which is left bound)
                        if !hasLeft && boxArr[k].moved == false && boxArr[k].Image.center.x - 60 >= 72 {
                            boxArr[k].Image.center = CGPoint(x: boxArr[k].Image.center.x - 60,
                                                             y: boxArr[k].Image.center.y)
                            boxArr[k].position = boxArr[k].position - 1
                            boxArr[k].moved = true
                        }
                    }
                }
            }
            //Resets if boxes moved for this swipe to false
            for i in 0...boxArr.count - 1 {
                boxArr[i].moved = false;
            }
            
            
        case UISwipeGestureRecognizerDirection.right:
            score = score + 1
            let scoreString = String(score)
            scoreLabel.text = scoreString
            
            for i in 0...boxArr.count - 1 {
                if boxArr[i].position != 4 && boxArr[i].position != 8 &&
                    boxArr[i].position != 12 && boxArr[i].position != 16 {
                    let currentPosition = boxArr[i].position
                    var hasRight = false
                    for j in 0...boxArr.count - 1 {
                        if boxArr[j].position == currentPosition! + 1 {
                            hasRight = true
                        }
                    }
                    //Checks if box can move, moves it and updates that it moved for this swipe
                    for k in 0...boxArr.count - 1 {
                        //Checks with the bounds of current formatting of Main box and tiny boxes (compares to 302, which is right bound)
                        if !hasRight && boxArr[k].moved == false && boxArr[k].Image.center.x + 60 <= 302 {
                            boxArr[k].Image.center = CGPoint(x: boxArr[k].Image.center.x + 60,
                                                             y: boxArr[k].Image.center.y)
                            boxArr[k].position = boxArr[k].position + 1
                            boxArr[k].moved = true
                        }
                    }
                }
            }
            //Resets if boxes moved for this swipe to false
            for i in 0...boxArr.count - 1 {
                boxArr[i].moved = false;
            }
            
       case UISwipeGestureRecognizerDirection.up:
            score = score + 1
            let scoreString = String(score)
            scoreLabel.text = scoreString
            for i in 0...boxArr.count - 1 {
                if boxArr[i].position != 1 && boxArr[i].position != 2 &&
                    boxArr[i].position != 3 && boxArr[i].position != 4 {
                    let currentPosition = boxArr[i].position
                    var hasAbove = false
                    for j in 0...boxArr.count - 1 {
                        if boxArr[j].position == currentPosition! - 4 {
                            hasAbove = true
                        }
                    }
                    //Checks if box can move, moves it and updates that it moved for this swipe
                    for k in 0...boxArr.count - 1 {
                        //Checks with the bounds of current formatting of Main box and tiny boxes (compares to 218, which is top bound)
                        if !hasAbove && boxArr[k].moved == false && boxArr[k].Image.center.y - 60 >= 218 {
                            boxArr[k].Image.center = CGPoint(x: boxArr[k].Image.center.x,
                                                             y: boxArr[k].Image.center.y - 60)
                            boxArr[k].position = boxArr[k].position - 4
                            boxArr[k].moved = true
                        }
                    }
                }
            }
            //Resets if boxes moved for this swipe to false
            for i in 0...boxArr.count - 1 {
                boxArr[i].moved = false;
            }

       case UISwipeGestureRecognizerDirection.down:
            score = score + 1
            let scoreString = String(score)
            scoreLabel.text = scoreString
            var hasBelow = false
            for i in 0...boxArr.count - 1 {
                if boxArr[i].position != 13 && boxArr[i].position != 14 &&
                    boxArr[i].position != 15 && boxArr[i].position != 16 {
                    let currentPosition = boxArr[i].position
                    hasBelow = false
                    for j in 0...boxArr.count - 1 {
                        if boxArr[j].position == currentPosition! + 4 {
                            hasBelow = true
                        }
                    }
                    //Checks if box can move, moves it and updates that it moved for this swipe
                    for k in 0...boxArr.count - 1 {
                        //Checks with the bounds of current formatting of Main box and tiny boxes (compares to 448, which is bottom bound)
                        if !hasBelow && boxArr[k].moved == false && boxArr[k].Image.center.y + 60 <= 448 {
                            boxArr[k].Image.center = CGPoint(x: boxArr[k].Image.center.x,
                                                             y: boxArr[k].Image.center.y + 60)
                            boxArr[k].position = boxArr[k].position + 4
                            boxArr[k].moved = true
                        }
                    }
                }
            }
            //Resets if boxes moved for this swipe to false
            for i in 0...boxArr.count - 1 {
                boxArr[i].moved = false;
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




