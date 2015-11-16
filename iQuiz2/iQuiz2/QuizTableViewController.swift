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
    let quizImages = [UIImage(named: "math"), UIImage(named: "science"), UIImage(named: "art")]
    
    let MathQuiz = [Question(question: "2+2 = ?", answers: ["4", "5", "6", "7"], correctAnswer: "4"), Question(question: "2+3 = ?", answers: ["5", "6", "7", "8"], correctAnswer: "5")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
        cell.quizImage.image = self.quizImages[indexPath.row]

        // Configure the cell...

        return cell
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */
    
    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle = .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */
    
    /*
    // Override to support rearranging the table view.
    */
}
