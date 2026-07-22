import ElementaryUI

@View
struct FinalCTA {
  var body: some View {
    section(
      .class("bg-ink py-20 text-white mobile:py-17"),
      .custom(name: "aria-labelledby", value: "cta-title"),
    ) {
      PageContainer(additionalClasses: "max-w-190 text-center") {
        Eyebrow("Start small", isOnDarkBackground: true)
        h2(
          .id("cta-title"),
          .class("mb-5 text-[clamp(2rem,4vw,2.75rem)] font-semibold"),
        ) { "Start with one typed service" }
        p(.class("mx-auto mb-7.5 text-lg text-[#c7d2e1]")) {
          "Add SwiftRPC to a Swift 6.2 project and move from protocol to client call in a few focused steps."
        }
        div(.class("flex flex-wrap justify-center gap-3 mobile:grid")) {
          PrimaryAction(href: "#adoption", label: "Get Started")
          a(
            .href("#examples"),
            .class(
              "inline-flex min-h-12 items-center justify-center rounded-lg border border-[#8795aa] px-5 py-2.75 font-semibold leading-[1.35] text-white no-underline transition-[background-color,border-color,color,box-shadow] duration-180 hover:border-white hover:bg-white/10 hover:no-underline"
            ),
          ) { "Explore Examples" }
        }
        p(.class("mt-6 font-mono text-xs text-[#9fb0c6]")) {
          "Swift 6.2+ · macOS and Linux"
        }
      }
    }
  }
}
