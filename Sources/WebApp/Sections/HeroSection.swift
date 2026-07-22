import ElementaryUI

@View
struct HeroSection {
  var body: some View {
    section(
      .id("top"),
      .class("py-24 mobile:pt-14 mobile:pb-16"),
      .data("hero", value: ""),
    ) {
      PageContainer(
        additionalClasses:
          "grid grid-cols-[minmax(0,1.08fr)_minmax(420px,0.92fr)] items-center gap-[72px] compact:grid-cols-[minmax(0,1fr)_minmax(390px,0.92fr)] compact:gap-10 tablet:grid-cols-1"
      ) {
        div {
          Eyebrow("Swift 6.2+ · Early stage")
          h1(
            .class(
              "mb-6 max-w-[690px] text-[clamp(2.75rem,4.2vw,3.5rem)] font-[650] mobile:text-[2.5rem] mobile:leading-[1.15]"
            )
          ) { "Type-safe RPC for Swift services" }
          p(
            .class(
              "mb-8 max-w-162.5 text-[19px] leading-[1.58] text-secondary mobile:text-[17px]"
            )
          ) {
            "Define your service once as a Swift protocol. SwiftRPC connects typed clients and async handlers without duplicated routes, request models, or drifting contracts."
          }
          div(
            .class(
              "flex flex-wrap justify-start gap-3 mobile:grid mobile:*:w-full"
            )
          ) {
            PrimaryAction(href: "#adoption", label: "Get Started")
            span(
              .class(
                "inline-flex min-h-12 cursor-not-allowed items-center justify-center rounded-lg border border-strong-border bg-white px-5 py-2.75 font-semibold leading-[1.35] text-ink no-underline opacity-72 transition-[background-color,border-color,color,box-shadow] duration-180"
              ),
              .custom(name: "aria-label", value: "View on GitHub, coming soon"),
            ) {
              span(.custom(name: "aria-hidden", value: "true")) { "⌘" }
              " View on GitHub"
              UnavailableLabel()
            }
          }
          p(.class("mt-6.5 text-sm text-muted")) {
            span(.class("text-orange"), .custom(name: "aria-hidden", value: "true")) { "◆" }
            " Built with protocols, macros, Codable, and async/await."
          }
        }

        CodePanel(kind: .hero)
      }
    }
  }
}
