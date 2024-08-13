import SwiftUI
import WebKit

struct ArticleDetailView: View {
    let urlString: String
    
    var body: some View {
        WebView(url: URL(string: urlString)!)
            .navigationTitle("Details")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(Color.header, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
    }
}

#Preview {
    ArticleDetailView(urlString: "https://www.google.com")
}
