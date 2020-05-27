//
//  photoCell.swift
//  demoProject
//
//  Created by 9splay_user on 2020/5/18.
//  Copyright © 2020 9splay_user. All rights reserved.
//

import Foundation

import UIKit

class photoCell : UICollectionViewCell {
    
    @IBOutlet weak var IDLabel: UILabel?
    
    @IBOutlet weak var TitleLabel: UILabel?
    
    @IBOutlet weak var BackgroundImage: UIImageView!
    
    
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
    }
    
     override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    required init?(coder: NSCoder) {

        super.init(coder: coder)

//        fatalError(String(format:"init(coder: %@) has not been implemented",coder))
    }
    
}
