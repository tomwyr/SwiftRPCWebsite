import ElementaryUI

@View
struct IntegrationsSection {
  var body: some View {
    section(
      .id("integrations"), .class("section section-alt"),
      .custom(name: "aria-labelledby", value: "integrations-title"),
    ) {
      div(.class("container")) {
        div(.class("section-intro")) {
          p(.class("overline")) { "Integrations" }
          h2(.id("integrations-title")) { "Fits the Swift server stack" }
        }
        div(.class("integration-grid")) {
          IntegrationCard(
            image: "/assets/hummingbird.png",
            name: "Hummingbird",
            copy:
              "Mount generated RPC handlers alongside existing Hummingbird routes and middleware.",
          )
          IntegrationCard(
            image: "/assets/vapor.png",
            name: "Vapor",
            copy: "Expose the same typed service contract through a Vapor application.",
          )
        }
      }
    }
  }
}

@View
struct IntegrationCard {
  let image: String
  let name: String
  let copy: String

  var body: some View {
    article(.class("integration-card")) {
      div(.class("integration-logo")) {
        img(.src(image), .alt(""), .custom(name: "aria-hidden", value: "true"))
      }
      div {
        p(.class("compatibility-label")) { "Integration package" }
        h3 { name }
        p { copy }
        span(
          .class("text-link unavailable-link"),
          .custom(name: "aria-label", value: "\(name) setup, coming soon"),
        ) {
          "View \(name) setup"
          small { "Coming soon" }
        }
      }
    }
  }
}
