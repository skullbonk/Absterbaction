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
        dataSource = self
        
        if let firstViewController = orderedAbstractionViews.first
        {
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }

        // Do any additional setup after loading the view.
    }
    
    //MARK:- Data stuff
    private lazy var orderedAbstractionViews : [UIViewController] =
    {
        return  [
            self.newAbsterbactionViewController(abstractionLevel: "Swift"),
            self.newAbsterbactionViewController(abstractionLevel: "Block"),
            self.newAbsterbactionViewController(abstractionLevel: "Byte"),
            self.newAbsterbactionViewController(abstractionLevel: "Binary"),
            self.newAbsterbactionViewController(abstractionLevel: "Gate")
        ]
    }()
    
    //MARK:- Helper thing to get view controllers
    private func newAbsterbactionViewController(abstractionLevel : String) -> UIViewController
    {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "\(abstractionLevel)Controller")
    }
    
    //MARK:- Datasource methods
    //// Swipe Left
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?
    {
        guard let viewControllerIndex = orderedAbstractionViews.index(of: viewController)
            else
        {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0
            else
        {
            return orderedAbstractionViews.last
        }
        
        guard orderedAbstractionViews.count > previousIndex
            else
        {
            return nil
        }
        
        return orderedAbstractionViews[previousIndex]
    }
    
    //// Swipe Right
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?
    {
        guard let viewControllerIndex = orderedAbstractionViews.index(of: viewController)
            else
        {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        
        guard nextIndex >= 0
            else
        {
            return nil
        }
        
        guard nextIndex < orderedAbstractionViews.count
            else
        {
            return orderedAbstractionViews.first
        }
        
        return orderedAbstractionViews[nextIndex]
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
