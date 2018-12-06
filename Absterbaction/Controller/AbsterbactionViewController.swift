//
//  AbsterbactionViewController.swift
//  Absterbaction
//
//  Created by Fairbanks, Reagan on 12/6/18.
//  Copyright © 2018 CTEC. All rights reserved.
//

import UIKit

public class AbsterbactionViewController: UIPageViewController, UIPageViewControllerDataSource
{

    public override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK:- Data stuff
    private lazy var orderedAbsterbactionViews : [UIViewController] =
    {
        return  [
            self.newAbsterbactionViewController(abstractionLevel: "Swift"),
            self.newAbsterbactionViewController(abstractionLevel: "Block"),
            self.newAbsterbactionViewController(abstractionLevel: "Byte"),
            self.newAbsterbactionViewController(abstractionLevel: "Binary"),
            self.newAbsterbactionViewController(abstractionLevel: "Logic")
        ]
    }()
    
    //MARK: Helper thing to get view controllers
    private func newAbsterbactionViewController(abstractionLevel : String) -> UIViewController
    {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "\(abstractionLevel)Controller")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
