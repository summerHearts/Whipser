//
//  ViewController.swift
//  Whisper
//
//  Created by summerhearts@163.com on 11/27/2023.
//  Copyright (c) 2023 summerhearts@163.com. All rights reserved.
//

import UIKit
import Whisper

class ViewController: UIViewController {
    
    var jfkAudioFrames: [Float]? {

        let audioURL = Bundle.main.url(forResource: "中国改革开放测试音频", withExtension: "wav") ?? URL.init(fileURLWithPath: "")
        
           let data = try! Data(contentsOf: audioURL)
           return stride(from: 44, to: data.count, by: 2).map {
               return data[$0..<$0 + 2].withUnsafeBytes {
                   let short = Int16(littleEndian: $0.load(as: Int16.self))
                   return max(-1.0, min(Float(short) / 32768.0, 1.0))
               }
           }
       }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.global(qos: .userInitiated).async {
            
            let modelURL = Bundle.main.url(forResource: "ggml-model-whisper-base-q5_1", withExtension: "bin") ?? URL.init(fileURLWithPath: "")
            let whisper = Whisper(fromFileURL: modelURL)
            let initial_prompt = "以下是普通话的句子"
            whisper.params.initial_prompt = (initial_prompt as NSString).utf8String
            whisper.params.language = WhisperLanguage.chinese
            if let frames = self.jfkAudioFrames {
                DispatchQueue.main.async {
                    whisper.transcribe(audioFrames: frames) { result in
                        print("\(result)")
                    }
                }
             }
        }
      
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

