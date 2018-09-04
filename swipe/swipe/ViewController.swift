//
//  ViewController.swift
//  swipe
//
//  Created by unkown on 9/3/18.
//  Copyright © 2018 dotunderscoredot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var contentViewBounds = 0;
    var cg:CGRect = CGRect();
    var imgArr = [UIImageView]();
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //end goal is putting an image view as child
    }

    override func viewDidAppear(_ animated: Bool) {
        getImages()
        appendToScrollView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
    }
    
    func getImages(){
        for x in 0...2{
            imgArr.append(UIImageView.init(image: UIImage(named: "icon\(x)")));
        }
    }
    func setDistances(element: Int){
        //set size of icon
        let variableSize = scrollView.frame.width / 1.4;
        let size1 = CGSize(width:variableSize , height: variableSize)
        
        //set layout of icon
        let equation = scrollView.frame.width/2 - size1.width/2 + (scrollView.frame.width * CGFloat(element));
        let cgr = CGRect(x: equation, y: view.frame.height/2 - size1.height/2, width: size1.width , height: size1.height);
        cg = cgr;
        //set content bounds
        contentViewBounds += Int(scrollView.frame.width);
    }
    func appendToScrollView(){
        var count = 0
        for x in imgArr{
            
            setDistances(element: count);
            x.frame = cg;
            scrollView.addSubview(x);
            count += 1;
        }
        scrollView.contentSize = CGSize(width: contentViewBounds + Int(scrollView.frame.width / 2), height: Int(view.frame.height));
        scrollView.clipsToBounds = false;
       
    }
    
    @IBAction func didSwipe(_ sender: UISwipeGestureRecognizer) {
        print("osender")
    }
    
    
}
