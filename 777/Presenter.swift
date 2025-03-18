//
//  Presenter.swift
//  777
//
//  Created by Расим on 23.07.2023.
//

import Foundation

final class Presenter: PresenterProtocol {
    weak var viewController: ViewController?
    
    func updateScreen(){
        viewController?.updateScreen()
    }
}
protocol PresenterProtocol{
    func updateScreen()
}
