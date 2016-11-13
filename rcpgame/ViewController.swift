//
//  ViewController.swift
//  rcpgame
//
//  Created by 이동인 on 2016. 11. 13..
//  Copyright © 2016년 goplayzug. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {
    let randomSource = GKARC4RandomSource()

    @IBOutlet weak var computerImageView:UIImageView!
    
    @IBOutlet weak var playerImageView: UIImageView!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let angle:CGFloat = CGFloat((180.0 * M_PI) / 180.0)
        
        computerImageView.transform = CGAffineTransform(rotationAngle: angle)
        
    }
    @IBAction func tabStart() {
        
        computerImageView.image = UIImage(named: "rock.png")
    playerImageView.image = UIImage(named: "rock.png")
        
        messageLabel.text = "가위 바위..."
        
    }
    
    
    @IBAction func tapScissors() {
        playerImageView.image=UIImage(named: "siccors")
        doComputer(player: 0)
    }
    
    
    @IBAction func tapRock() {
        playerImageView.image = UIImage(named: "rock.png")
        doComputer(player: 1)
    }
    
    
    @IBAction func tapPaper() {
        playerImageView.image = UIImage(named : "paper.png")
        doComputer(player : 2)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func doComputer(player:Int) {
        let computer = randomSource.nextInt(upperBound : 3)
        
        var msg = ""
        
        switch computer {
            
        case 0:
            //가위 부분 입니다
            computerImageView.image = UIImage(named : "siccors.png")
            switch player {
            case 0:
                msg = "비겼어요!"
                
            case 1:
                msg = "이겼어요!"
            case 2:
                msg = "졌어요ㅠㅁㅠ.."
                
            default :
                break
                
            }
            
            
            
        case 1:
            //바위 부분 입니다.
            computerImageView.image = UIImage(named: "rock.png")
            switch player {
                
                
            case 0 :
                msg = "졌어요"
            case 1 :
                msg = "비겼어요"
            case 2 :
                msg = "이겼어요"
            default:
                break
            }
            
        case 2:
            //보 부분 입니다.
            computerImageView.image = UIImage(named : "paper.png")
            
            switch player {
            case 0:
                msg = "이겼어요"
            case 1 :
                msg = "졌어요"
            case 2 :
                msg = "비겼어요"
            default:
                break
            }
            
        default :
            break
            
            
        }
        
        messageLabel.text = msg
        
    }


}

