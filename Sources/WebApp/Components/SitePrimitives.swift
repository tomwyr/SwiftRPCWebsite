import ElementaryUI

@View
struct PageContainer<Content: View> {
  let additionalClasses: String
  let content: Content

  init(
    additionalClasses: String = "",
    @ContentBuilder content: () -> Content
  ) {
    self.additionalClasses = additionalClasses
    self.content = content()
  }

  var body: some View {
    div(
      .class(
        "mx-auto w-[calc(100%_-_40px)] above-mobile:w-[min(calc(100%_-_64px),1200px)] above-compact:w-[min(calc(100%_-_96px),1200px)] "
          + additionalClasses
      )
    ) {
      content
    }
  }
}

@View
struct PageSection<Content: View> {
  let id: String?
  let titleID: String
  let hasSurface: Bool
  let content: Content

  init(
    id: String? = nil,
    titleID: String,
    hasSurface: Bool = false,
    @ContentBuilder content: () -> Content
  ) {
    self.id = id
    self.titleID = titleID
    self.hasSurface = hasSurface
    self.content = content()
  }

  var body: some View {
    if let id {
      section(
        .id(id),
        .class(
          hasSurface
            ? "scroll-mt-18 bg-surface py-24 mobile:scroll-mt-16 mobile:py-17"
            : "scroll-mt-18 py-24 mobile:scroll-mt-16 mobile:py-17"
        ),
        .custom(name: "aria-labelledby", value: titleID),
      ) {
        content
      }
    } else {
      section(
        .class(
          hasSurface
            ? "scroll-mt-18 bg-surface py-24 mobile:scroll-mt-16 mobile:py-17"
            : "scroll-mt-18 py-24 mobile:scroll-mt-16 mobile:py-17"
        ),
        .custom(name: "aria-labelledby", value: titleID),
      ) {
        content
      }
    }
  }
}

@View
struct SectionIntro {
  let eyebrow: String
  let title: String
  let titleID: String
  let copy: String?

  init(eyebrow: String, title: String, titleID: String, copy: String? = nil) {
    self.eyebrow = eyebrow
    self.title = title
    self.titleID = titleID
    self.copy = copy
  }

  var body: some View {
    div(.class("mb-12 max-w-180 mobile:mb-8.5")) {
      Eyebrow(eyebrow)
      h2(
        .id(titleID),
        .class("mb-5 text-[clamp(2rem,3.3vw,2.375rem)] font-semibold mobile:text-[1.875rem]"),
      ) { title }
      if let copy {
        p(.class("m-0 text-lg leading-[1.65] text-secondary")) { copy }
      }
    }
  }
}

@View
struct Eyebrow {
  let text: String
  let isOnDarkBackground: Bool

  init(_ text: String, isOnDarkBackground: Bool = false) {
    self.text = text
    self.isOnDarkBackground = isOnDarkBackground
  }

  var body: some View {
    p(
      .class(
        isOnDarkBackground
          ? "mb-3.5 font-mono text-xs font-bold leading-[1.35] tracking-[0.08em] text-[#ff956d] uppercase"
          : "mb-3.5 font-mono text-xs font-bold leading-[1.35] tracking-[0.08em] text-orange-hover uppercase"
      )
    ) { text }
  }
}

@View
struct PrimaryAction {
  let href: String
  let label: String

  var body: some View {
    a(
      .href(href),
      .class(
        "inline-flex min-h-12 items-center justify-center rounded-lg border border-transparent bg-orange px-5 py-2.75 font-semibold leading-[1.35] text-white no-underline shadow-primary transition-[background-color,border-color,color,box-shadow] duration-180 hover:bg-orange-hover hover:no-underline"
      ),
    ) { label }
  }
}

@View
struct UnavailableLabel {
  var body: some View {
    small(
      .class(
        "ml-2 font-mono text-[10px] font-semibold tracking-[0.04em] text-muted uppercase"
      )
    ) { "Coming soon" }
  }
}
