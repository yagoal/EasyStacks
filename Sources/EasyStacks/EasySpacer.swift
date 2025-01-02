//
//  EasySpacer.swift
//  EasyStacks
//
//  Created by Yago Augusto on 01/01/25.
//

import UIKit

/// A custom spacer that can either fill the remaining space or have a fixed size.
public class EasySpacer: UIView {
    
    // MARK: - Initialization
    /**
     Initializes the spacer with either a fixed size or flexible behavior.
     
     - Parameters:
       - fixedSize: An optional fixed size for the spacer. If `nil`, the spacer will expand flexibly.
       - axis: The axis along which the fixed size is applied (vertical or horizontal). Defaults to `.vertical`.
     */
    public init(fixedSize: CGFloat? = nil, axis: NSLayoutConstraint.Axis = .vertical) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false

        // Configure the spacer based on fixed size or flexible behavior
        if let fixedSize = fixedSize {
            if axis == .vertical {
                self.snp.makeConstraints { make in
                    make.height.equalTo(fixedSize)
                }
            } else {
                self.snp.makeConstraints { make in
                    make.width.equalTo(fixedSize)
                }
            }
        }
    }
    
    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
