//
//  InteractorTests.swift
//  777
//
//  Created by Расим on 23.07.2023.
//

import XCTest
@testable import CleanSwift

final class InteractorTests: XCTestCase {
    private var interactor: Interactor!
    private var presenter: PresenterSpy!
    
    
    override func setUp() {
        super.setUp()
        presenter = PresenterSpy()
        interactor = Interactor(presenter: presenter)
    }
    
    override func tearDown() {
        presenter = nil
        interactor = nil
        super.tearDown()
    }
    
    func testUpdateScreen(){
        interactor.updateScreen()
        XCTAssertTrue(presenter.isUpdateScreenn, "Метод не вызван!")
    }
    func testnumberPutMoreTen(){
        let number = interactor.numberPut(a: 11)
        XCTAssertEqual(number, 33, "Неверный результат")
    }
    func testnumberPutLassTen(){
        let number = interactor.numberPut(a: 5)
        XCTAssertEqual(number, 2, "Неверный результат")
    }
    func testnumberPutTen(){
        let number = interactor.numberPut(a: 10)
        XCTAssertEqual(number, 7, "Неверный результат")
    }
    
    func testNewKeysWithFirst(){
        let first = interactor.newKeys(name: "first", newname: .first)
        XCTAssertEqual(first, ["f"])
    }
    func testNewKeysWithLast(){
        let last = interactor.newKeys(name: "Last", newname: .last)
        XCTAssertEqual(last, ["t"])
    }
    
    func testNewKeysWithAll(){
        let all = interactor.newKeys(name: "first", newname: .all)
        XCTAssertEqual(all, ["f", "i", "r","s", "t"])
    }
    
    func testNewKeysWithEmpty(){
        let first = interactor.newKeys(name: "", newname: .first)
        XCTAssertEqual(first, [])
    }
    
    func testNewKeysWithOptional(){
        let first = interactor.newKeys(name: nil, newname: .first)
        XCTAssertEqual(first, [])
    }
    
    func testProvercaTRue(){
        interactor.proverca(str: "Hello", subsrt: "llo")
        XCTAssertTrue(presenter.isUpdateScreenn)
    }
    func testProvercaFslse(){
        interactor.proverca(str: "Hello", subsrt: "llk")
        XCTAssertFalse(presenter.isUpdateScreenn)
    }
}
