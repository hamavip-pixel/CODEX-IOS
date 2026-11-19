
import SwiftUI

struct ContentView: View {
    @State private var selection = "Welcome"

    @State private var code = """
    // Welcome to HAMA CODEX
    // Your iPad development workspace

    import Foundation

    print("Hello, HAMA CODEX!")
    """

    @State private var output = "Ready. Select a project or open the editor."

    private let sidebar = [
        "Welcome",
        "Projects",
        "Code Editor",
        "Terminal",
        "Dylib Studio",
        "Build"
    ]

    var body: some View {
        NavigationSplitView {
            List(selection: $selection) {
                Section("WORKSPACE") {
                    ForEach(sidebar, id: \.self) { item in
                        Label(item, systemImage: icon(for: item))
                            .tag(item)
                    }
                }
            }
            .navigationTitle("HAMA CODEX")
            .listStyle(.sidebar)

        } detail: {
            VStack(spacing: 0) {
                HStack {
                    VStack(alignment: .leading, spacing: 3) {
                        Text(selection)
                            .font(.title2.bold())

                        Text("iPadOS Development Environment")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }

                    Spacer()

                    Image(systemName: "hammer.fill")
                        .foregroundStyle(.red)
                }
                .padding()

                Divider()

                detailContent
            }
            .background(Color(uiColor: .systemGroupedBackground))
        }
        .tint(.red)
    }

    @ViewBuilder
    private var detailContent: some View {
        switch selection {

        case "Code Editor":
            VStack(spacing: 0) {
                HStack {
                    Label("main.swift", systemImage: "swift")
                    Spacer()
                    Text("Swift")
                        .foregroundStyle(.secondary)
                }
                .padding()

                TextEditor(text: $code)
                    .font(.system(.body, design: .monospaced))
                    .padding(8)

                buildConsole
            }

        case "Terminal":
            VStack(alignment: .leading, spacing: 12) {
                Text("HAMA CODEX TERMINAL")
                    .font(.caption.bold())
                    .foregroundStyle(.green)

                Text("Terminal session is a UI shell in this starter build. Connect a trusted remote build runner to execute build commands.")
                    .font(.system(.body, design: .monospaced))

                Spacer()

                Text("hama@codex ~ %")
                    .font(.system(.body, design: .monospaced))
                    .foregroundStyle(.green)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.black)
            .foregroundStyle(.white)

        case "Dylib Studio":
            List {
                Label("Inspect Mach-O headers", systemImage: "doc.text.magnifyingglass")
                Label("View exported symbols", systemImage: "list.bullet.rectangle")
                Label("Browse strings and dependencies", systemImage: "text.magnifyingglass")
                Label("Hex viewer and binary metadata", systemImage: "number")

                Text("Binary editing and rebuilding require a compatible macOS build worker and authorized source/binaries.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }

        case "Build":
            VStack(alignment: .leading, spacing: 16) {
                Label("Build & Compile", systemImage: "hammer")
                    .font(.title3.bold())

                Text("Builds run on GitHub-hosted macOS runners.")

                Button("Run local demo build") {
                    output = "Demo only: connect GitHub Actions to compile on macOS."
                }
                .buttonStyle(.borderedProminent)

                buildConsole

                Spacer()
            }
            .padding()

        case "Projects":
            List {
                Label("Create iOS App", systemImage: "plus.app")
                Label("Open Existing Project", systemImage: "folder")
                Label("Import Framework / Dylib", systemImage: "shippingbox")
            }

        default:
            ScrollView {
                VStack(alignment: .leading, spacing: 18) {
                    Text("Build apps. Compile code. Inspect binaries.")
                        .font(.largeTitle.bold())

                    Text("A professional iPad workspace inspired by Xcode.")
                        .foregroundStyle(.secondary)

                    LazyVGrid(
                        columns: [GridItem(.adaptive(minimum: 190))],
                        spacing: 12
                    ) {
                        feature("Code Editor", "chevron.left.forwardslash.chevron.right", "Edit Swift and C-family source")
                        feature("Terminal", "terminal", "Command workspace")
                        feature("Dylib Studio", "shippingbox", "Inspect authorized Mach-O files")
                        feature("Build", "hammer.fill", "Remote macOS build pipeline")
                    }
                }
                .padding()
            }
        }
    }

    private var buildConsole: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("BUILD OUTPUT")
                .font(.caption.bold())
                .foregroundStyle(.secondary)

            Text(output)
                .font(.system(.footnote, design: .monospaced))
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
        .background(Color(uiColor: .secondarySystemGroupedBackground))
    }

    private func feature(
        _ title: String,
        _ symbol: String,
        _ detail: String
    ) -> some View {
        Button {
            selection = title
        } label: {
            VStack(alignment: .leading, spacing: 8) {
                Image(systemName: symbol)
                    .font(.title2)
                    .foregroundStyle(.red)

                Text(title)
                    .font(.headline)

                Text(detail)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            .frame(maxWidth: .infinity, minHeight: 110, alignment: .leading)
            .padding()
            .background(
                Color(uiColor: .secondarySystemGroupedBackground),
                in: RoundedRectangle(cornerRadius: 14)
            )
        }
        .buttonStyle(.plain)
    }

    private func icon(for item: String) -> String {
        switch item {
        case "Projects": return "folder"
        case "Code Editor": return "chevron.left.forwardslash.chevron.right"
        case "Terminal": return "terminal"
        case "Dylib Studio": return "shippingbox"
        case "Build": return "hammer"
        default: return "house"
        }
    }
}
