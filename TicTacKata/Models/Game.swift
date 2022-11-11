//
//  Game.swift
//  TicTacKata
//
//  Created by Павел Антонов on 09.06.2022.
//

import Foundation

enum GameStatus {
    case active
    case over
}

final class Game {
    
    let grid: Grid = Grid()
    
    var status: GameStatus {
        guard !grid.fields.allSatisfy({ $0.getState() == .empty }) else { return .active }
        
        let firstColumnOwnership = grid.getColumnOwnership(0)
        let secondColumnOwnership = grid.getColumnOwnership(1)
        let thirdColumnOwnership = grid.getColumnOwnership(2)
        
        let result = ![firstColumnOwnership, secondColumnOwnership, thirdColumnOwnership].compactMap{ $0 }.isEmpty
        
        return result ? .over : .active
    }
    
//    private func columnStatus(index j: Int) -> FieldState {
//        guard let columnStates = grid.getColumnStates(j) else { return }
//
//    }
}
