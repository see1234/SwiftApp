//
//  ViewController.swift
//  777
//
//  Created by Расим on 23.07.2023.
//

import UIKit

class ViewController: UIViewController {

    private var interactor: Interactor
    
    init(interactor: Interactor){
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func updateScreen(){
        interactor.updateScreen()
    }
    

}

