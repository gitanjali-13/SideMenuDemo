//
//  ViewController.swift
//  SideMenuDemo
//
//  Created by Admin on 12/01/23.
//

import SideMenu
import UIKit


class ViewController: UIViewController {

    var menu : SideMenuNavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menu = SideMenuNavigationController(rootViewController: MenuListControoler())
        menu?.leftSide = true
        menu?.setNavigationBarHidden(true, animated: false)
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
//        navigationBar?.backgroundColor = .brown
    }
    @IBAction func didTapMenu() {
        
        present(menu!, animated: true)
    }
}
class MenuListControoler : UITableViewController {
    
    var items = ["first", "second", "third", "fouth"]
    var darkColor = UIColor(red: 22/255.0, green: 22/255.0, blue: 40/255.0, alpha: 1)
    override func viewDidLoad(){
       
        super.viewDidLoad()
        tableView.backgroundColor = darkColor
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = items[indexPath.row]
        cell.textLabel?.textColor = .white
        cell.backgroundColor = darkColor
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
