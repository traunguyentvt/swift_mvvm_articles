//
//  ArticleTableViewCell.swift
//  GoodNews
//
//  Created by VT on 9/15/23.
//

import Foundation
import UIKit

class ArticleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configCell(article: Article) {
        titleLabel.text = article.title
        descriptionLabel.text = article.description
    }
    
}
