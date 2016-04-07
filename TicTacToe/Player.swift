//
//  Player.swift
//  TicTacToe
//
//  Created by Nico Hämäläinen on 18/03/16.
//  Copyright © 2016 sizeof.io. All rights reserved.
//

import Foundation
import GameplayKit

class Player: NSObject {
  let mark: Mark
  
  init(mark: Mark) {
    self.mark = mark
  }
  
  static var allPlayers = [
    Player(mark: .Circle),
    Player(mark: .Cross)
  ]
  
  class func playerWithMark(mark: Mark) -> Player {
    return allPlayers[mark.rawValue - 1]
  }
  
  func opponent() -> Player? {
    switch mark {
    case .Circle:
      return Player.playerWithMark(.Cross)
    case .Cross:
      return Player.playerWithMark(.Circle)
    default:
      return nil
    }
  }
}

extension Player: GKGameModelPlayer {
  var playerId: Int {
    return mark.rawValue
  }
}