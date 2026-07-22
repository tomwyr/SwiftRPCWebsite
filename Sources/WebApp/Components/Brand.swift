import ElementaryUI

@View
struct Brand {
  var body: some View {
    span(
      .class("inline-flex items-center font-mono text-2xl leading-none font-bold text-orange"),
      .custom(name: "aria-hidden", value: "true"),
    ) {
      span { "<" }
      span(.class("-mx-0.5 size-1.5 rounded-full bg-ink")) { "" }
      span { ">" }
    }
    span(.class("text-lg")) { "SwiftRPC" }
  }
}
