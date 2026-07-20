import ElementaryUI

struct ComparisonRow {
  let manual: String
  let swiftRPC: String
}

@View
struct ComparisonSection {
  let rows = [
    ComparisonRow(manual: "Define route paths", swiftRPC: "Define a service protocol"),
    ComparisonRow(
      manual: "Maintain request and response wrappers", swiftRPC: "Use existing Codable types",
    ),
    ComparisonRow(manual: "Recreate client methods", swiftRPC: "Generate typed client calls"),
    ComparisonRow(
      manual: "Coordinate error payload conventions", swiftRPC: "Map idiomatic Swift errors",
    ),
    ComparisonRow(
      manual: "Detect drift in integration tests",
      swiftRPC: "Catch incompatible calls at compile time",
    ),
  ]

  var body: some View {
    section(
      .id("examples"), .class("section comparison"),
      .custom(name: "aria-labelledby", value: "comparison-title"),
    ) {
      div(.class("container comparison-container")) {
        div(.class("section-intro")) {
          p(.class("overline")) { "Before and after" }
          h2(.id("comparison-title")) { "Less contract glue" }
          p {
            "Replace manually synchronized routes, payloads, and client wrappers with one typed service definition."
          }
        }

        div(
          .class("comparison-table"), .custom(name: "role", value: "table"),
          .custom(name: "aria-label", value: "Manual API and SwiftRPC comparison"),
        ) {
          div(.class("comparison-head"), .custom(name: "role", value: "row")) {
            strong(.custom(name: "role", value: "columnheader")) { "Manual API" }
            strong(.custom(name: "role", value: "columnheader")) { "SwiftRPC" }
          }
          ForEach(rows, key: { $0.manual }) { row in
            div(.class("comparison-row"), .custom(name: "role", value: "row")) {
              div(.class("manual-cell"), .custom(name: "role", value: "cell")) {
                span(.class("mobile-cell-label")) { "Manual API" }
                span(.class("comparison-symbol"), .custom(name: "aria-hidden", value: "true")) {
                  "—"
                }
                row.manual
              }
              div(.class("rpc-cell"), .custom(name: "role", value: "cell")) {
                span(.class("mobile-cell-label")) { "SwiftRPC" }
                span(.class("comparison-symbol"), .custom(name: "aria-hidden", value: "true")) {
                  "✓"
                }
                row.swiftRPC
              }
            }
          }
        }

        p(.class("comparison-closing")) {
          "One protocol remains the source of truth across client and server."
        }
      }
    }
  }
}
