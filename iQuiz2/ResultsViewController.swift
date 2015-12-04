//
//  ResultsViewController.swift
//  iQuiz2
//
//  Created by Kevin Ly on 11/30/15.
//  Copyright © 2015 Kevin Ly. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var correctAnswer: UILabel!
    @IBOutlet var userAnswer: UILabel!
    @IBOutlet var endButton: UIButton!
    @IBOutlet var currentScore: UILabel!
    
    var correct = false
    var questionIndex = 0
    var score = 0
    var questions = [Question]()
    var answerSelected = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.navigationItem.hidesBackButton = true
        
        if correct {
            resultLabel?.text = "CORRECT"
            userAnswer.textColor = correctAnswer.textColor
        } else {
            resultLabel?.text = "INCORRECT"
        }
        
        correctAnswer?.text = self.questions[questionIndex].correctAnswer
        userAnswer?.text = answerSelected
        currentScore?.text = "\(score) / \(questionIndex + 1)"
        
        if questionIndex != 4 {
            endButton.hidden = true
        } else {
            endButton.hidden = false
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier != "endSegue" {
            let questionController = segue.destinationViewController as! QuestionViewController
            
            questionController.questionIndex = self.questionIndex + 1
            questionController.questions = self.questions
            questionController.score = self.score
        } else {
            let finishedController = segue.destinationViewController as! FinishedViewController
            
            finishedController.questionIndex = self.questionIndex
            finishedController.score = self.score
        }
    }
}
