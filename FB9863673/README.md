# Xcode Preview crash when accessing property of class defined in other module

## Which area are you seeing an issue with?
Swift Compiler

## What type of feedback are you reporting?
Incorrect/Unexpected Behavior

## Please describe the issue:
I have a simple view in BasicUIComponent module (static lib)
```swift
public final class ImageTextView: UIView {

    public let stackView = UIView()
    public let imageView = UIImageView()
    public let textLabel = UILabel()

    public override init(frame: CGRect) {
        super.init(frame: frame)
    }

    public convenience init(image: UIImage?, text: String) {
        self.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```
When I’m trying to preview MessageView in another module, I found Xcode will always fail to preview if MessageView access property of ImageTextView.

```swift
public final class MessageView: UIView {

    public let imageTextView = ImageTextView(image: nil, text: "")

    public struct ViewModel {
        let text: String
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func bindData(with viewModel: ViewModel) {
        imageTextView.textLabel.text = viewModel.text // Crash here, -[UITraitCollection setText:]: unrecognized selector sent to instance 0x600002a080e0
    }
}
```

It seems the swift compiler failed to translate `imageTextView.textLabel.text = xxx` to correct method calling, it calling `setText:` method on wrong object.

## Please list the steps you took to reproduce the issue:
1. Open the attached sample project
2. Select MessageView.swift in file navigator
3. Preview the file

## What did you expect to happen?
The view should show up 

## What actually happened?
XCPreviewAgent crashed and preview failed
