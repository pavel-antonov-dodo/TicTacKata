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
}

final class Field {
    let state: FieldState = .empty
}

final class Grid {
    let size: CGSize
    let fields: [Field]
    
    required init() {
        let size: CGSize = CGSize(width: 3, height: 3)
        self.size = size
        self.fields = Array(repeating: Field(), count: Int(size.width * size.height))
    }
    
    subscript(_ x: Int, _ y: Int) -> Field? {
        return Field()
    }
}
