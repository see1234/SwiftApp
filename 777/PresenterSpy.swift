//
//  PresenterSpy.swift
//  777
//
//  Created by Расим on 23.07.2023.
//


@testable import CleanSwift

final class PresenterSpy: PresenterProtocol{
    
    private(set) var isUpdateScreenn = false
    
    func updateScreen() {
        isUpdateScreenn = true
    }
    
    
}
