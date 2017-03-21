
import Foundation

protocol Ratable : class {    //加一個class 是說這個protocolo只能被class 繼承, 原因是 希望他的值是by reference, 而不是by value(另外copy一份)
    var ratings: [UInt] { get set }
}

@objc protocol HasTitle {  //如果有optional 的東西 protocol 要加上@objc
    
    var title: String { get }
    @objc optional var subtitle: String? { get }   //也要加上@objc
}

//如果protocol加上@objc  就只有class類型的 能繼承

