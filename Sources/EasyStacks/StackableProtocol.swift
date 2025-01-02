//
//  StackableProtocol.swift
//  EasyStacks
//
//  Created by Yago Augusto on 01/01/25.
//

import UIKit

// MARK: - Stackable Protocols
public protocol Stackable {
    var rootView: UIView { get }
}

public protocol StackableConvertible {
    var asStackable: [Stackable] { get }
}

extension UIView: Stackable, StackableConvertible {
    public var rootView: UIView { self }
    public var asStackable: [Stackable] { [self] }
}

extension Array: StackableConvertible where Element == Stackable {
    public var asStackable: [Stackable] { self }
}
