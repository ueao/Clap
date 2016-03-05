//
//  ViewController.swift
//  Clap
//
//  Created by Aoi Sakaue on 2016/02/11.
//  Copyright © 2016年 Aoi Sakaue. All rights reserved.
//

import UIKit

import AVFoundation


class ViewController: UIViewController {

    @IBOutlet var clapPickerView: UIPickerView!
    
    var audioPlayer : AVAudioPlayer!
    var soundCount : Int = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
//再生する音源のURLを作成
        let soundFilePath = NSBundle.mainBundle().pathForResource("clap",ofType: "wav")!
        

        let fileURL = NSURL (fileURLWithPath : soundFilePath)
        
        
        do{
            audioPlayer = try AVAudioPlayer(contentsOfURL: fileURL)
        }catch{
            print("音楽ファイルが読み込めませんでした")
        }
//                clapPickerView.delegate = self
//                clapPickerView.dataSource = self

    }
    
    @IBAction func playButton(){
        
        audioPlayer.numberOfLoops = soundCount
        audioPlayer.play()
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//いくつカテゴリーを持つか
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
        return 1
    }
//いくつ選択肢を作るか
    func pickerView(pickerView: UIPickerView,numberOfRowslnComponent component: Int) ->Int{
        return 10
    }
// 選択肢に何を表示していくか１
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int)->String? {
        return "\(row+1)回"
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        soundCount = row
    }
  
}

