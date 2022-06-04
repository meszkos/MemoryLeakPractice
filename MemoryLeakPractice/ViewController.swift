//
//  ViewController.swift
//  MemoryLeakPractice
//
//  Created by MacOS on 03/06/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       let button = UIButton()
        
        button.setTitle("Tap Me", for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        button.center = view.center
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        view.addSubview(button)
    }

    
    @objc private func didTapButton(){
        let vc = SecondVC()
        present(vc, animated: true)
    }
}



class MyView: UIView{
    weak var vc: UIViewController?
    init(vc: UIViewController){
        self.vc = vc
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

class SecondVC: UIViewController{
    var myView: MyView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        myView = MyView(vc: self)
    }
}
