//
//  ViewController.swift
//  MemeMaker
//
//  Created by Evelin Merino-Torres on 12/14/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var topSegmentedControl: UISegmentedControl!
    @IBOutlet weak var bottomSegmentedControl: UISegmentedControl!
    @IBOutlet weak var topCaptionLabel: UILabel!
    @IBOutlet weak var bottomCaptionLabel: UILabel!
    
    var topChoices: [CaptionOption] = [CaptionOption(emoji: "🖤", caption: "You know what's cool?"), CaptionOption(emoji: "💥", caption: "You know what makes me mad?"), CaptionOption(emoji: "💕", caption: "You know what I love?")]
    
    var bottomChoices:[CaptionOption] = [CaptionOption(emoji: "🐱", caption: "Cats wearing hats"), CaptionOption(emoji: "🐕", caption: "Dogs carrying logs"), CaptionOption(emoji: "🐒", caption: "Monkeys being funky")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topSegmentedControl.removeAllSegments()
        bottomSegmentedControl.removeAllSegments()

        for choice in topChoices {
            topSegmentedControl.insertSegment(withTitle: choice.emoji,
                                             at: topChoices.count,
                                             animated: false)
        }
        
        for choice in bottomChoices {
            bottomSegmentedControl.insertSegment(withTitle: choice.emoji,
                                             at: bottomChoices.count,
                                             animated: false)
        }
        topSegmentedControl.selectedSegmentIndex = 0
        
        bottomSegmentedControl.selectedSegmentIndex = 0

        // Do any additional setup after loading the view.
    }
    func updateCaptions(){
        let topIndex = topSegmentedControl.selectedSegmentIndex
        topCaptionLabel.text = topChoices[topIndex].caption
        
        let bottomIndex = bottomSegmentedControl.selectedSegmentIndex
        bottomCaptionLabel.text = bottomChoices[bottomIndex].caption
    }
    
    @IBAction func options(_ sender: UISegmentedControl) {
        
    }
    @IBAction func dragTopLabel(_ sender: UIPanGestureRecognizer) {
        if sender.state == .changed {
            topCaptionLabel.center = sender.location(in: view)
        }
    }
    
    @IBAction func dragBottomLabel(_ sender: UIPanGestureRecognizer) {
        if sender.state == .changed {
            bottomCaptionLabel.center = sender.location(in: view)
        }

    }
    
}

