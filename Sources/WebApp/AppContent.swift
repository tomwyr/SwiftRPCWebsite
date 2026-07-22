import ElementaryUI

@View
struct AppContent {
  @State var isMenuOpen = false
  @State var selectedStep = 0

  var body: some View {
    a(
      .href("#main-content"),
      .class(
        "fixed top-3 left-3 z-100 translate-y-[-150%] rounded-lg bg-ink px-4 py-2.5 text-white transition-transform duration-150 focus:translate-y-0"
      ),
    ) { "Skip to main content" }

    SiteHeader(isMenuOpen: $isMenuOpen)

    main(.id("main-content")) {
      HeroSection()
      BenefitsSection()
      AdoptionSection(selectedStep: $selectedStep)
      IntegrationsSection()
      ComparisonSection()
      EarlyStageNotice()
      FinalCTA()
    }

    SiteFooter()
  }
}
