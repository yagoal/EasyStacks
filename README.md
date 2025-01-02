# EasyStacks

EasyStacks is a lightweight framework designed to streamline the creation of UI layouts in UIKit by minimizing the need for manual constraint management. With EasyStacks, you can build views and subviews that are fully stackable and easily customizable. The framework provides a modern API for creating vertical and horizontal stacks, scrollable containers, and a highly adaptable base view (EasyStackView), all while prioritizing code readability and simplicity.
<br>
<br>
The goal of EasyStacks is to simplify layout creation in UIKit projects, reducing the reliance on verbose constraint setups and enabling developers to focus on building intuitive, declarative, and maintainable UI components.

---

## Features

- **VStack & HStack**: Simple APIs to create vertical and horizontal `UIStackView`s with configurable alignment, distribution, spacing, and insets.
- **VScroll & HScroll**: Easy-to-use scrollable containers for stacks with automatic insets handling.
- **EasyStackView**: A customizable base view for building complex UIs with minimal effort.
- **CascadeOperator**: A utility operator to configure UI elements in a clean, readable way.

---

## Installation

### Swift Package Manager (SPM)

To use **EasyStacks** in your project, follow these steps:

1. Open your project in Xcode.
2. Go to **File > Add Packages**.
3. Enter the following URL in the search bar:

https://github.com/yagoal/EasyStacks.git

4. Choose the version (e.g., 1.0.0) and click **Add Package**.
5. Select the target where you want to add EasyStacks.

Alternatively, you can integrate **EasyStacks** directly into your `Package.swift` file:

```swift
dependencies: [
 .package(url: "https://github.com/yagoal/EasyStacks.git", from: "1.0.0")
],
targets: [
 .target(
     name: "YourTarget",
     dependencies: ["EasyStacks"]
 )
]
```
---

## Usage

### **1. Cascade Operator**

The cascade operator (`..`) is a utility for configuring UI elements in a readable, declarative way.

**Explanation:**  
This operator allows you to configure UI elements inline without repeating the variable name for each property.

```swift
let label = UILabel() .. {
    $0.text = "Hello, World!"
    $0.textColor = .black
    $0.textAlignment = .center
}
```
<br>

### 2. VStack

The VStack is a vertical stack view builder that simplifies the creation of UIStackViews.

Explanation:
You can create a vertical stack with custom spacing and insets, making your code cleaner and more concise.

```swift
let verticalStack = VStack(spacing: 10, insets: .all(16)) {
    UILabel() .. {
        $0.text = "Vertical Stack Item 1"
        $0.textColor = .black
    }
    UIButton(type: .system) .. {
        $0.setTitle("Button in Stack", for: .normal)
    }
}
```

<br>

### 3. HStack

The HStack is a horizontal stack view builder.

Explanation:
Similar to VStack, it simplifies the creation of horizontal UIStackViews.

```swift
let horizontalStack = HStack(spacing: 8, insets: .horizontal(16)) {
    UIImageView(image: UIImage(systemName: "star")) .. {
        $0.contentMode = .scaleAspectFit
    }
    UILabel() .. {
        $0.text = "Horizontal Stack Item"
    }
}
```

<br>

### 4. VScroll

The VScroll creates a vertically scrollable container with a vertical stack inside.

Explanation:
This is useful when you want a vertical scrolling area in your interface.

```swift
let verticalScroll = VScroll(spacing: 12, insets: .vertical(16)) {
    UILabel() .. {
        $0.text = "Scrollable Item 1"
    }
    UIButton(type: .system) .. {
        $0.setTitle("Scrollable Button", for: .normal)
    }
}
```

<br>

### 5. HScroll

The HScroll creates a horizontally scrollable container with a horizontal stack inside.

Explanation:
Use this for creating horizontally scrolling content like carousels or image galleries.

```swift
let horizontalScroll = HScroll(spacing: 8, insets: .horizontal(16)) {
    UIImageView(image: UIImage(systemName: "heart")) .. {
        $0.contentMode = .scaleAspectFit
    }
    UILabel() .. {
        $0.text = "Horizontal Scrollable Item"
    }
}
```

<br>

### 6. EasyStackView

The EasyStackView is a customizable base view that simplifies UI composition.
You override its body() method to define the main content.

Explanation:
This acts as a base class for creating complex layouts.

```swift
final class MyCustomView: EasyStackView {
    private lazy var label = UILabel() .. {
        $0.text = "Welcome to EasyStacks!"
        $0.textAlignment = .center
    }
    
    override func body() -> Stackable? {
        VStack(spacing: 16, insets: .all(20)) {
            label
            UIButton(type: .system) .. {
                $0.setTitle("Get Started", for: .normal)
            }
        }
    }
}
```

<br>

### 7. Advanced: Custom Insets

You can customize stack insets using EdgeInsetsDirection.

Available Options:
	•	.all(CGFloat): Applies padding to all sides.
	•	.top(CGFloat), .bottom(CGFloat), .left(CGFloat), .right(CGFloat): Applies padding to specific sides.
	•	.horizontal(CGFloat), .vertical(CGFloat): Applies padding to left/right or top/bottom.

```swift
let customStack = VStack(spacing: 10, insets: .top(20) + .left(10)) {
    UILabel() .. {
        $0.text = "Custom Insets"
    }
}
```

<br>
Requirements
	•	iOS 12.0+
	•	Swift 5.7+

License

EasyStacks is licensed under the MIT License. See the LICENSE file for more information.
