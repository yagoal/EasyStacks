//
//  StackBuilder.swift
//  EasyStacks
//
//  Created by Yago Augusto on 01/01/25.
//

import SnapKit
import UIKit

/// A custom result builder for creating arrays of `UIView` objects.
@resultBuilder
public enum StackBuilder {
    /// Creates an empty array of `UIView`.
    public static func buildBlock() -> [UIView] { [] }
    
    /// Creates an array from variadic `UIView` elements.
    /// - Parameter stack: Variadic `UIView` elements.
    public static func buildBlock(_ stack: UIView...) -> [UIView] { stack }
    
    /// Flattens nested arrays of `UIView` elements into a single array.
    /// - Parameter stack: Arrays of `UIView` elements.
    public static func buildBlock(_ stack: [UIView]...) -> [UIView] { stack.flatMap { $0 } }
    
    /// Flattens nested arrays of `UIView` elements from an array of arrays.
    /// - Parameter components: Arrays of `UIView` elements.
    public static func buildArray(_ components: [[UIView]]) -> [UIView] {
        components.flatMap { $0 }
    }

    /// Allows direct usage of arrays of `UIView` within the builder.
    /// - Parameter expression: An array of `UIView` elements.
    public static func buildExpression(_ expression: [UIView]) -> [UIView] {
        return expression
    }

    /// Wraps a single `UIView` element into an array for consistency.
    /// - Parameter expression: A single `UIView` element.
    public static func buildExpression(_ expression: UIView) -> [UIView] {
        return [expression]
    }
}

extension UIStackView {
    /// Applies layout margins to a `UIStackView` using an `EdgeInsetsRepresentable`.
    /// - Parameter insets: The insets to be applied.
    func applyInsets(_ insets: EdgeInsetsRepresentable) {
        isLayoutMarginsRelativeArrangement = true
        layoutMargins = insets.insets
    }
}

// MARK: - VStack

/// Creates a vertical `UIStackView`.
/// - Parameters:
///   - alignment: The alignment of the arranged views within the stack.
///   - distribution: The distribution of the arranged views.
///   - spacing: The spacing between the arranged views.
///   - insets: The insets around the stack's content.
///   - content: A closure that provides the arranged subviews.
/// - Returns: A configured vertical `UIStackView`.
///
/// Example usage:
/// ```swift
/// let verticalStack = VStack(spacing: 10, insets: .all(16)) {
///     UILabel() .. {
///         $0.text = "Hello, World!"
///         $0.textAlignment = .center
///     }
///     UIButton(type: .system) .. {
///         $0.setTitle("Press Me", for: .normal)
///     }
/// }
///
/// // Without cascade operator:
/// let label = UILabel()
/// label.text = "Hello, World!"
/// label.textAlignment = .center
///
/// let verticalStackWithoutCascade = VStack {
///     label
///     UIButton(type: .system) .. {
///         $0.setTitle("Press Me", for: .normal)
///     }
/// }
/// ```
///
public func VStack(
    alignment: UIStackView.Alignment = .fill,
    distribution: UIStackView.Distribution = .fill,
    spacing: CGFloat = 0,
    insets: EdgeInsetsDirection = .all(0),
    @StackBuilder _ content: () -> [UIView]
) -> UIStackView {
    VStack(
        alignment: alignment,
        distribution: distribution,
        spacing: spacing,
        insets: insets as EdgeInsetsRepresentable,
        content
    )
}

public func VStack(
    alignment: UIStackView.Alignment = .fill,
    distribution: UIStackView.Distribution = .fill,
    spacing: CGFloat = 0,
    insets: EdgeInsetsRepresentable = EdgeInsetsDirection.all(0),
    @StackBuilder _ content: () -> [UIView]
) -> UIStackView {
    let stackView = UIStackView(arrangedSubviews: content())
    stackView.axis = .vertical
    stackView.alignment = alignment
    stackView.spacing = spacing
    stackView.distribution = distribution
    stackView.applyInsets(insets)
    return stackView
}

// MARK: - HStack

/// Creates a horizontal `UIStackView`.
/// - Parameters:
///   - alignment: The alignment of the arranged views within the stack.
///   - distribution: The distribution of the arranged views.
///   - spacing: The spacing between the arranged views.
///   - insets: The insets around the stack's content.
///   - content: A closure that provides the arranged subviews.
/// - Returns: A configured horizontal `UIStackView`.
///
/// Example usage:
/// ```swift
/// let horizontalStack = HStack(spacing: 8) {
///     UIImageView(image: UIImage(systemName: "star")) .. {
///         $0.contentMode = .scaleAspectFit
///     }
///     UILabel() .. {
///         $0.text = "Star Label"
///     }
/// }
///
/// // Without cascade operator:
/// let imageView = UIImageView(image: UIImage(systemName: "star"))
/// imageView.contentMode = .scaleAspectFit
///
/// let horizontalStackWithoutCascade = HStack {
///     imageView
///     UILabel() .. {
///         $0.text = "Star Label"
///     }
/// }
/// ```
public func HStack(
    alignment: UIStackView.Alignment = .fill,
    distribution: UIStackView.Distribution = .fill,
    spacing: CGFloat = 0,
    insets: EdgeInsetsDirection = .all(0),
    @StackBuilder _ content: () -> [UIView]
) -> UIStackView {
    HStack(
        alignment: alignment,
        distribution: distribution,
        spacing: spacing,
        insets: insets as EdgeInsetsRepresentable,
        content
    )
}

public func HStack(
    alignment: UIStackView.Alignment = .fill,
    distribution: UIStackView.Distribution = .fill,
    spacing: CGFloat = 0,
    insets: EdgeInsetsRepresentable = EdgeInsetsDirection.all(0),
    @StackBuilder _ content: () -> [UIView]
) -> UIStackView {
    let stackView = UIStackView(arrangedSubviews: content())
    stackView.axis = .horizontal
    stackView.alignment = alignment
    stackView.spacing = spacing
    stackView.distribution = distribution
    stackView.applyInsets(insets)
    return stackView
}

// MARK: - VScroll

/// Creates a vertical scroll view containing a vertically-stacked content view.
/// - Parameters:
///   - spacing: The spacing between the arranged subviews in the stack.
///   - insets: The insets around the stack's content.
///   - showsScrollIndicator: Whether the vertical scroll indicator should be visible.
///   - content: A closure that provides the arranged subviews.
/// - Returns: A configured vertical `UIScrollView`.
///
/// ## Example Usage:
/// ```swift
/// let verticalScroll = VScroll(spacing: 12, insets: .vertical(16)) {
///     UILabel() .. {
///         $0.text = "Scrollable Label"
///         $0.numberOfLines = 0
///     }
///     UIButton(type: .system) .. {
///         $0.setTitle("Scrollable Button", for: .normal)
///     }
/// }
///
/// // Without cascade operator:
/// let label = UILabel()
/// label.text = "Scrollable Label"
/// label.numberOfLines = 0
///
/// let verticalScrollWithoutCascade = VScroll(spacing: 12, insets: .all(16)) {
///     label
///     UIButton(type: .system) .. {
///         $0.setTitle("Scrollable Button", for: .normal)
///     }
/// }
/// ```
public func VScroll(
    spacing: CGFloat = 0,
    insets: EdgeInsetsDirection = .all(0),
    showsScrollIndicator: Bool = true,
    @StackBuilder _ content: () -> [UIView]
) -> UIScrollView {
    return VScroll(
        spacing: spacing,
        insets: insets as EdgeInsetsRepresentable,
        showsScrollIndicator: showsScrollIndicator,
        content
    )
}

public func VScroll(
    spacing: CGFloat = 0,
    insets: EdgeInsetsRepresentable = EdgeInsetsDirection.all(0),
    showsScrollIndicator: Bool = true,
    @StackBuilder _ content: () -> [UIView]
) -> UIScrollView {
    let scrollView = UIScrollView()
    scrollView.showsVerticalScrollIndicator = showsScrollIndicator
    scrollView.showsHorizontalScrollIndicator = false
    scrollView.translatesAutoresizingMaskIntoConstraints = false

    let stackView = VStack(
        alignment: .fill,
        distribution: .fill,
        spacing: spacing,
        insets: insets,
        content
    )

    scrollView.addSubview(stackView)
    stackView.translatesAutoresizingMaskIntoConstraints = false

    stackView.snp.makeConstraints { make in
        make.edges.equalToSuperview()
        make.width.equalTo(scrollView.frameLayoutGuide.snp.width)
    }

    return scrollView
}

// MARK: - HScroll

/// Creates a horizontal scroll view containing a horizontally-stacked content view.
/// - Parameters:
///   - spacing: The spacing between the arranged subviews in the stack.
///   - insets: The insets around the stack's content.
///   - showsScrollIndicator: Whether the horizontal scroll indicator should be visible.
///   - content: A closure that provides the arranged subviews.
/// - Returns: A configured horizontal `UIScrollView`.
///
/// ## Example Usage:
/// ```swift
/// let horizontalScroll = HScroll(spacing: 8, insets: .horizontal(16)) {
///     UIImageView(image: UIImage(systemName: "star")) .. {
///         $0.contentMode = .scaleAspectFit
///     }
///     UILabel() .. {
///         $0.text = "Scrollable Label"
///     }
/// }
///
/// // Without cascade operator:
/// let imageView = UIImageView(image: UIImage(systemName: "star"))
/// imageView.contentMode = .scaleAspectFit
///
/// let horizontalScrollWithoutCascade = HScroll(spacing: 8, insets: .horizontal(16)) {
///     imageView
///     UILabel() .. {
///         $0.text = "Scrollable Label"
///     }
/// }
/// ```
public func HScroll(
    spacing: CGFloat = 0,
    insets: EdgeInsetsDirection = .all(0),
    showsScrollIndicator: Bool = true,
    @StackBuilder _ content: () -> [UIView]
) -> UIScrollView {
    return HScroll(
        spacing: spacing,
        insets: insets as EdgeInsetsRepresentable,
        showsScrollIndicator: showsScrollIndicator,
        content
    )
}

public func HScroll(
    spacing: CGFloat = 0,
    insets: EdgeInsetsRepresentable = EdgeInsetsDirection.all(0),
    showsScrollIndicator: Bool = true,
    @StackBuilder _ content: () -> [UIView]
) -> UIScrollView {
    let scrollView = UIScrollView()
    scrollView.showsHorizontalScrollIndicator = showsScrollIndicator

    let stackView = HStack(
        alignment: .fill,
        distribution: .fill,
        spacing: spacing,
        insets: insets,
        content
    )

    scrollView.addSubview(stackView)
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.snp.makeConstraints { make in
        make.edges.equalToSuperview()
        make.height.equalTo(scrollView.frameLayoutGuide)
    }
    return scrollView
}
