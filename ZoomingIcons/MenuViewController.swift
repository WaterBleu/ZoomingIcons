    //
//  MenuViewController.swift
//  ZoomingIcons
//
//  Created by Jeff Huang on 2015-08-06.
//  Copyright (c) 2015 Jeff Huang. All rights reserved.
//

import UIKit

let reuseIdentifier = "Cell"

class MenuViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    var objects:[[Icon]] = Array(count:2, repeatedValue:[Icon]())
    var animator:UIDynamicAnimator!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        setDataSource()
        collectionView?.contentInset.top = CGFloat(UIScreen.mainScreen().bounds.size.height/4)
        animator = UIDynamicAnimator(referenceView: view)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        self.collectionView?.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setDataSource(){
        var icon = Icon(image: UIImage(named: "icon-twitter")!, imageTitle:"Twitter", imageDescription: "description for twitter", imageBackgroundColor: UIColor(red:0.00, green:0.67, blue:0.93, alpha:1.0))
        objects[0].append(icon)
        icon = Icon(image: UIImage(named: "icon-facebook")!, imageTitle:"Facebook", imageDescription: "description for facebook", imageBackgroundColor: UIColor(red:0.23, green:0.35, blue:0.60, alpha:1.0))
        objects[0].append(icon)
        icon = Icon(image: UIImage(named: "icon-youtube")!, imageTitle:"Youtube", imageDescription: "description for youtube", imageBackgroundColor: UIColor(red:0.73, green:0.00, blue:0.00, alpha:1.0))
        objects[1].append(icon)
        icon = Icon(image: UIImage(named: "icon-vimeo")!, imageTitle:"Vimeo", imageDescription: "description for vine", imageBackgroundColor: UIColor(red:0.67, green:0.83, blue:0.31, alpha:1.0))
        objects[1].append(icon)
        icon = Icon(image: UIImage(named: "icon-instagram")!, imageTitle:"Instagram", imageDescription: "description for instagram", imageBackgroundColor: UIColor(red:0.32, green:0.50, blue:0.64, alpha:1.0))
        objects[1].append(icon)
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        //#warning Incomplete method implementation -- Return the number of sections
        return objects.count
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //#warning Incomplete method implementation -- Return the number of items in the section
        return objects[section].count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! IconCollectionViewCell
        let icon = objects[indexPath.section][indexPath.item]
        cell.imageView.image = icon.image
        cell.viewColor.backgroundColor = icon.imageBackgroundColor
        cell.layer.cornerRadius = 39
        // Configure the cell
    
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let gravityBehaviour = UIGravityBehavior(items: collectionView.visibleCells())
        animator.addBehavior(gravityBehaviour)
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        var dVC = mainStoryboard.instantiateViewControllerWithIdentifier("DetailedViewController") as! DetailedViewController
        let icon = objects[indexPath.section][indexPath.item] as Icon
        dVC.view.backgroundColor = icon.imageBackgroundColor
        dVC.imageView.image = icon.image
        dVC.imageTitle.text = icon.imageTitle
        dVC.imageSummary.text = icon.imageDescription
        
        self.navigationController?.pushViewController(dVC, animated: true)
        
        UIView.animateWithDuration(0.8, animations: { () -> Void in
            collectionView.alpha = 0
            }) { (success) -> Void in
                collectionView.alpha = 1
                self.animator.removeAllBehaviors()
        }
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        let numOfItem = collectionView.numberOfItemsInSection(section)
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        let collectionViewWidth = collectionView.bounds.width
        let totalContentWidth = (layout.itemSize.width + layout.minimumInteritemSpacing) * CGFloat(numOfItem)
        var margin = (collectionViewWidth - CGFloat(totalContentWidth))/2
        
        var inset = UIEdgeInsets(top: 0, left: margin, bottom: 10, right: margin)
        return inset
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
