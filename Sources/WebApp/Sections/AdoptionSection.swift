import ElementaryUI

struct AdoptionStep {
  let number: String
  let title: String
  let copy: String
  let kind: CodeKind
}

@View
struct AdoptionSection {
  @Binding var selectedStep: Int

  let steps = [
    AdoptionStep(
      number: "01", title: "Define protocol",
      copy: "Describe the service with ordinary Swift types. The macro supplies the RPC metadata.",
      kind: .protocolStep,
    ),
    AdoptionStep(
      number: "02", title: "Implement handler",
      copy:
        "Conform to the generated handler contract and keep business logic independent from the transport.",
      kind: .handlerStep,
    ),
    AdoptionStep(
      number: "03", title: "Call typed client",
      copy:
        "Create a client through your server integration and call the service like a local async API.",
      kind: .clientStep,
    ),
  ]

  var body: some View {
    section(
      .id("adoption"), .class("section adoption"),
      .custom(name: "aria-labelledby", value: "adoption-title"),
    ) {
      div(.class("container")) {
        div(.class("section-intro")) {
          p(.class("overline")) { "Progressive adoption" }
          h2(.id("adoption-title")) { "From protocol to production call" }
          p {
            "The same service definition moves through each layer without recreating the contract."
          }
        }

        div(
          .class("step-tabs"),
          .custom(name: "role", value: "tablist"),
          .custom(name: "aria-label", value: "SwiftRPC adoption steps"),
          .data("tabs", value: ""),
        ) {
          ForEach(Array(steps.enumerated()), key: { $0.element.number }) { index, step in
            button(
              .type(.button),
              .id("step-tab-\(index)"),
              .class(index == selectedStep ? "step-tab is-active" : "step-tab"),
              .custom(name: "role", value: "tab"),
              .custom(name: "aria-selected", value: index == selectedStep ? "true" : "false"),
              .custom(name: "aria-controls", value: "step-panel-\(index)"),
              .tabindex(index == selectedStep ? 0 : -1),
              .data("tab-index", value: "\(index)"),
            ) {
              span { step.number }
              strong { step.title }
            }
            .onClick { selectedStep = index }
          }
        }

        article(
          .id("step-panel-\(selectedStep)"),
          .class("step-panel"),
          .custom(name: "role", value: "tabpanel"),
          .custom(name: "aria-labelledby", value: "step-tab-\(selectedStep)"),
          .tabindex(0),
        ) {
          div(.class("step-copy")) {
            p(.class("step-number")) { steps[selectedStep].number }
            h3 { steps[selectedStep].title }
            p { steps[selectedStep].copy }
            if selectedStep == 2 {
              div(.class("step-links")) {
                span(
                  .class("button button-primary button-compact button-disabled"),
                  .custom(name: "aria-label", value: "Read the getting-started guide, coming soon"),
                ) {
                  "Read the guide"
                  small { "Coming soon" }
                }
                a(.href("#examples"), .class("text-link")) { "Browse examples →" }
              }
            }
          }
          CodePanel(kind: steps[selectedStep].kind)
        }
      }
    }
  }
}
