//
//  EdgeInsetsRepresentable.swift
//  EasyStacks
//
//  Created by Yago Augusto on 01/01/25.
//

import UIKit

/// A protocol for representing edge insets direction.
///
/// Types conforming to `EdgeInsetsRepresentable` provide a unified way to access `UIEdgeInsets`.
public protocol EdgeInsetsRepresentable {
    /// The `UIEdgeInsets` representation of the direction.
    var insets: UIEdgeInsets { get }
}

/// Enum representing standard edge inset directions.
///
/// This enum provides predefined cases to apply padding in specific directions such as:
/// - `.all`: Applies equal padding to all sides.
/// - `.top`, `.bottom`, `.left`, `.right`: Applies padding to a specific side.
/// - `.horizontal`: Applies padding to both left and right sides.
/// - `.vertical`: Applies padding to both top and bottom sides.
///
/// ## Example Usage:
/// ```swift
/// let stackView = VStack(
///     spacing: 10,
///     insets: .top(20) + .left(15)
/// ) {
///     UILabel() .. {
///         $0.text = "Hello, VStack!"
///         $0.textColor = .black
///         $0.font = UIFont.systemFont(ofSize: 16)
///     }
///     UIButton() .. {
///         $0.setTitle("Tap Me", for: .normal)
///         $0.setTitleColor(.blue, for: .normal)
///     }
/// }
public enum EdgeInsetsDirection: EdgeInsetsRepresentable {
    case all(CGFloat)
    case vertical(CGFloat)
    case horizontal(CGFloat)
    case top(CGFloat)
    case bottom(CGFloat)
    case left(CGFloat)
    case right(CGFloat)

    /// Converts the edge inset direction into `UIEdgeInsets`.
    public var insets: UIEdgeInsets {
        switch self {
        case .all(let inset):
            return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
        case .vertical(let inset):
            return UIEdgeInsets(top: inset, left: 0, bottom: inset, right: 0)
        case .horizontal(let inset):
            return UIEdgeInsets(top: 0, left: inset, bottom: 0, right: inset)
        case .top(let inset):
            return UIEdgeInsets(top: inset, left: 0, bottom: 0, right: 0)
        case .bottom(let inset):
            return UIEdgeInsets(top: 0, left: 0, bottom: inset, right: 0)
        case .left(let inset):
            return UIEdgeInsets(top: 0, left: inset, bottom: 0, right: 0)
        case .right(let inset):
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: inset)
        }
    }

    /// Combines multiple `EdgeInsetsRepresentable` values into a single value.
    ///
    /// - Parameter insets: A variadic list of edge insets to combine.
    /// - Returns: A combined `EdgeInsetsRepresentable` object with all values added together.
    ///
    /// ## Example Usage:
    /// ```swift
    /// let combinedInsets = .top(10) + .left(20)
    /// ```
    public static func combine(_ insets: EdgeInsetsRepresentable...) -> EdgeInsetsRepresentable {
        let combinedInsets = insets.reduce(UIEdgeInsets.zero) { result, inset in
            UIEdgeInsets(
                top: result.top + inset.insets.top,
                left: result.left + inset.insets.left,
                bottom: result.bottom + inset.insets.bottom,
                right: result.right + inset.insets.right
            )
        }
        return CombinedEdgeInsets(combinedInsets)
    }

    /// Overloads the `+` operator to combine two `EdgeInsetsDirection` values.
    ///
    /// - Parameters:
    ///   - lhs: The first edge inset direction.
    ///   - rhs: The second edge inset direction.
    /// - Returns: A combined `EdgeInsetsRepresentable` object.
    ///
    /// ## Example Usage:
    /// ```swift
    /// let combinedInsets = .top(10) + .left(15)
    /// ```
    public static func +(lhs: EdgeInsetsDirection, rhs: EdgeInsetsDirection) -> EdgeInsetsRepresentable {
        combine(lhs, rhs)
    }
}

/// A private structure to represent combined edge insets.
private struct CombinedEdgeInsets: EdgeInsetsRepresentable {
    /// The `UIEdgeInsets` representation of the combined values.
    let insets: UIEdgeInsets

    /// Initializes a `CombinedEdgeInsets` with the provided `UIEdgeInsets`.
    init(_ insets: UIEdgeInsets) {
        self.insets = insets
    }
}
