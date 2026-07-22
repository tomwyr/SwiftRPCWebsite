import ElementaryUI

@View
struct SiteHeader {
  @Binding var isMenuOpen: Bool

  var body: some View {
    header(
      .class(
        "sticky top-0 z-50 border-b border-border bg-white/96 backdrop-blur-[10px] transition-shadow duration-180 [&.is-scrolled]:shadow-header"
      ),
      .data("site-header", value: ""),
    ) {
      PageContainer(additionalClasses: "flex h-18 items-center justify-between mobile:h-16") {
        a(
          .href("#top"),
          .class("inline-flex items-center gap-2.5 font-semibold text-ink no-underline"),
          .custom(name: "aria-label", value: "SwiftRPC home"),
        ) {
          Brand()
        }

        nav(
          .class(
            "flex items-center gap-2.5 tablet:hidden [&>a]:inline-flex [&>a]:min-h-11 [&>a]:items-center [&>a]:px-3 [&>a]:py-2 [&>a]:font-semibold [&>a]:text-ink [&>a]:no-underline [&>a]:transition-colors [&>a]:duration-180xt-orange-hover [&>a:hover]:underline"
          ),
          .custom(name: "aria-label", value: "Primary navigation"),
        ) {
          a(.href("#adoption")) { "Docs" }
          a(.href("#examples")) { "Examples" }
          span(
            .class(
              "inline-flex min-h-11 cursor-not-allowed items-center px-3 py-2 font-semibold text-ink opacity-68"
            ),
            .custom(name: "aria-label", value: "GitHub, coming soon"),
          ) {
            "GitHub "
            span(.custom(name: "aria-hidden", value: "true")) { "↗" }
            UnavailableLabel()
          }
        }

        button(
          .type(.button),
          .class(
            "hidden size-11 cursor-pointer place-items-center rounded-lg border border-border bg-white p-2.5 tablet:grid"
          ),
          .data("menu-button", value: ""),
          .custom(name: "aria-controls", value: "mobile-navigation"),
          .custom(name: "aria-expanded", value: isMenuOpen ? "true" : "false"),
          .custom(
            name: "aria-label", value: isMenuOpen ? "Close navigation menu" : "Open navigation menu",
          ),
        ) {
          span(
            .class("grid w-5 gap-1 [&>span]:h-0.5 [&>span]:rounded-[1px] [&>span]:bg-ink"),
            .custom(name: "aria-hidden", value: "true"),
          ) {
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
          .class("hidden border-t border-border bg-white shadow-mobile-nav tablet:block"),
          .custom(name: "aria-label", value: "Mobile navigation"),
          .data("mobile-menu", value: ""),
        ) {
          PageContainer(
            additionalClasses:
              "grid pt-2.5 pb-3.5 [&>a]:flex [&>a]:min-h-12 [&>a]:items-center [&>a]:justify-between [&>a]:border-b [&>a]:border-border [&>a]:px-1 [&>a]:py-2 [&>a]:font-semibold [&>a]:text-ink [&>a]:no-underline"
          ) {
            a(.href("#adoption")) { "Docs" }
              .onClick { isMenuOpen = false }
            a(.href("#examples")) { "Examples" }
              .onClick { isMenuOpen = false }
            span(
              .class(
                "flex min-h-12 cursor-not-allowed items-center justify-between border-b border-border px-1 py-2 font-semibold text-ink opacity-68"
              ),
              .custom(name: "aria-label", value: "GitHub, coming soon"),
            ) {
              "GitHub"
              UnavailableLabel()
            }
          }
        }
      }
    }
  }
}
