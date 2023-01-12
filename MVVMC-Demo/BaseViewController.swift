//
//  BaseViewController.swift
//  MVVMC-Demo
//
//  Created by thoonk on 2023/01/12.
//

import UIKit
import RxSwift

class BaseViewController: UIViewController {
    var disposeBag = DisposeBag()
    
    // MARK: - Init
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        setupLayout()
    }
    
    func setupLayout() {}
    func setupAttributes() {}
}

extension BaseViewController {
    func setupAlertView(with msg: String, handler: ((UIAlertAction) -> Void)? = nil) {
        let alertController = UIAlertController(title: "Englishvil", message: msg, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: handler)
        
        alertController.addAction(okAction)
        DispatchQueue.main.async {
            self.present(alertController, animated: true)
        }
    }
}
