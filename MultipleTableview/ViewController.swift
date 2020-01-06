//
//  ViewController.swift
//  MultipleTableview
//
//  Created by Sabbir Hossain on 1/6/20.
//  Copyright © 2020 Sabbir Hossain. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let teams : [String] = ["Arsenal","Chelse","Manchester"]

    let arsenalplayers : [String] = ["Sabbir","Hossain","Sayef","Developer"]
    
    let chelseplayers : [String] = ["Oscar","Diago","Kaka","Messi"]
    
    let manchesterplayers : [String] = ["Cristiano","Ronaldo","Ozil","Neymer"]
    
    
    var teamReference : String = "Arsenal"
    
    let cellIdentifier : String = "cell"
    
    var numberOfTeams : Int = 0
    
    var numberOfPlayers : Int = 0

    @IBOutlet weak var table1: UITableView!
    @IBOutlet weak var table2: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        table1.delegate = self
        table2.delegate = self
        table2.dataSource = self
        table2.dataSource = self
        
        //Create Dictionary
        //var myDictionary = ["A" : ["Apple","And"],
                            //"B" : ["Bubble","Blow"],
                            //"C" : ["Circle","Cup"],
                            //"D" : ["Do","Done"],
                            //"E" : ["Eagle","End"]]
    //print(myDictionary)
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    if (tableView.tag == 1)
    {
        numberOfTeams = teams.count
        return numberOfTeams
    }
        else if (tableView.tag == 2)
        
    {
        if (teamReference == "Arsenal")
        
        {
            numberOfPlayers = arsenalplayers.count
        }
        else if (teamReference == "Chelse")
        {
           numberOfPlayers = chelseplayers.count
        }
        else if (teamReference == "Manchester")
        {
            numberOfPlayers = manchesterplayers.count
        }
        return numberOfPlayers
}
   
     else
    {
    return 0
    }
}
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as UITableViewCell
        
        if (tableView.tag == 1)
        
        {
            cell.textLabel?.text = teams[indexPath.row]
        }
        
        else if (tableView.tag == 2)
        {
            if (teamReference == "Arsenal")
            {
                cell.textLabel?.text = arsenalplayers[indexPath.row]
            }
            
            else if (teamReference == "Chelse")
            {
                cell.textLabel?.text = chelseplayers[indexPath.row]
            }
            
            else if (teamReference == "Manchester")
            {
                cell.textLabel?.text = manchesterplayers[indexPath.row]
            }
        }
    
        return cell
    }
    
    
    private func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath){
        
        if (tableView.tag == 1)
        
        {
            teamReference = teams[indexPath.row]
        }
        
        table2.reloadData()
    }
    
}
