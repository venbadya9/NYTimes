import SwiftUI

struct ArticleView: View {
    
    let article: Article
    let imageDimension = 50.0
    let radius = 25.0
    let spacing = 5.0
    
    var body: some View {
        HStack {
            if let imageUrl = article.media.first?.mediaMetadata.first?.url {
                AsyncImage(url: URL(string: imageUrl)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: imageDimension, height: imageDimension)
                .cornerRadius(radius)
            } else {
                Image("User")
                    .foregroundColor(.gray)
                    .frame(width: imageDimension, height: imageDimension)
            }
            
            VStack(alignment: .leading, spacing: spacing) {
                Text("\(article.title)")
                    .font(.headline)
                
                Text("\(article.byline)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                HStack {
                    Image(systemName: "calendar")
                        .foregroundColor(.gray)
                    Text("\(article.publishedDate)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity, maxHeight: 20, alignment: .bottomTrailing)
            }
        }
        .padding(.vertical, spacing)
    }
}

struct ArticleView_Previews {
    static var previews: some View {
        ArticleView(article: Article(
            url: "",
            id: 1,
            publishedDate: "2024-08-17",
            byline: "Sample Text",
            title: "Sample Text",
            media: []
        ))
    }
}
