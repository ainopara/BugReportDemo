import UIKit
import SwiftUI
import BasicUIComponent

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

extension MessageView.ViewModel: UIViewRepresentable {

    public func makeUIView(context: Context) -> MessageView {
        let uiView = MessageView(frame: .init(origin: .zero, size: CGSize(width: 100, height: 100)))
        uiView.bindData(with: self)
        return uiView
    }

    public func updateUIView(_ uiView: MessageView, context: Context) {
        uiView.bindData(with: self)
    }

}

struct AlertAttributedMessageView_Previews: PreviewProvider {

    static var previews: some View {
        MessageView.ViewModel(text: "abcd")
            .frame(width: 320, height: 100.0)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}

