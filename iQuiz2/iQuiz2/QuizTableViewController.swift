//
//  QuizTableViewController.swift
//  iQuiz2
//
//  Created by Kevin Ly on 11/15/15.
//  Copyright © 2015 Kevin Ly. All rights reserved.
//

import UIKit

struct Question {
    var question : String
    var answers : [String]
    var correctAnswer : String
}


class QuizTableViewController: UITableViewController {
    
    let quizNames = ["Math", "Science", "Art"]
    let quizSubNames = ["Math Sub", "Science Sub", "Art Sub"]
    let quizImages = [UIImage(named: "math"), UIImage(named: "science"), UIImage(named: "art")]
    
    let mathQuiz = [Question(question: "2+2 = ?", answers: ["4", "5", "6", "7"], correctAnswer: "4"), Question(question: "2+3 = ?", answers: ["5", "6", "7", "8"], correctAnswer: "5")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.navigationController?.navigationBar.topItem?.title = "Pick a Quiz!"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated/
    }
    
    // MARK: - The view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.quizNames.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("quizCell", forIndexPath: indexPath) as! QuizCell
        
        cell.quizTitle.text = self.quizNames[indexPath.row]
        cell.quizSubtitle.text = self.quizSubNames[indexPath.row]
        cell.quizImage.image = self.quizImages[indexPath.row]

        // Configure the cell...

        return cell
    }
    
    // MARK: Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let cell = sender as! QuizCell
        let questionController = segue.destinationViewController as! QuestionViewController
        
        switch cell.quizTitle.text! {
            case "Math":
                questionController.questions = self.mathQuiz
                questionController.navigationItem.title = "Math Quiz"
            case "Science":
                questionController.questions = self.mathQuiz
                questionController.navigationItem.title = "Science Quiz"
            default:
                questionController.questions = self.mathQuiz
                questionController.navigationItem.title = "Art Quiz"
        }
    }
}
