import ElementaryUI

private struct Benefit {
  let icon: String
  let title: String
  let copy: String
}

@View
struct BenefitsSection {
  private let benefits = [
    Benefit(
      icon: "⌘", title: "One shared protocol",
      copy: "Define operations and data shapes in one place.",
    ),
    Benefit(
      icon: "↗", title: "Typed client calls",
      copy: "Call remote methods with autocomplete and compile-time checking.",
    ),
    Benefit(
      icon: "↔", title: "No contract drift",
      copy: "Client and server evolve from the same Swift declarations.",
    ),
    Benefit(
      icon: "◇", title: "Idiomatic Swift errors",
      copy: "Throw, map, and handle failures through familiar Swift error semantics.",
    ),
  ]

  var body: some View {
    PageSection(titleID: "benefits-title", hasSurface: true) {
      PageContainer {
        SectionIntro(
          eyebrow: "Why SwiftRPC",
          title: "One contract, end to end",
          titleID: "benefits-title",
          copy:
            "Keep transport details at the boundary while the rest of your application speaks ordinary Swift."
        )
        div(
          .class(
            "grid grid-cols-4 gap-5 compact:grid-cols-2 mobile:grid-cols-1"
          )
        ) {
          ForEach(benefits, key: { $0.title }) { benefit in
            article(
              .class(
                "min-h-56.5 rounded-xl border border-border bg-white p-7 mobile:min-h-0"
              )
            ) {
              span(
                .class(
                  "mb-7 inline-grid size-11 place-items-center rounded-[10px] border border-[#f4b299] bg-orange-tint font-mono text-xl text-orange-hover"
                ),
                .custom(name: "aria-hidden", value: "true"),
              ) {
                benefit.icon
              }
              h3(.class("mb-3 text-xl font-bold")) { benefit.title }
              p(.class("m-0 text-secondary")) { benefit.copy }
            }
          }
        }
      }
    }
  }
}
