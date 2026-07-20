import ElementaryUI

@View
struct SiteFooter {
  var body: some View {
    footer(.class("site-footer")) {
      div(.class("container")) {
        div(.class("footer-grid")) {
          div(.class("footer-brand")) {
            div(.class("brand")) { Brand() }
            p { "Type-safe RPC for Swift services, built around one shared protocol." }
            span(.class("version-pill")) { "Pre-1.0" }
          }
          FooterColumn(
            title: "Documentation",
            links: ["Getting Started", "Core Concepts", "Error Handling", "Integrations"],
          )
          FooterColumn(
            title: "Resources",
            links: ["Examples", "Releases", "Roadmap", "Contributing"],
          )
          FooterColumn(title: "Community", links: ["GitHub Discussions", "Issues", "License"])
        }
        div(.class("footer-bottom")) {
          p { "© SwiftRPC contributors" }
          p { "Built for the Swift server ecosystem" }
        }
      }
    }
  }
}

@View
struct FooterColumn {
  let title: String
  let links: [String]

  var body: some View {
    div(.class("footer-column")) {
      h2 { title }
      ul {
        ForEach(links, key: { $0 }) { link in
          li {
            if link == "Getting Started" {
              a(.href("#adoption")) { link }
            } else if link == "Examples" {
              a(.href("#examples")) { link }
            } else if link == "Integrations" {
              a(.href("#integrations")) { link }
            } else {
              span(.class("footer-unavailable")) {
                link
                small { "Coming soon" }
              }
            }
          }
        }
      }
    }
  }
}
