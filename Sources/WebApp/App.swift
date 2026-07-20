import ElementaryUI

@main
struct App {
  static func main() {
    let app = Application(AppContent())
    app.mount(in: .body)
  }
}
