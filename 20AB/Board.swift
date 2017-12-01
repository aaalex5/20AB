//
//  Board.swift
//  20AB
//
//  Created by Alex Alajbegovic on 11/30/17.
//  Copyright © 2017 Alex Alajbegovic. All rights reserved.
//

import UIKit

class Board {
    var tiles = [[Tile]]()
    
    init() {
        var new_tile:Tile
        new_tile.value = 0
        new_tile.letter = ""
        new_tile.image = UIImage
        let new_tile_array:[Tile] = [new_tile, new_tile, new_tile, new_tile]
        for i in 0...4 {
            self.tiles.append(new_tile_array)
        }
    }
    
    func swipe(direction: String) {
        switch direction {
        case "left":
            if (true) {
                //Consider each row and check for consecutive pairs of tiles with the same value
                // Move x-position
            }
        case "right":
            if (true) {
                
            }
        case "up":
            if (true) {
                
            }
        case "down":
            if (true) {
                
            }
        default:
            break
        }
    }
    
    func board_is_full() {
        //Check if board is full of non-zero values
        //if no zero value, check is there is a pair or a word, maybe add a timer at this point
        //if no available moves game over
    }
    
}

struct Tile {
    var letter:String
    var value:Int
    var image:UIImage
    init(value_in: Int) {
        let alphabet = " ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        let index = alphabet.utf8CString.index(alphabet.startIndex, offsetBy: value_in)
        self.value = value_in
        self.letter = ""
        self.image = UIImage() //placeholder
    }
}
