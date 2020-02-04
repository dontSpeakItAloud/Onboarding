//
//  HeaderLabel.swift
//  Onboarding
//
//  Created by Rodion Kuskov on 2/2/20.
//  Copyright © 2020 Rodion Kuskov. All rights reserved.
//

import Foundation
import SnapKit
import UIKit

class HeaderLabelView: UIView {
    private lazy var haveFunLabel: UILabel = {
        let label = UILabel()
        label.text = "let's have fun".uppercased()
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.font = .avenirRegular(size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var rightNowLabel: UILabel = {
        let label = UILabel()
        label.text = "right now".uppercased()
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.font = .avenirDemiBold(size: 46)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubviews()
    }
    
    private func addSubviews() {
        addSubview(haveFunLabel)
        haveFunLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(30)
        }
        
        addSubview(rightNowLabel)
        rightNowLabel.snp.makeConstraints { make in
            make.top.equalTo(haveFunLabel.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(60)
        }
    }
}
