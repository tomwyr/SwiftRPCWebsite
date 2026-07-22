import ElementaryUI

private struct ComparisonRow {
  let manual: String
  let swiftRPC: String
}

@View
struct ComparisonSection {
  private let rows = [
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
    PageSection(id: "examples", titleID: "comparison-title") {
      PageContainer(additionalClasses: "max-w-240") {
        SectionIntro(
          eyebrow: "Before and after",
          title: "Less contract glue",
          titleID: "comparison-title",
          copy:
            "Replace manually synchronized routes, payloads, and client wrappers with one typed service definition."
        )

        ComparisonTable(rows: rows)

        p(.class("mt-7 text-center text-lg font-semibold text-ink")) {
          "One protocol remains the source of truth across client and server."
        }
      }
    }
  }
}

@View
private struct ComparisonTable {
  let rows: [ComparisonRow]

  var body: some View {
    div(
      .class(
        "overflow-hidden rounded-xl border border-border mobile:overflow-visible mobile:border-0"
      ),
      .custom(name: "role", value: "table"),
      .custom(name: "aria-label", value: "Manual API and SwiftRPC comparison"),
    ) {
      div(
        .class("grid grid-cols-2 mobile:hidden"),
        .custom(name: "role", value: "row"),
      ) {
        strong(
          .class("bg-surface px-6 py-4.5"),
          .custom(name: "role", value: "columnheader"),
        ) {
          "Manual API"
        }
        strong(
          .class("border-t-[3px] border-orange bg-orange-tint px-6 py-4.5"),
          .custom(name: "role", value: "columnheader"),
        ) { "SwiftRPC" }
      }
      ForEach(rows, key: { $0.manual }) { row in
        ComparisonTableRow(row: row)
      }
    }
  }
}

@View
private struct ComparisonTableRow {
  let row: ComparisonRow

  var body: some View {
    div(
      .class(
        "grid grid-cols-2 mobile:mb-3.5 mobile:grid-cols-1 mobile:overflow-hidden mobile:rounded-[10px] mobile:border mobile:border-border"
      ),
      .custom(name: "role", value: "row"),
    ) {
      div(
        .class(
          "border-t border-border px-6 py-4.25 mobile:grid mobile:grid-cols-1 mobile:px-4.5 mobile:py-4"
        ),
        .custom(name: "role", value: "cell"),
      ) {
        span(
          .class(
            "mb-1.5 hidden font-mono text-[10px] font-bold tracking-[0.06em] text-muted uppercase mobile:block"
          )
        ) { "Manual API" }
        span(
          .class(
            "inline-block w-6 font-bold text-muted mobile:hidden"
          ),
          .custom(name: "aria-hidden", value: "true"),
        ) {
          "—"
        }
        row.manual
      }
      div(
        .class(
          "border-t border-border bg-[#fff9f6] px-6 py-4.25 mobile:grid mobile:grid-cols-1 mobile:px-4.5 mobile:py-4"
        ),
        .custom(name: "role", value: "cell"),
      ) {
        span(
          .class(
            "mb-1.5 hidden font-mono text-[10px] font-bold tracking-[0.06em] text-muted uppercase mobile:block"
          )
        ) { "SwiftRPC" }
        span(
          .class(
            "inline-block w-6 font-bold text-success mobile:hidden"
          ),
          .custom(name: "aria-hidden", value: "true"),
        ) {
          "✓"
        }
        row.swiftRPC
      }
    }
  }
}
