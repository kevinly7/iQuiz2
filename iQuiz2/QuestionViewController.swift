//
//  QuestionViewController.swift
//  iQuiz2
//
//  Created by Kevin Ly on 11/23/15.
//  Copyright © 2015 Kevin Ly. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var questionText: UILabel!
    var questions = [Question]()
    var answerIndex = 0
    var questionIndex = 0
    var correct = false
    var score = 0
    var answerSelected = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        questionText.text = self.questions[questionIndex].question
        let cell = tableView.dequeueReusableCellWithIdentifier("answerCell") as! AnswerViewCell
        cell.answerText.text = self.questions[questionIndex].answers[answerIndex]
        answerIndex++
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        answerSelected = self.questions[questionIndex].answers[indexPath.row]
        if answerSelected == self.questions[questionIndex].correctAnswer {
            self.correct = true
        } else {
            self.correct = false
        }
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let resultController = segue.destinationViewController as! ResultsViewController
        
        if correct {
            resultController.correct = true
            score++
        } else {
            resultController.correct = false
        }
        resultController.questionIndex = self.questionIndex
        resultController.score = self.score
        resultController.questions = self.questions
        resultController.answerSelected = self.answerSelected
    }
}
