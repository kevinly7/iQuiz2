//
//  FinishedViewController.swift
//  iQuiz2
//
//  Created by Kevin Ly on 12/1/15.
//  Copyright © 2015 Kevin Ly. All rights reserved.
//

import UIKit

class FinishedViewController: UIViewController {

    @IBOutlet var finalMessage: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    
    var questionIndex = 0
    var score = 0
    var percentCorrect = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        percentCorrect = Double(score)/Double(questionIndex)
        if percentCorrect >= 0.5 {
            finalMessage.text = "GREAT JOB!"
        } else {
            finalMessage.text = " YOU SUCK!"
        }
        
        scoreLabel?.text = "\(score) / \(questionIndex + 1)"
        self.navigationItem.hidesBackButton = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let quizController = segue.destinationViewController as! QuizTableViewController
        quizController.navigationItem.hidesBackButton = true
        quizController.navigationItem.title = "Pick a Quiz!"
    }
}
