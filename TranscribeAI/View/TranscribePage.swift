//
//  TranscribePage.swift
//  TranscribeAI
//
//  Created by ABPersonal on 16/01/23.
//

import SwiftUI
import AVFoundation

struct TranscriptionPage: View {
    @State private var text: String = "adsfasdffsd"
    @State private var recording = false
    @State private var audioRecorder: AVAudioRecorder?
    @State private var audioPlayer: AVAudioPlayer?
    
    
    var body: some View {
        ZStack {
            Color.purple
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                VStack {
                    Button(action: {
                        if self.recording {
                            self.stopRecording()
                        } else {
                            self.startRecording()
                        }
                    }) {
                        Text(recording ? "Stop Recording" : "Start Recording")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(recording ? Color.red : Color.green)
                            .cornerRadius(10)
                    }
                    .padding()
                }
                
                ZStack{
                    Color.white
                                    .ignoresSafeArea()
                    
                    
                    
                    Text(text)
                        .foregroundColor(.black)
                        .frame(minHeight: 100, maxHeight: .infinity)
                        .padding()
                }
                .frame(width: 200, height: 100,
                       alignment: .center)
                
                
                Spacer()
                
                Button(action: {
                    // Perform transcription action
                    self.playRecording()
                }) {
                    Text("Transcribe")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(40)
                }
                .padding()
            }
        }
    }
    
    private func startRecording() {
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.record, mode: .default)
            try audioSession.setActive(true)
            
            let settings = [
                AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
                AVSampleRateKey: 12000,
                AVNumberOfChannelsKey: 1,
                AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
            ]
            
            audioRecorder = try AVAudioRecorder(url: getFileURL(), settings: settings)
            audioRecorder?.record()
            recording = true
            text = "auido is recording"
        } catch {
            print("Error starting recording: \(error)")
        }
    }
    
    private func stopRecording() {
        audioRecorder?.stop()
        recording = false
        text = "auido has been recorded"
    }
    
    private func getFileURL() -> URL {
        let fileManager = FileManager.default
        let dirPath = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let fileURL = dirPath[0].appendingPathComponent("recording.m4a")
        return fileURL
    }
    
    private func playRecording(){
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: getFileURL())
                audioPlayer?.play()
                text = "audio is getting played"
            } catch {
                print("Error playing recording: \(error)")
            }
    }
}


struct TranscriptionPage_Previews: PreviewProvider {
    static var previews: some View {
        TranscriptionPage()
    }
}


