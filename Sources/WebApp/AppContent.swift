import ElementaryUI

@View
struct AppContent {
    @State var isMenuOpen = false
    @State var selectedStep = 0

    var body: some View {
        a(.href("#main-content"), .class("skip-link")) { "Skip to main content" }

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
