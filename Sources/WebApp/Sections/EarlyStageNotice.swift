import ElementaryUI

@View
struct EarlyStageNotice {
  var body: some View {
    aside(.class("notice-wrap"), .custom(name: "aria-labelledby", value: "notice-title")) {
      div(.class("container")) {
        div(.class("notice")) {
          div(.class("notice-icon"), .custom(name: "aria-hidden", value: "true")) { "!" }
          div(.class("notice-copy")) {
            p(.class("overline")) { "Early-stage API" }
            h2(.id("notice-title")) { "Build now, upgrade deliberately" }
            p {
              "SwiftRPC is under active development. Public APIs, generated interfaces, and integration packages may change before 1.0."
            }
            p(.class("notice-secondary")) {
              "Pin package versions and review release notes before upgrading."
            }
          }
          div(.class("notice-actions")) {
            span(
              .class("text-link unavailable-link"),
              .custom(name: "aria-label", value: "Review releases, coming soon"),
            ) {
              "Review releases"
              small { "Coming soon" }
            }
            span(
              .class("text-link unavailable-link"),
              .custom(name: "aria-label", value: "Read the roadmap, coming soon"),
            ) {
              "Read the roadmap →"
              small { "Coming soon" }
            }
          }
        }
      }
    }
  }
}
