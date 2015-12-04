//
//  QuizTableViewController.swift
//  iQuiz2
//
//  Created by Kevin Ly on 11/23/15.
//  Copyright © 2015 Kevin Ly. All rights reserved.
//

import UIKit

struct Question {
    var question : String
    var answers : [String]
    var correctAnswer : String
}

class QuizTableViewController: UITableViewController {
    
    let quizTitles = ["Math", "Science", "Marvel"]
    let quizSubtitles = ["Test your aritmetic skills.", "All things science!", "How well do you know your super heroes?"]
    let quizIcons = [UIImage(named: "math"), UIImage(named: "science"), UIImage(named: "marvel")]
    
    let mathQuiz = [
        Question(question: "The teacher brought 20 cupcakes to school, but there were only 17 students in class. If each student had one cupcake, how many cupcakes were eaten?", answers: ["3", "2", "17", "20"], correctAnswer: "17"),
        Question(question: "Mr.Walters planted 28 tulip bulbs in his yard. His dog dug up 11 of the bulbs. How many tulips will bloom in the spring?", answers: ["17", "7", "10", "8"], correctAnswer: "17"),
        Question(question: "Sam got 21 pieces of candy while trick-or-treating. His mom said he had to finish them all in a week. How many should he eat to have an equal amount every day?", answers: ["1", "3", "5", "7"], correctAnswer: "3"),
        Question(question: "During summer vacation, Tim's brother earned money mowing the neighbor's lawn. He can mow 6 lawns an hour and has 21 laws left to mow. How long will it take him to finish?", answers: ["1.5", "2.5", "3.5", "4.5"], correctAnswer: "3.5"),
        Question(question: "Steve's mom bought him a 1 year swimming pass for $390. She decided to make monthly payments. How much would she need to pay per month?", answers: ["25.50", "27.75", "30.00", "32.50"], correctAnswer: "32.50")
    ]
    
    let scienceQuiz = [
        Question(question: "What is the atomic symbol for chlorine?", answers: ["C", "Ca", "Ch", "Cl"], correctAnswer: "Cl"),
        Question(question: "How many protons does Hydroden have", answers: ["1", "2", "10", "15"], correctAnswer: "1"),
        Question(question: "What is the most prevelant element found in air", answers: ["Oxygen", "Nitrogen", "Carbon Monoxide", "Carbon Dioxide"], correctAnswer: "Nitrogen"),
        Question(question: "Which of these elements are commonly enriched for nuclear power", answers: ["Einsteinium", "Americium", "Uranium", "Californium"], correctAnswer: "Uranium"),
        Question(question: "What is the rate of gravity on earth", answers: ["9.6 m/s/s", "9.7 m/s/s", "9.8 m/s/s", "9.9 m/s/s"], correctAnswer: "9.8 m/s/s")
    ]
    
    let marvelQuiz = [
        Question(question: "What is Peter Parker's middle name?", answers: ["William", "Benjamin", "Thomas", "Samuel"], correctAnswer: "Benjamin"),
        Question(question: "Which of these Marvel artifacts is not one of the six Infinity Stones as revealed in 'Guardians of the Galaxy'?", answers: ["The Aether", "The Tesseract", "The Arc Reactor", "The Orb"], correctAnswer: "The Arc Reactor"),
        Question(question: "Which of these heroes from 'Captain America: The First Avenger' returned as a villian in 'Captain America: The Winter Solider'?", answers: ["Nick Fury", "Bucky Barnes", "Peggy Carter", "Dr.Erskine"], correctAnswer: "Bucky Barnes"),
        Question(question: "This fictional metal is a component of both Captain America's shield and Iron Man's Arc Reactor. Name it.", answers: ["Mythril", "Vibranium", "Adamantium", "Energon"], correctAnswer: "Vibranium"),
        Question(question: "This is the name of the enormous space station where the collector housed his collections in 'Guradians of the Galaxy'.", answers: ["Knowhere", "Somewhere", "Anywhere", "Overthere"], correctAnswer: "Knowhere")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.navigationController?.navigationBar.topItem?.title = "Pick a Quiz!"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.quizTitles.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("quizCell", forIndexPath: indexPath) as! QuizViewCell

        cell.quizTitle.text = self.quizTitles[indexPath.row]
        cell.quizSubtitle.text = self.quizSubtitles[indexPath.row]
        cell.quizIcon.image = self.quizIcons[indexPath.row]

        return cell
    }
    
    
    @IBAction func settings(sender: UIButton) {
        let alertController = UIAlertController(title: "Settings", message: "Settings will go here", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let cell = sender as! QuizViewCell
        let questionController = segue.destinationViewController as! QuestionViewController
        
        switch cell.quizTitle.text! {
        case "Math":
            questionController.questions = self.mathQuiz
            questionController.navigationItem.title = "Math Quiz"
        case "Science":
            questionController.questions = self.scienceQuiz
            questionController.navigationItem.title = "Science Quiz"
        default:
            questionController.questions = self.marvelQuiz
            questionController.navigationItem.title = "Marvel Quiz"
        }
    }
}
