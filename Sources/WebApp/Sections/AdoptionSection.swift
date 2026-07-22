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
    PageSection(id: "adoption", titleID: "adoption-title") {
      PageContainer {
        SectionIntro(
          eyebrow: "Progressive adoption",
          title: "From protocol to production call",
          titleID: "adoption-title",
          copy:
            "The same service definition moves through each layer without recreating the contract."
        )

        div(
          .class(
            "mb-10 grid grid-cols-3 border-b border-border mobile:grid-cols-1 mobile:gap-2 mobile:border-0"
          ),
          .custom(name: "role", value: "tablist"),
          .custom(name: "aria-label", value: "SwiftRPC adoption steps"),
          .data("tabs", value: ""),
        ) {
          ForEach(Array(steps.enumerated()), key: { $0.element.number }) { index, step in
            button(
              .type(.button),
              .id("step-tab-\(index)"),
              .class(
                index == selectedStep
                  ? "flex min-h-17 cursor-pointer items-center gap-3.5 border-x-0 border-t-0 border-b-[3px] border-orange bg-transparent px-4.5 py-3 text-left text-orange-hover [&>span]:font-mono [&>span]:text-xs [&>span]:text-orange-hover mobile:min-h-14 mobile:rounded-lg mobile:border mobile:border-orange mobile:bg-orange-tint"
                  : "flex min-h-17 cursor-pointer items-center gap-3.5 border-x-0 border-t-0 border-b-[3px] border-transparent bg-transparent px-4.5 py-3 text-left text-secondary [&>span]:font-mono [&>span]:text-xs [&>span]:text-muted mobile:min-h-14 mobile:rounded-lg mobile:border mobile:border-border"
              ),
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
          .class(
            "grid grid-cols-[minmax(260px,0.68fr)_minmax(0,1fr)] items-center gap-[72px] focus-visible:outline-offset-[10px] compact:gap-[42px] tablet:grid-cols-1 mobile:gap-[30px]"
          ),
          .custom(name: "role", value: "tabpanel"),
          .custom(name: "aria-labelledby", value: "step-tab-\(selectedStep)"),
          .tabindex(0),
        ) {
          div {
            p(.class("font-mono text-[13px] text-orange")) { steps[selectedStep].number }
            h3(.class("mb-3 text-xl font-bold")) { steps[selectedStep].title }
            p(.class("text-[17px] text-secondary")) { steps[selectedStep].copy }
            if selectedStep == 2 {
              div(
                .class(
                  "mt-7 flex items-center gap-5 mobile:flex-col mobile:items-stretch"
                )
              ) {
                span(
                  .class(
                    "inline-flex min-h-11 cursor-not-allowed items-center justify-center rounded-lg border border-transparent bg-orange px-3.5 py-2.25 font-semibold leading-[1.35] text-white no-underline opacity-72 shadow-primary transition-[background-color,border-color,color,box-shadow] duration-180"
                  ),
                  .custom(name: "aria-label", value: "Read the getting-started guide, coming soon"),
                ) {
                  "Read the guide"
                  UnavailableLabel()
                }
                a(
                  .href("#examples"),
                  .class("font-semibold text-link no-underline hover:underline"),
                ) { "Browse examples →" }
              }
            }
          }
          CodePanel(kind: steps[selectedStep].kind)
        }
      }
    }
  }
}
