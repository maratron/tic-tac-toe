//
//  Board.swift
//  TicTacToe
//
//  Created by Nico Hämäläinen on 18/03/16.
//  Copyright © 2016 sizeof.io. All rights reserved.
//

import Foundation
import GameplayKit

class Board: NSObject {
  let level: Int
  
  var currentPlayer: Player
  var cells: [Mark]
  
  init(level: Int) {
    self.level = level
    
    // Circle starts
    currentPlayer = Player.playerWithMark(.Circle)
    
    // Start with an empty board
    cells = Array<Mark>(count: level * level, repeatedValue: .Empty)
  }
  
  func addMarkToCell(index: Int) {
    if cells[index] == .Empty {
      cells[index] = currentPlayer.mark
    }
  }
  
  func lines() -> [[Int]] {
    var lines = [[Int]]()
    
    // Go through
  }
  
  func endTurn() {
    currentPlayer = currentPlayer.opponent()!
  }
}

extension Board: GKGameModel {
  var players: [GKGameModelPlayer]? {
    return Player.allPlayers
  }
  
  var activePlayer: GKGameModelPlayer? {
    return currentPlayer
  }
  
  func gameModelUpdatesForPlayer(player: GKGameModelPlayer) -> [GKGameModelUpdate]? {
    var moves = [Move]()
    
    for (i, cell) in cells.enumerate() {
      if cell == .Empty {
        moves.append(Move(index: i))
      }
    }
    
    // Nicer way:
    // return cells.enumerate().filter({ $0.element != .Empty }).map({ Move(index: $0.index) })
    
    return moves
  }
  
  func applyGameModelUpdate(gameModelUpdate: GKGameModelUpdate) {
    if let move = gameModelUpdate as? Move {
      addMarkToCell(move.index)
    }
  }
  
  func setGameModel(gameModel: GKGameModel) {
    if let board = gameModel as? Board {
      cells = board.cells
      currentPlayer = board.currentPlayer
    }
  }
  
  func copyWithZone(zone: NSZone) -> AnyObject {
    let board = Board(level: level)
    board.setGameModel(self)
    return board
  }
  
  func isWinForPlayer(player: GKGameModelPlayer) -> Bool {
    <#code#>
  }
}