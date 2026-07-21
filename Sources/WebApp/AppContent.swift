import ElementaryUI

@View
struct AppContent {
  @State var isMenuOpen = false
  @State var selectedStep = 0

  var body: some View {
    a(.href("#main-content"), .class("skip-link")) { "Skip to main content" }

    SiteHeader(isMenuOpen: $isMenuOpen)

    main(.id("main-content")) {
      for section in PageSection.allCases {
        switch section {
        case .hero: HeroSection()
        case .benefits: BenefitsSection()
        case .adoption: AdoptionSection(selectedStep: $selectedStep)
        case .integrations: IntegrationsSection()
        case .comparison: ComparisonSection()
        case .earlyStageNotice: EarlyStageNotice()
        case .finalCTA: FinalCTA()
        }
      }
    }

    SiteFooter()
  }
}

private enum PageSection: String, CaseIterable {
  case hero
  case benefits
  case adoption
  case integrations
  case comparison
  case earlyStageNotice
  case finalCTA
}
