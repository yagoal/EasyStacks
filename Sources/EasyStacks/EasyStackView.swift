//
//  EasyStackView.swift
//  EasyStacks
//
//  Created by Yago Augusto on 01/01/25.
//

import UIKit
import SnapKit

// MARK: - ContentAlignment Enum

/// Specifies the alignment of the content within an `EasyStackView`.
public enum ContentAlignment {
    /// Aligns the content at the top.
    case top
    /// Centers the content vertically.
    case center
}

// MARK: - EasyStackView

/// A customizable `UIView` subclass designed to simplify layout configurations with alignment and safe area support.
///
/// `EasyStackView` provides a structured way to layout content with built-in support for content alignment (`.top`, `.center`) and the option to include or exclude safe area constraints.
///
/// Example usage:
/// ```swift
/// class MyCustomView: EasyStackView {
///     private lazy var label: UILabel = {
///         let label = UILabel()
///         label.text = "Hello, EasyStack!"
///         label.textAlignment = .center
///         label.textColor = .black
///         return label
///     }()
///
///     private lazy var button: UIButton = {
///         let button = UIButton(type: .system)
///         button.setTitle("Press Me", for: .normal)
///         button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
///         return button
///     }()
///
///     override func body() -> Stackable? {
///         VStack(spacing: 12) {
///             label
///             button
///         }
///     }
///
///     @objc private func buttonTapped() {
///         print("Button tapped!")
///     }
/// }
///
/// Adding the view to a ViewController
/// ```swift
/// class MyViewController: UIViewController {
///     override func loadView() {
///         // Set the custom view as the main view of the controller
///         view = MyCustomView(usingSafeArea: true, contentAlignment: .center)
///     }
/// }
/// ```
open class EasyStackView: UIView {
    /// The priority of the body layout. Default is `.required`.
    public var bodyLayoutPriority = UILayoutPriority.required

    /// A flag indicating whether the layout should use the safe area.
    let usingSafeArea: Bool

    /// The alignment of the content within the view.
    public var contentAlignment: ContentAlignment

    // MARK: - Initialization

    /// Initializes an `EasyStackView` with the specified properties.
    /// - Parameters:
    ///   - backgroundColor: The background color of the view. Default is `.white`.
    ///   - usingSafeArea: A Boolean indicating whether the layout should respect the safe area. Default is `false`.
    ///   - contentAlignment: The alignment of the content within the view. Default is `.top`.
    public init(
        backgroundColor: UIColor = .white,
        usingSafeArea: Bool = false,
        contentAlignment: ContentAlignment = .top
    ) {
        self.usingSafeArea = usingSafeArea
        self.contentAlignment = contentAlignment
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        setup()
    }

    /// Unavailable initializer for interface builder usage.
    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Body

    /// Override this method to define the main content of the `EasyStackView`.
    ///
    /// This method should return an object conforming to the `Stackable` protocol, representing the main layout of the view.
    open func body() -> Stackable? { nil }

    // MARK: - Private Configuration

    /// Configures the layout of the `body` within the view.
    private func configureBody() {
        guard let body = body() else { return }
        let bodyView = body.rootView
        addSubview(bodyView)
        
        let safeArea = safeAreaLayoutGuide.snp
        
        bodyView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            
            switch contentAlignment {
            case .top:
                make.top.equalTo(usingSafeArea ? self.snp.top : safeArea.top)
                make.bottom.equalTo(usingSafeArea ? self.snp.bottom : safeArea.bottom).priority(.low)
                
            case .center:
                make.centerY.equalTo(usingSafeArea ? self.snp.centerY : safeArea.centerY)
                make.top.greaterThanOrEqualTo(usingSafeArea ? self.snp.top : safeArea.top)
                make.bottom.lessThanOrEqualTo(usingSafeArea ? self.snp.bottom : safeArea.bottom)
            }
        }
    }

    // MARK: - Setup

    /// Sets up the view's layout and configuration.
    private func setup() {
        configureBody()
        configureSubviews()
        configureConstraints()
        configureActions()
    }

    /// Override this method to configure additional subviews.
    open func configureSubviews() {}

    /// Override this method to define custom constraints.
    open func configureConstraints() {}

    /// Override this method to handle view-specific actions.
    open func configureActions() {}

    // MARK: - Superview Handling

    override open func didMoveToSuperview() {
        super.didMoveToSuperview()
        guard let superview = superview else { return }

        self.snp.makeConstraints { make in
            if usingSafeArea {
                make.edges.equalTo(superview.safeAreaLayoutGuide)
            } else {
                make.edges.equalToSuperview()
            }
        }
    }
}
