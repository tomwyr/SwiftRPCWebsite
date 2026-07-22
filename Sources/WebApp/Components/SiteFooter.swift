import ElementaryUI

@View
struct SiteFooter {
  var body: some View {
    footer(.class("border-t border-strong-border pt-16 pb-7")) {
      PageContainer {
        div(
          .class(
            "grid grid-cols-[1.5fr_repeat(3,1fr)] gap-12 tablet:grid-cols-2 mobile:grid-cols-1 mobile:gap-8"
          )
        ) {
          div {
            div(.class("inline-flex items-center gap-2.5 font-semibold text-ink")) { Brand() }
            p(.class("my-4.5 max-w-75 text-secondary")) {
              "Type-safe RPC for Swift services, built around one shared protocol."
            }
            span(
              .class(
                "inline-block rounded-full border border-border px-2.5 py-1 font-mono text-[11px] text-muted"
              )
            ) { "Pre-1.0" }
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
        div(
          .class(
            "mt-13.5 flex justify-between border-t border-border pt-6 text-[13px] text-muted mobile:flex-col mobile:items-start mobile:gap-2"
          )
        ) {
          p(.class("m-0")) { "© SwiftRPC contributors" }
          p(.class("m-0")) { "Built for the Swift server ecosystem" }
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
    div {
      h2(.class("mb-4 text-sm font-semibold tracking-[0.02em]")) { title }
      ul(.class("m-0 list-none p-0")) {
        ForEach(links, key: { $0 }) { link in
          li(.class("mb-2.25")) {
            if link == "Getting Started" {
              a(
                .href("#adoption"),
                .class("text-sm text-secondary no-underline hover:text-link hover:underline"),
              ) { link }
            } else if link == "Examples" {
              a(
                .href("#examples"),
                .class("text-sm text-secondary no-underline hover:text-link hover:underline"),
              ) { link }
            } else if link == "Integrations" {
              a(
                .href("#integrations"),
                .class("text-sm text-secondary no-underline hover:text-link hover:underline"),
              ) { link }
            } else {
              span(
                .class(
                  "inline-flex cursor-not-allowed flex-wrap text-sm text-secondary opacity-68"
                )
              ) {
                link
                small(
                  .class(
                    "ml-1.25 font-mono text-[8px] font-semibold tracking-[0.04em] text-muted uppercase"
                  )
                ) { "Coming soon" }
              }
            }
          }
        }
      }
    }
  }
}
