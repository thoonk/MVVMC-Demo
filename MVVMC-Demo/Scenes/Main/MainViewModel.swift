//
//  MainViewModel.swift
//  MVVMC-Demo
//
//  Created by thoonk on 2023/01/11.
//

import RxSwift
import RxRelay

final class MainViewModel: ViewModelType {
    var bag = DisposeBag()
    var input: Input
    var output: Output
    
    struct Input {
        
    }
    
    struct Output {
        
    }
    
    init() {
        input = Input()
        output = Output()
    }
}
