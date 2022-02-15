//
//  TableViewController.swift
//  Chat
//
//  Created by Jordan Eckhardt on 2022-02-14.
//

import UIKit

class TableViewController: UITableViewController {
//	@IBOutlet var tableView: UITableView!
	
	private var data = [(String, UIColor)]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem

		tableView.estimatedRowHeight = UITableView.automaticDimension
		tableView.rowHeight = UITableView.automaticDimension
		tableView.register(UINib(nibName: "TableViewCell1", bundle: nil), forCellReuseIdentifier: "TableViewCell1")
		for _ in 0..<10 {
			addRandomData()
		}
		tableView.reloadData()

		Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
			DispatchQueue.main.async {
				let distanceFromBottom = self.tableView.contentSize.height - self.tableView.frame.size.height - self.tableView.contentOffset.y
				self.addRandomData()
				let end = IndexPath(row: self.data.count - 1, section: 0)
				self.tableView.insertRows(at: [end], with: .automatic)
				if distanceFromBottom < 40 {
					self.tableView.scrollToRow(at: end, at: .bottom, animated: true)
				}
			}
		}
    }

	func addRandomData() {
		var string = "Message \(data.count)"
		for j in 0..<Int.random(in: 0..<10) {
			string += "\n\(j + 1)"
		}
		let color = UIColor( red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1.0)
		data.append((string, color))
	}


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return data.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell1", for: indexPath) as! TableViewCell1
		let data = data[indexPath.row]
		cell.label.text = data.0
		cell.contentView.backgroundColor = data.1
        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

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
