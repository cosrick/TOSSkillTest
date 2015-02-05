//
//  ViewController.swift
//  SkillTest
//
//  Created by 李昱賢 on 2015/2/3.
//  Copyright (c) 2015年 李昱賢. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    
    
    @IBOutlet weak var TextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var wanted = segue.destinationViewController as TableViewController
            wanted.currentTarget = TextField.text
        
    }


}

