import ElementaryUI

@View
struct HeroSection {
  var body: some View {
    section(.id("top"), .class("hero")) {
      div(.class("container hero-grid")) {
        div(.class("hero-copy")) {
          p(.class("overline")) { "Swift 6.2+ · Early stage" }
          h1 { "Type-safe RPC for Swift services" }
          p(.class("hero-lede")) {
            "Define your service once as a Swift protocol. SwiftRPC connects typed clients and async handlers without duplicated routes, request models, or drifting contracts."
          }
          div(.class("button-row hero-actions")) {
            a(.href("#adoption"), .class("button button-primary")) { "Get Started" }
            span(
              .class("button button-secondary button-disabled"),
              .custom(name: "aria-label", value: "View on GitHub, coming soon"),
            ) {
              span(.custom(name: "aria-hidden", value: "true")) { "⌘" }
              " View on GitHub"
              small { "Coming soon" }
            }
          }
          p(.class("hero-note")) {
            span(.custom(name: "aria-hidden", value: "true")) { "◆" }
            " Built with protocols, macros, Codable, and async/await."
          }
        }

        CodePanel(kind: .hero)
      }
    }
  }
}
