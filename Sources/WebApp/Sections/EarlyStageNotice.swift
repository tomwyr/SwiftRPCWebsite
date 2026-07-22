import ElementaryUI

@View
struct EarlyStageNotice {
  var body: some View {
    aside(
      .class("pb-24 mobile:pb-17"),
      .custom(name: "aria-labelledby", value: "notice-title"),
    ) {
      PageContainer {
        div(
          .class(
            "grid grid-cols-[48px_1fr_auto] items-start gap-6 rounded-xl border border-warning-border bg-warning px-8.5 py-7.5 tablet:grid-cols-[42px_1fr] mobile:grid-cols-1 mobile:p-6"
          )
        ) {
          div(
            .class(
              "grid size-10.5 place-items-center rounded-full border border-warning-border font-mono font-bold text-[#8a5a08]"
            ),
            .custom(name: "aria-hidden", value: "true"),
          ) { "!" }
          div(.class("[&>p]:mb-1.5")) {
            Eyebrow("Early-stage API")
            h2(.id("notice-title"), .class("mb-2 text-[22px] font-semibold")) {
              "Build now, upgrade deliberately"
            }
            p {
              "SwiftRPC is under active development. Public APIs, generated interfaces, and integration packages may change before 1.0."
            }
            p(.class("text-sm text-secondary")) {
              "Pin package versions and review release notes before upgrading."
            }
          }
          div(
            .class(
              "flex flex-col gap-3 tablet:col-start-2 mobile:col-start-1"
            )
          ) {
            span(
              .class("cursor-not-allowed font-semibold text-link no-underline opacity-68"),
              .custom(name: "aria-label", value: "Review releases, coming soon"),
            ) {
              "Review releases"
              UnavailableLabel()
            }
            span(
              .class("cursor-not-allowed font-semibold text-link no-underline opacity-68"),
              .custom(name: "aria-label", value: "Read the roadmap, coming soon"),
            ) {
              "Read the roadmap →"
              UnavailableLabel()
            }
          }
        }
      }
    }
  }
}
