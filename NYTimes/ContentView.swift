import SwiftUI

struct ContentView: View {
    
    @StateObject private var articlevm = ArticleViewModel()
    
    var body: some View {
        LoadingView(isShowing: .constant(articlevm.isLoading)) {
            NavigationStack {
                List {
                    ForEach(articlevm.articles, id: \.id) { article in
                        NavigationLink {
                            ArticleDetailView(urlString: article.url)
                        } label: {
                            ArticleView(article: article)
                                .listRowSeparator(.hidden)
                        }
                    }
                }
                .scrollIndicators(ScrollIndicatorVisibility.hidden)
                .onAppear(perform: articlevm.postRequest)
                
                .navigationTitle("NY Times Most Popular")
                .navigationBarTitleDisplayMode(.inline)
                .toolbarBackground(Color.header, for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Image("Menu")
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        Image("Search")
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        Image("Dots")
                    }
                }
                
                .alert("\(articlevm.error ?? "Something went wrong")" ,isPresented: $articlevm.hasError) {
                    Button(action: articlevm.postRequest) {
                        Text("Retry")
                    }
                }
            }
            .tint(.black)
        }
    }
}

#Preview {
    ContentView()
}
