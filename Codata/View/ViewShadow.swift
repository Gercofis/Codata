//
//  ViewShadow.swift
//  Codata
//
//  Created by Gilles ROBERT on 13/08/2018.
//  Copyright © 2018 Gilles ROBERT. All rights reserved.
//

import UIKit

class ViewShadow: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func setup() {
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowRadius = 3
        layer.shadowOffset = CGSize(width: 0, height: 3)
        layer.shadowOpacity = 0.75


    }
}
