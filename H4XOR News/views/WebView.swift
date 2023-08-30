//
//  WebView.swift
//  H4XOR News
//
//  Created by Hodaya Rosenberg on 11/23/22.
//

import SwiftUI
import WebKit
//WHAT THE USER SEES WHEN HE PRESSED THE NAVIGATION LINK , A WEBVIEW AND THE CONTENT LOADS
struct WebView:UIViewRepresentable{
    
    let urlString:String?
    //MAKES UIVIEWTYPE:WKWEBVIEW Context=UIViewRepresentableContext<webview>
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    //
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString=urlString{
            if let url = URL(string: safeString){
                let request = URLRequest(url: url)
                           uiView.load(request)
            }
        }
    }
    
    
}
