//
//  Move.swift
//  TicTacToe
//
//  Created by Nico Hämäläinen on 18/03/16.
//  Copyright © 2016 sizeof.io. All rights reserved.
//

import Foundation
import GameplayKit

class Move: NSObject, GKGameModelUpdate {
  var value = 0
  var index: Int
  
  init(index: Int) {
    self.index = index
  }
}