//
//  ViewController.swift
//  Colors
//
//  Created by Austin Terranova on 3/14/18.
//  Copyright © 2018 Austin Terranova. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    //let colors: [String] = ["red","orange","yellow","green","blue","purple","brown"]
    var colors =         [Color(name: "red", uiColor: UIColor.red),
                           Color(name: "orange", uiColor: UIColor.orange),
                           Color(name: "yellow", uiColor: UIColor.yellow),
                           Color(name: "green", uiColor: UIColor.green),
                           Color(name: "blue", uiColor: UIColor.blue),
                           Color(name: "purple", uiColor: UIColor.purple),
                           Color(name: "brown", uiColor: UIColor.brown)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView (_ tableView: UITableView, numberOfRowsInSection
        section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let color = self.colors[indexPath.row].name
        
        cell.textLabel?.text = color
        cell.backgroundColor = colors[indexPath.row].uiColor
        
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  let destination = segue.destination as? ColorDetailViewController,
            let row = tableView.indexPathForSelectedRow?.row{
            destination.color = colors[row]
            
        }
        
    }

}

