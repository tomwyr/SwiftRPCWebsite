import ElementaryUI

@View
struct SiteHeader {
  @Binding var isMenuOpen: Bool

  var body: some View {
    header(.class("site-header"), .data("site-header", value: "")) {
      div(.class("container header-inner")) {
        a(.href("#top"), .class("brand"), .custom(name: "aria-label", value: "SwiftRPC home")) {
          Brand()
        }

        nav(.class("desktop-nav"), .custom(name: "aria-label", value: "Primary navigation")) {
          a(.href("#adoption")) { "Docs" }
          a(.href("#examples")) { "Examples" }
          span(.class("nav-unavailable"), .custom(name: "aria-label", value: "GitHub, coming soon"))
          {
            "GitHub "
            span(.custom(name: "aria-hidden", value: "true")) { "↗" }
            small { "Coming soon" }
          }
        }

        button(
          .type(.button),
          .class("menu-button"),
          .custom(name: "aria-controls", value: "mobile-navigation"),
          .custom(name: "aria-expanded", value: isMenuOpen ? "true" : "false"),
          .custom(
            name: "aria-label", value: isMenuOpen ? "Close navigation menu" : "Open navigation menu",
          ),
        ) {
          span(.class("menu-icon"), .custom(name: "aria-hidden", value: "true")) {
            span { "" }
            span { "" }
            span { "" }
          }
        }
        .onClick { isMenuOpen.toggle() }
      }

      if isMenuOpen {
        nav(
          .id("mobile-navigation"),
          .class("mobile-nav"),
          .custom(name: "aria-label", value: "Mobile navigation"),
          .data("mobile-menu", value: ""),
        ) {
          div(.class("container")) {
            a(.href("#adoption")) { "Docs" }
              .onClick { isMenuOpen = false }
            a(.href("#examples")) { "Examples" }
              .onClick { isMenuOpen = false }
            span(
              .class("nav-unavailable"),
              .custom(name: "aria-label", value: "GitHub, coming soon"),
            ) {
              "GitHub"
              small { "Coming soon" }
            }
          }
        }
      }
    }
  }
}
