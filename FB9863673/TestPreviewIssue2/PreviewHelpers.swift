//
//  PreviewHelpers.swift
//  LeoUIPreview
//
//  Created by Zheng Li on 2020/9/25.
//

import Tatami
import SwiftUI
import SnapKit

extension ItemLayoutContext {

    init(width: CGFloat, height: CGFloat = 0.0) {
        let size = CGSize(width: width, height: height)
        self.init(containerSize: size, remainingSize: size)
    }

    static let iPhone5 = ItemLayoutContext(width: 320.0, height: 568.0)
    static let iPhone6 = ItemLayoutContext(width: 375.0, height: 667.0)
    static let iPhone11 = ItemLayoutContext(width: 414.0, height: 896.0)
}

extension SizeProvider where Self: View {

    func applyingFrame(with context: ItemLayoutContext) -> some View {
        let calculatedSize = self.size(in: context)
        return self
            .frame(width: calculatedSize.width, height: calculatedSize.height)
    }
}

// MARK: - Preview Provider

public protocol PreviewAsCell: UIViewRepresentable {}

public extension ReusableCellViewModel where Self: PreviewAsCell, UIViewType == Cell {

    func makeUIView(context: Context) -> Cell {
        let uiView = Cell(frame: .zero)
        configure(cell: uiView)
        return uiView
    }

    func updateUIView(_ uiView: Cell, context: Context) {
        configure(cell: uiView)
    }
}

public protocol PreviewAsSupplementaryView: UIViewRepresentable {}

public extension ReusableSupplementaryViewModel where Self: PreviewAsSupplementaryView, UIViewType == ReusableSupplementaryView {

    func makeUIView(context: Context) -> ReusableSupplementaryView {
        let uiView = ReusableSupplementaryView(frame: .zero)
        configure(supplementaryView: uiView)
        return uiView
    }

    func updateUIView(_ uiView: ReusableSupplementaryView, context: Context) {
        configure(supplementaryView: uiView)
    }
}

public protocol PreviewAsUIView: UIViewRepresentable {}

public extension ReusableViewModel where Self: PreviewAsUIView, UIViewType == ReusableView {

    func makeUIView(context: Context) -> ReusableView {
        let uiView = ReusableView(frame: .zero)
        configure(view: uiView)
        return uiView
    }

    func updateUIView(_ uiView: ReusableView, context: Context) {
        configure(view: uiView)
    }
}

// MARK: - UIImage Extension

// MARK: - SectionPreview

class TatamiPreviewViewController: UIViewController {

    let sections: [ConfigurableSection]
    var collectionView: UICollectionView { collectionViewManager.collectionView }

    private let collectionViewManager: Tatami.CollectionViewManager

    public init(sections: [ConfigurableSection], layout: UICollectionViewLayout = Tatami.CollectionViewLayout()) {
        self.sections = sections
        collectionViewManager = Tatami.CollectionViewManager(layout: layout)
        super.init(nibName: nil, bundle: nil)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.backgroundColor = .clear
        view.addSubview(collectionView)

        collectionView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }

        collectionViewManager.updateSections(sections)
    }
}

struct SectionPreview: UIViewControllerRepresentable {

    let sections: [ConfigurableSection]
    let layout: UICollectionViewLayout

    init(sections: [ConfigurableSection], layout: UICollectionViewLayout = Tatami.CollectionViewLayout()) {
        self.sections = sections
        self.layout = layout
    }

    init(section: ConfigurableSection, layout: UICollectionViewLayout = Tatami.CollectionViewLayout()) {
        self.init(sections: [section], layout: layout)
    }

    func makeUIViewController(context: Context) -> TatamiPreviewViewController {
        return TatamiPreviewViewController(sections: sections, layout: layout)
    }

    func updateUIViewController(_ uiViewController: TatamiPreviewViewController, context: Context) {
        // Update is not supported for now
    }
}

extension ConfigurableSection {
    func preview(layout: UICollectionViewLayout = Tatami.CollectionViewLayout()) -> SectionPreview {
        SectionPreview(section: self, layout: layout)
    }
}

extension Array where Element == ConfigurableSection {
    func preview(layout: UICollectionViewLayout = Tatami.CollectionViewLayout()) -> SectionPreview {
        SectionPreview(sections: self, layout: layout)
    }
}

// MARK: - TestView

public final class TestView: UIView {

    public struct ViewModel: ReusableViewModel {

        public let color: UIColor
        public let width: CGFloat
        public let height: CGFloat

        public init(
            color: UIColor = .white,
            width: CGFloat = 10.0,
            height: CGFloat = 10.0
        ) {
            self.color = color
            self.width = width
            self.height = height
        }

        public func configure(view: ColorView) {
            view.backgroundColor = color
        }

        public func layoutSize(in context: ItemLayoutContext) -> LayoutSize {
            return LayoutSize(width: .absolute(width), height: .absolute(height))
        }
    }
}
