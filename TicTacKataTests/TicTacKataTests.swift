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
        XCTAssertTrue(fields.allSatisfy({ $0.getState() == .empty }))
    }
    
    func test_gridFieldCount_equalsGridSize() {
        let grid = Grid()
        XCTAssertEqual(grid.fields.count, Int(grid.size.width * grid.size.height))
    }
    
    func test_getFieldByCoordinate_returnField() {
        let grid = Grid()
        XCTAssertNotNil(grid[0,0])
    }
    
    func test_getFieldByOutOfBoundsCoordinate_returnNil() {
        let grid = Grid()
        XCTAssertNil(grid[0,100])
    }
    
    func test_fieldState_equalsX() {
        let grid = Grid()
        grid[0,0]?.setState(.x)
        XCTAssertEqual(grid[0,0]?.getState(), FieldState.x)
    }
    
    func test_fieldState_equalsO() {
        let grid = Grid()
        grid[0,0]?.setState(.o)
        XCTAssertEqual(grid[0,0]?.getState(), FieldState.o)
    }
    
    func test_fieldStateX_couldntChangeState() {
        let grid = Grid()
        grid[0,0]?.setState(.x)
        grid[0,0]?.setState(.o)
        XCTAssertEqual(grid[0,0]?.getState(), FieldState.x)
    }
    
    
    func test_notAllFieldsTaken_shouldnotGameOver() {
        let game = Game()
        game.grid[0,0]?.setState(.x)
        XCTAssertEqual(game.status, GameStatus.active)
    }
    
    func test_getColumnStates_shouldReturnColumnStates() {
        let game = Game()
        game.grid[0,0]?.setState(.x)
        XCTAssertEqual(game.grid.getColumnStates(0), [FieldState.x, FieldState.empty, FieldState.empty])
    }
    
    func test_getColumnStatesIndexOutOfBounds_shouldReturnNil() {
        let game = Game()
        XCTAssertNil(game.grid.getColumnStates(-1))
    }
    
    func test_allFieldsInColumn0TakenByX_shouldGameOver() {
        let game = Game()
        game.grid[0,0]?.setState(.x)
        game.grid[1,0]?.setState(.x)
        game.grid[2,0]?.setState(.x)
        XCTAssertEqual(game.status, GameStatus.over)
    }
    
    func test_allFieldsInColumn1TakenByX_shouldGameOver() {
        let game = Game()
        game.grid[0,1]?.setState(.x)
        game.grid[1,1]?.setState(.x)
        game.grid[2,1]?.setState(.x)
        XCTAssertEqual(game.status, GameStatus.over)
    }
    
    func test_allFieldsInColumn2TakenByX_shouldGameOver() {
        let game = Game()
        game.grid[0,2]?.setState(.x)
        game.grid[1,2]?.setState(.x)
        game.grid[2,2]?.setState(.x)
        XCTAssertEqual(game.status, GameStatus.over)
    }
    
    func test_allFieldsTaken_shouldGameOver() {
        let game = Game()
        for i in (0..<3) {
            for j in (0..<3) {
                game.grid[i,j]?.setState(.x)
            }
        }
        XCTAssertEqual(game.status, GameStatus.over)
    }
    
//    func test_allFieldsTaken_whenNobodyWins_shouldGameOver() {
//        let game = Game()
//        
//        game.grid[0,0]?.setState(.x)
//        game.grid[0,1]?.setState(.x)
//        game.grid[0,2]?.setState(.o)
//        
//        game.grid[1,0]?.setState(.o)
//        game.grid[1,1]?.setState(.o)
//        game.grid[1,2]?.setState(.x)
//        
//        game.grid[2,0]?.setState(.x)
//        game.grid[2,1]?.setState(.o)
//        game.grid[2,2]?.setState(.x)
//        
//        XCTAssertEqual(game.status, GameStatus.over)
//    }
}
