//
//  SelfSizingTableView.swift
//  Hired Valley
//
//  Created by ellkaden on 12.09.2024.
//

import Foundation
import UIKit

final class SelfSizingTableView: UITableView {
    override var contentSize: CGSize {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }

    override var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }
}
