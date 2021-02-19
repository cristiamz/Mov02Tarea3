//
//  PlayerViewController.swift
//  storyboards
//
//  Created by Cristian Zuniga on 18/2/21.
//

import UIKit

class PlayerViewController: UITableViewController {
    
    @IBOutlet weak var PlayerList:UITableView!
    
    var players = ["Cristian","Maria","Juan","Helena"]
    var games = ["Exploding Kittens","Pokemon","Carcassonne","Ticket to Ride"]

    override func viewDidLoad() {
        super.viewDidLoad()

        PlayerList.dataSource = self
        PlayerList.delegate = self
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return players.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId")
        
        let playerName = cell?.contentView.viewWithTag(1001) as! UILabel
        playerName.text = players[indexPath.row] //"Cristian \(indexPath.row + 1)"
        
        let gameName = cell?.contentView.viewWithTag(1002) as! UILabel
        gameName.text = games[indexPath.row] //"Cristian \(indexPath.row + 1)"
        
        return cell!
    }

    

    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

   
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            players.remove(at: indexPath.item)
            games.remove(at: indexPath.item)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
            players.insert("playerObjTemp", at: indexPath.item)
            games.insert("gamesObjTemp", at: indexPath.item)
        }
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

        let playerObjTemp = players[fromIndexPath.item]
        players.remove(at: fromIndexPath.item)
        players.insert(playerObjTemp, at: to.item)
        let gameObjTemp = games[fromIndexPath.item]
        games.remove(at: fromIndexPath.item)
        games.insert(gameObjTemp, at: to.item)
    }
    

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
