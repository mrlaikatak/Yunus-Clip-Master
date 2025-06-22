import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var searchText: String = ""
    private let clipboardManager = ClipboardManager()
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        VStack(spacing: 0) {
            HeaderView(searchText: $searchText)
            
            ClipListView(
                searchText: searchText,
                manager: clipboardManager
            )
        }
        .frame(minWidth: 350, idealWidth: 400, maxWidth: .infinity, minHeight: 400, idealHeight: 600, maxHeight: .infinity)
        .background(Material.bar)
        .onAppear {
            clipboardManager.setup(context: modelContext)
            clipboardManager.startMonitoring()
        }
    }
}

struct HeaderView: View {
    @Binding var searchText: String

    var body: some View {
        VStack(spacing: 0) {
            Text("Clip Master")
                .font(.headline)
                .padding(.top, 10)
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.secondary)
                TextField("Search Clips...", text: $searchText)
                    .textFieldStyle(PlainTextFieldStyle())
            }
            .padding(EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 10))
            .background(Color.black.opacity(0.2))
            .cornerRadius(8)
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 10, trailing: 16))
        }
        .background(Material.bar)
        .shadow(radius: 2, y: 1)
    }
}

struct ClipListView: View {
    @Query private var clips: [ClipItem]
    @Environment(\.modelContext) private var modelContext

    let searchText: String
    let manager: ClipboardManager
    
    init(searchText: String, manager: ClipboardManager) {
        self.searchText = searchText
        self.manager = manager
        
        let predicate = #Predicate<ClipItem> { clip in
            searchText.isEmpty || clip.content.localizedStandardContains(searchText)
        }
        
        _clips = Query(filter: predicate, sort: \.timestamp, order: .reverse)
    }
    
    private var sortedAndGroupedClips: [(date: Date, clips: [ClipItem])] {
        let sortedClips = clips.sorted {
            if $0.isStarred != $1.isStarred {
                return $0.isStarred && !$1.isStarred
            }
            return $0.timestamp > $1.timestamp
        }
        
        let grouped = Dictionary(grouping: sortedClips) { clip in
            Calendar.current.startOfDay(for: clip.timestamp)
        }
        return grouped.sorted { $0.key > $1.key }.map { (date: $0.key, clips: $0.value) }
    }

    var body: some View {
        if clips.isEmpty {
            if searchText.isEmpty {
                Spacer()
                Text("No Clips Yet")
                    .font(.title2)
                    .foregroundColor(.secondary)
                Text("Copy some text to get started.")
                    .foregroundStyle(.tertiary)
                Spacer()
            } else {
                Spacer()
                Text("No Results for \"\(searchText)\"")
                    .font(.title2)
                    .foregroundColor(.secondary)
                Spacer()
            }
        } else {
            List {
                ForEach(sortedAndGroupedClips, id: \.date) { date, items in
                    Section(header: Text(sectionHeader(for: date))) {
                        ForEach(items) { item in
                            ClipRow(item: item, manager: manager)
                        }
                    }
                }
            }
            .listStyle(SidebarListStyle())
        }
    }
    
    private func sectionHeader(for date: Date) -> String {
        let calendar = Calendar.current
        if calendar.isDateInToday(date) {
            return "Today"
        } else if calendar.isDateInYesterday(date) {
            return "Yesterday"
        } else {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            formatter.timeStyle = .none
            return formatter.string(from: date)
        }
    }
}

struct ClipRow: View {
    let item: ClipItem
    let manager: ClipboardManager
    @Environment(\.modelContext) private var modelContext
    @State private var isHovering = false

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(item.content)
                    .font(.body)
                    .lineLimit(2)
                Text(item.timestamp, style: .relative)
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            
            Spacer()

            if isHovering {
                HStack {
                    Button(action: {
                        item.isStarred.toggle()
                    }) {
                        Image(systemName: item.isStarred ? "star.fill" : "star")
                            .foregroundColor(item.isStarred ? .yellow : .secondary)
                    }
                    .buttonStyle(BorderlessButtonStyle())
                    
                    Button(action: {
                        manager.copyToClipboard(content: item.content)
                    }) {
                        Image(systemName: "doc.on.doc")
                    }
                    .buttonStyle(BorderlessButtonStyle())

                    Button(action: {
                        modelContext.delete(item)
                    }) {
                        Image(systemName: "trash")
                    }
                    .buttonStyle(BorderlessButtonStyle())
                }
                .transition(.opacity.animation(.easeInOut(duration: 0.2)))
            }
        }
        .padding(8)
        .background(isHovering ? Color.secondary.opacity(0.15) : Color.clear)
        .cornerRadius(6)
        .onHover { hovering in
            isHovering = hovering
        }
    }
}

#if DEBUG
@MainActor
let previewContainer: ModelContainer = {
    do {
        let container = try ModelContainer(
            for: ClipItem.self,
            configurations: ModelConfiguration(isStoredInMemoryOnly: true)
        )
        let context = container.mainContext
        // Örnek verileri ekle
        context.insert(ClipItem(content: "Bu dün kopyalanan bir metin.", timestamp: Calendar.current.date(byAdding: .day, value: -1, to: .now)!))
        context.insert(ClipItem(content: "Bu bugün kopyalanan ilk metin.", timestamp: .now))
        context.insert(ClipItem(content: "Bu da bugün kopyalanan favori bir metin.", timestamp: .now, isStarred: true))
        return container
    } catch {
        fatalError("Önizleme için ModelContainer oluşturulamadı: \(error)")
    }
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .modelContainer(previewContainer)
    }
}
#endif 