//
//  Mark.swift
//  TicTacToe
//
//  Created by Nico Hämäläinen on 18/03/16.
//  Copyright © 2016 sizeof.io. All rights reserved.
//

import Foundation

enum Mark: Int {
  case Empty
  case Cross
  case Circle
  
  var description: String {
    switch self {
    case .Cross:  return "x"
    case .Circle: return "o"
    default:      return ""
    }
  }
}