//
//  WKWebView.swift
//  SwiftUI3rdComponent
//
//  Created by ke on 2024/6/2.
//

import SwiftUI
import WebKit
import Ink

struct WebViewComponent: View {
    @State var htmlContent: String = ""
    
    var body: some View {
        WebView(html: htmlContent)
            .onAppear() {
                htmlContent = ParseContent().parse()
            }
    }
}

struct WebView : UIViewRepresentable {
    var html: String
    
    func makeUIView(context: Context) -> WKWebView  {
        return WKWebView()
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        webView.loadHTMLString(html, baseURL: nil)
    }
}

class ParseContent {
    var markdown = """
    # An exhibit of Markdown
    
    This note demonstrates some of what [Markdown][1] is capable of doing.
    
    *Note: Feel free to play with this page. Unlike regular notes, this doesn't automatically save itself.*
    
    ## Basic formatting
    
    Paragraphs can be written like so. A paragraph is the basic block of Markdown. A paragraph is what text will turn into when there is no reason it should become anything else.
    
    Paragraphs must be separated by a blank line. Basic formatting of *italics* and **bold** is supported. This *can be **nested** like* so.
    
    ## Lists
    
    ### Ordered list
    
    1. Item 1
    2. A second item
    3. Number 3
    4. Ⅳ
    
    *Note: the fourth item uses the Unicode character for [Roman numeral four][2].*
    
    ### Unordered list
    
    * An item
    * Another item
    * Yet another item
    * And there's more...
    
    ## Paragraph modifiers
    
    ### Code block
    
        `Code blocks are very useful for developers and other people who look at code or other things that are written in plain text. As you can see, it uses a fixed-width font.`
    
    You can also make `inline code` to add code into other things.
    
    ### Quote
    
    > Here is a quote. What this is should be self explanatory. Quotes are automatically indented when they are used.
    """
    
    func parse() ->String {
        let parser = MarkdownParser()
        let html = parser.html(from: markdown)
        
        let htmlStart = "<div style=\"padding: 40px; font-family: -apple-system,BlinkMacSystemFont,Segoe UI,Roboto,Oxygen,Ubuntu,Cantarell,Open Sans,Helvetica Neue,sans-serif\">"
        let htmlEnd = "</div>"
        
        return htmlStart + html + htmlEnd
        
    }
    
}



#Preview {
    WebViewComponent()
}
