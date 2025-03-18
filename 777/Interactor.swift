//
//  Interactor.swift
//  777
//
//  Created by Расим on 23.07.2023.
//


final class Interactor{
    private var presenter: PresenterProtocol
    
    init(presenter: PresenterProtocol) {
        self.presenter = presenter
    }
    
    func updateScreen(){
        presenter.updateScreen()
    }
    
    func numberPut(a: Int) -> Int{
        return a > 10 ? a * 3 : a - 3
    }
    
    enum Keys{
        case first
        case last
        case all
    }
    
    func newKeys(name: String?, newname: Keys) -> [Character]{
        guard let name = name, !name.isEmpty else {
            return []
        }
        var massive: [Character?] = []
        
        switch newname{
        case .first: massive.append(name.first)
        case .last: massive.append(name.last)
        case .all: massive = Array(name)
            
        }
        return massive.compactMap{$0}
    }
    
    func proverca(str:String, subsrt: String){
        if str.contains(subsrt){
            presenter.updateScreen()
        }
    }
}
