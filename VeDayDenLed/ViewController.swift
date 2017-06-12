//
//  ViewController.swift
//  VeDayDenLed
//
//  Created by hungtran on 6/9/17.
//  Copyright © 2017 hungtran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var n:Int!
    var _margin: CGFloat = 40
    var _marginCot: CGFloat = 100
    

    @IBOutlet weak var tf_So: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
    }
    
    @IBAction func btn_Draw(_ sender: Any) {
        resetDraw()
        drawBall()
        
    }
    
    
    
    func drawBall()  {
        n = Int(tf_So.text!)!
        var count = 0
        
        for index in 0..<n {
            for indexCot in 0..<n {
                count = count + 1
                
                let image = UIImage(named: "green")                         //Khởi tạo ảnh
                let ball = UIImageView(image: image)                        //Khởi tạo biến ball có dạng ImageView
                ball.tag = 50 + count                                       //Tạo tag cho biến ball để reset
                ball.center = CGPoint(x: _margin + CGFloat(index) * spaceBetweenBallHang(), y: CGFloat(indexCot) * spaceBetweenBallCot() + _marginCot)                  //set toạ độ hiển thị cho biến "ball",chú ý phải ép index về CGFloat
                self.view.addSubview(ball)
                
            }
        }
        
    }
    func spaceBetweenBallHang() ->CGFloat  {                                    //func tạo khoảng cách giữa các hàng
        let space = (self.view.bounds.size.width - 2*_margin)/CGFloat(n-1)          //Chú ý set thuộc tính Trục with or height cho biến "space"
        return space
    }
    
    func spaceBetweenBallCot() ->CGFloat  {                                     //func tạo khoảng cách giữa các cột
        let space = (self.view.bounds.size.height - 2*_marginCot)/CGFloat(n-1)      //Chú ý set thuộc tính Trục with or height cho biến "space"
        return space
    }

    func resetDraw()  {                                                         
        let rsDraw = self.view.subviews
        for ball in rsDraw {
            if ball.tag >= 50 {
                ball.removeFromSuperview()                                      //remove màn hình cũ đi
            }else{
                print("New")
            }
        }
        
    }
    
    
    
    
    
}

