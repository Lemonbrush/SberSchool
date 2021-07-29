//
//  MMVMViewController.swift
//  DH_Architecture
//
//  Created by Леонид Серебряный on 26.07.2021.
//

import Foundation
import UIKit

class MMVMViewController: UIViewController {
    private var viewModel: MVVMViewModel
    
    private var label = UILabel()
    
    init(
        viewModel: MVVMViewModel
    ) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.updated = { [weak self] in
            self?.label.text = viewModel.name
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
