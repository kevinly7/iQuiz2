//
//  QuizCell.swift
//  iQuiz2
//
//  Created by Kevin Ly on 11/15/15.
//  Copyright © 2015 Kevin Ly. All rights reserved.
//

import UIKit

class QuizCell: UITableViewCell {

    @IBOutlet var quizTitle: UILabel!
    @IBOutlet var quizImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
