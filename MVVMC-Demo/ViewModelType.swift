//
//  ViewModelType.swift
//  MVVMC-Demo
//
//  Created by thoonk on 2023/01/11.
//

import Foundation
import RxSwift

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    var bag: DisposeBag { get set }
}
