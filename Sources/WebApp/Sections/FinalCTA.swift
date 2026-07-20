import ElementaryUI

@View
struct FinalCTA {
    var body: some View {
        section(.class("final-cta"), .custom(name: "aria-labelledby", value: "cta-title")) {
            div(.class("container final-cta-content")) {
                p(.class("overline")) { "Start small" }
                h2(.id("cta-title")) { "Start with one typed service" }
                p { "Add SwiftRPC to a Swift 6.2 project and move from protocol to client call in a few focused steps." }
                div(.class("button-row")) {
                    a(.href("#adoption"), .class("button button-primary")) { "Get Started" }
                    a(.href("#examples"), .class("button button-outline-light")) { "Explore Examples" }
                }
                p(.class("platform-caption")) { "Swift 6.2+ · macOS and Linux" }
            }
        }
    }
}
