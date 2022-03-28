//
//  TicTacKataTests.swift
//  TicTacKataTests
//
//  Created by Павел Антонов on 28.03.2022.
//

import XCTest
@testable import TicTacKata

class TicTacKataTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_gridSize_equals3x3() {
        let grid = Grid()
        XCTAssertEqual(grid.size.width, 3)
        XCTAssertEqual(grid.size.height, 3)
    }
    
    func test_grid_emptyOnStart() {
        let grid = Grid()
        let fields = grid.fields
        XCTAssertTrue(fields.allSatisfy({ $0.state == .empty }))
    }
    
    func test_gridFieldCount_equalsGridSize() {
        let grid = Grid()
        XCTAssertEqual(grid.fields.count, Int(grid.size.width * grid.size.height))
    }
    
    func test_getFieldByCoordinate_returnField() {
        let grid = Grid()
        XCTAssertNotNil(grid[0,0])
    }
}
