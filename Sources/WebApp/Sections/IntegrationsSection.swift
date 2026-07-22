import ElementaryUI

@View
struct IntegrationsSection {
  var body: some View {
    PageSection(id: "integrations", titleID: "integrations-title", hasSurface: true) {
      PageContainer {
        SectionIntro(
          eyebrow: "Integrations",
          title: "Fits the Swift server stack",
          titleID: "integrations-title"
        )
        div(.class("grid grid-cols-2 gap-6 tablet:grid-cols-1")) {
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
private struct IntegrationCard {
  let image: String
  let name: String
  let copy: String

  var body: some View {
    article(
      .class(
        "grid grid-cols-[112px_1fr] items-start gap-7.5 rounded-xl border border-border bg-white p-9 mobile:grid-cols-1 mobile:p-6.5"
      )
    ) {
      div(
        .class(
          "grid h-24 w-28 place-items-center overflow-hidden rounded-[10px] border border-border bg-surface mobile:w-full"
        )
      ) {
        img(
          .src(image), .alt(""),
          .class("w-24 max-h-19 object-contain saturate-[0.45]"),
          .custom(name: "aria-hidden", value: "true"),
        )
      }
      div {
        Eyebrow("Integration package")
        h3(.class("mb-3 text-2xl font-bold")) { name }
        p(.class("m-0 text-secondary")) { copy }
        span(
          .class(
            "mt-5.5 inline-block cursor-not-allowed font-semibold text-link no-underline opacity-68"
          ),
          .custom(name: "aria-label", value: "\(name) setup, coming soon"),
        ) {
          "View \(name) setup"
          UnavailableLabel()
        }
      }
    }
  }
}
