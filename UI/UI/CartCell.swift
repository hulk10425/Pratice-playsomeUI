//
//  CartCell.swift
//  UI
//
//  Created by 陳遵丞 on 2017/8/3.
//  Copyright © 2017年 hulk. All rights reserved.
//

import UIKit

class CartCell: UITableViewCell {
    var myLabel = UILabel()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        myLabel.backgroundColor = UIColor.yellow
        self.contentView.addSubview(myLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        myLabel.frame = CGRect(x: 20, y: 0, width: 200, height: 30)
    }

}
