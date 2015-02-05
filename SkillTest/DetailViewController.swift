//
//  DetailViewController.swift
//  SkillTest
//
//  Created by 李昱賢 on 2015/2/5.
//  Copyright (c) 2015年 李昱賢. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var NewLevel: UITextField!
    @IBOutlet weak var NewPrecentage: UITextField!
    @IBOutlet weak var UpdateButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func update(sender: AnyObject) {
        var NewItem = skill(level: NewLevel.text, percentage:NewPrecentage.text)
        array.append(NewItem)
        NSNotificationCenter.defaultCenter().postNotificationName("load", object: nil)
        self.dismissViewControllerAnimated(true, completion: nil)
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
