//
//  TableViewController.swift
//  SkillTest
//
//  Created by 李昱賢 on 2015/2/5.
//  Copyright (c) 2015年 李昱賢. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var LevelList: UITableView!
    var Need = [16,19,50,75,300,500,1800,2500,3000,3000,3000,3000,3000,3000,3000]
    var Accumulated = [0,16,35,85,160,460,960,2760,5260,8260,11260,14260,17260,20260,23260]
    var currentTarget: String?
    var final_array = [skill]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Target is " + currentTarget!
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "loadList:",name:"load", object: nil)
        /*var newdata = skill(level: "2", percentage: "30%")
        array.append(newdata)*/
        // Do any additional setup after loading the view.
        /*let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "Insert:")
        self.navigationItem.rightBarButtonItem = addButton*/
    }
    func loadList(notification: NSNotification){
        self.LevelList.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("list") as UITableViewCell
        if indexPath.section == 0{
            cell.textLabel?.text = "小怪 : " + array[indexPath.row].level + " - " + array[indexPath.row].percentage + "%"
        }else{
            var Now = 0
            var temp = 0
            var Target = Accumulated[currentTarget!.toInt()! - 1 ]
            for index in 1...array.count{
                Now += Accumulated[array[index-1].level.toInt()! - 1 ]
                Now += (Need[array[index-1].level.toInt()! - 1] * array[index-1].percentage.toInt()! ) / 100
            }
            var eachdelta = (Target - Now) / array.count
            var final_level = 0
            var final_percentage = 0
            for index in 1...array.count{
                temp += Accumulated[array[index-1].level.toInt()! - 1 ]
                temp += (Need[array[index-1].level.toInt()! - 1] * array[index-1].percentage.toInt()! ) / 100
                temp += eachdelta
                for index2 in 0...14{
                    if temp < Accumulated[index2]{
                        final_level = index2
                        break
                    }
                }
                final_percentage = (((temp - Accumulated[final_level-1] )*100 / Need[final_level-1]))
                var NewItem = skill(level: String(final_level), percentage: String(final_percentage))
                if final_array.count == 0{
                    final_array.append(NewItem)
                }else if index <= (final_array.count) {
                    final_array[index-1] = NewItem
                }else{
                    final_array.append(NewItem)
                }
                temp = 0
                final_level = 0
                final_percentage = 0
            }
            
            cell.textLabel?.text = "小怪 : " + final_array[indexPath.row].level + " - " + final_array[indexPath.row].percentage + "%"
        }
        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return "現在等級 - ％數"
        }else{
            return "最終等級 - ％數"
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
