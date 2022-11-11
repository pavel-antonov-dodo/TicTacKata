//
//  Grid.swift
//  TicTacKata
//
//  Created by Павел Антонов on 28.03.2022.
//

import Foundation
import UIKit

enum FieldState {
    case empty
    case x
    case o
}

enum DirectionalOwnership {
    case x
    case o
}

final class Field {
    private var state: FieldState = .empty
    
    func getState() -> FieldState {
        return state
    }
    
    func setState(_ newState: FieldState) {
        guard state == .empty else { return }
        state = newState
    }
}

final class Grid {
    let size: CGSize
    let fields: [Field]
    
    required init() {
        let size: CGSize = CGSize(width: 3, height: 3)
        self.size = size
        
        self.fields = (0..<Int(size.width * size.height)).reduce([], { partialResult, _ in
            var newResult = partialResult
            newResult += [Field()]
            return newResult
        })
    }
    
    subscript(_ x: Int, _ y: Int) -> Field? {
        guard (0..<Int(size.height)).contains(x),
              (0..<Int(size.width)).contains(y) else { return nil }
        return fields[x * Int(size.width) + y]
    }
    
    func getColumnStates(_ index: Int) -> [FieldState]? {
        guard (0..<Int(size.width)).contains(index) else { return nil }
        
        let result: [FieldState] = (0..<Int(size.height)).reduce([]) { partialResult, currentIndex in
            guard let field = self[currentIndex, index] else { return partialResult }
            
            var newResult = partialResult
            newResult += [field.getState()]
            return newResult
        }
        
        return result
    }
    
    func getColumnOwnership(_ index: Int) -> DirectionalOwnership? {
        guard let states = getColumnStates(index) else { return nil }
        
        if states.allSatisfy({ $0 == .x }) {
            return .x
        } else if states.allSatisfy({ $0 == .o }) {
            return .o
        } else {
            return nil
        }
    }
}
