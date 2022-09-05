import SwiftUI

struct DetailView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    var id: Int
    @ObservedObject var services = Services()
    init(id: Int) {
        self.id = id
        services.status = .initialized
        services.getUrlDetail(endPoint: "games", value: self.id)
    }
    @FetchRequest(sortDescriptors: []) var favourite: FetchedResults<Favorite>
    @State var isFav: Bool = false
    private func deleteFav(id: Int) {
        for item in favourite where item.id == id {
            managedObjContext.delete(item)
            DataController.shared.saveFav(context: managedObjContext)
        }
    }
    var body: some View {
        switch services.status {
        case .initialized:
            ZStack {
                Color.red
                ProgressView()
            }
        case .loaded:
            ScrollView {
                if services.detail?.backgroundImage == nil {
                    ZStack {
                        Color.primaryColor
                        Image(systemName: "exclamationmark.circle.fill")
                            .foregroundColor(Color.white)
                    }.frame(height: 300)
                        .frame(maxWidth: .infinity)
                } else {
                    AsyncImage(url: URL(string: (services.detail?.backgroundImage)!)) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(height: 300)
                    .frame(maxWidth: .infinity)
                }
                VStack(alignment: .leading) {
                    HStack {
                        Text(services.detail!.name)
                            .font(.title2.weight(.bold))
                        Spacer()
                        if isFav {Image(systemName: "heart.fill")
                            .foregroundColor(Color.primaryColor)
                            .onTapGesture {
                                deleteFav(id: (services.detail?.id)!)
                                isFav = !isFav
                            }
                        } else {
                        Image(systemName: "heart")
                            .foregroundColor(Color.primaryColor)
                            .onTapGesture {
                                DataController.shared.addFav(
                                    id: (services.detail?.id)!,
                                    name: (services.detail?.name)!,
                                    image: services.detail?.backgroundImage,
                                    realesed: services.detail?.released ?? "",
                                    rating: services.detail!.rating,
                                    context: managedObjContext)
                                isFav = !isFav
                            }
                        }
                    }
                    Text(services.detail!.description)
                        .font(.body.weight(.regular))
                    if services.detail!.released == nil {
                        EmptyView()
                    } else {
                        HStack(alignment: .center) {
                            Image(systemName: "r.square.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .foregroundColor(Color.primaryColor)
                            Text(services.detail!.released!)
                                .font(.headline.weight(.bold))
                        }.padding(.top)
                    }
                    HStack(alignment: .center) {
                        Image(systemName: "star.square")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color.primaryColor)
                        Text(String(services.detail!.rating))
                            .font(.headline.weight(.bold))
                    }.padding(.top)
                    HStack(alignment: .center) {
                        Image(systemName: "network")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color.primaryColor)
                        Text(services.detail!.website)
                            .font(.headline.weight(.bold))
                    }.padding(.top)
                }
                .padding()
                .padding(.bottom, 60)
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .offset(y: -40)
            }.ignoresSafeArea()
                .navigationTitle(services.detail!.name)
                .navigationBarTitleDisplayMode(.inline)
                .onAppear {
                    for item in favourite where item.id == services.detail!.id {
                        isFav = true
                    }
                }
        case .failed:
            ZStack {
                Color.white
                Text("Failed")
            }
        case .fetching:
            ZStack {
                Color.white
                ProgressView()
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(id: 123)
    }
}
