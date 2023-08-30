//
//  NetwokingManager.swift
//  H4XOR News
//
//  Created by Hodaya Rosenberg on 11/22/22.
//

import UIKit
class NetworkingManager:ObservableObject{
    let consts = K() // an instance of consts struct (where url is contatined)
    @Published var posts = [Post]()
    func fetchData(){
        //CREATE URL
        
        if let url=URL(string : self.consts.newsUrl){
            //CREATE SESSION
            let session = URLSession(configuration: .default)
            //CREATE TASK
            let task=session.dataTask(with: url) { data, response, error in
                if let e = error{
                    print(e.localizedDescription)
                    return
                }
                //GIVE DATA A TASK AND DECODE API
                if let safeData=data{
                    //SET DECODER
                    let decoder=JSONDecoder()
                    do{
                        
                        let results=try decoder.decode(PostData.self, from: safeData)
                        //DO FROM MAIN THREAD
                        DispatchQueue.main.async {
                            self.posts=results.hits
                        }
                    }catch{
                        print(error.localizedDescription)
                    }
                }
            }
            //START TASK
            task.resume()
        }
     //CLOSE FUNC
    }
    
  
    }
    

