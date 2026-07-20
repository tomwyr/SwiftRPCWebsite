import ElementaryUI

@View
struct Brand {
    var body: some View {
        span(.class("brand-mark"), .custom(name: "aria-hidden", value: "true")) {
            span(.class("brand-angle")) { "<" }
            span(.class("brand-node")) { "" }
            span(.class("brand-angle")) { ">" }
        }
        span(.class("brand-name")) { "SwiftRPC" }
    }
}
