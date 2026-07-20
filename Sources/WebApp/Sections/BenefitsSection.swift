import ElementaryUI

struct Benefit {
    let icon: String
    let title: String
    let copy: String
}

@View
struct BenefitsSection {
    let benefits = [
        Benefit(icon: "⌘", title: "One shared protocol", copy: "Define operations and data shapes in one place."),
        Benefit(icon: "↗", title: "Typed client calls", copy: "Call remote methods with autocomplete and compile-time checking."),
        Benefit(icon: "↔", title: "No contract drift", copy: "Client and server evolve from the same Swift declarations."),
        Benefit(icon: "◇", title: "Idiomatic Swift errors", copy: "Throw, map, and handle failures through familiar Swift error semantics."),
    ]

    var body: some View {
        section(.class("section section-alt"), .custom(name: "aria-labelledby", value: "benefits-title")) {
            div(.class("container")) {
                div(.class("section-intro")) {
                    p(.class("overline")) { "Why SwiftRPC" }
                    h2(.id("benefits-title")) { "One contract, end to end" }
                    p { "Keep transport details at the boundary while the rest of your application speaks ordinary Swift." }
                }
                div(.class("benefit-grid")) {
                    ForEach(benefits, key: { $0.title }) { benefit in
                        article(.class("benefit-card")) {
                            span(.class("feature-icon"), .custom(name: "aria-hidden", value: "true")) { benefit.icon }
                            h3 { benefit.title }
                            p { benefit.copy }
                        }
                    }
                }
            }
        }
    }
}
