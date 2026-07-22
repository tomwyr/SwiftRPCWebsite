import ElementaryUI

struct CodeSnippetData {
  let filename: String
  let body: [CodeSnippet.Token]
  let isFeatured: Bool
  let output: String?

  init(
    filename: String,
    body: [CodeSnippet.Token],
    output: String? = nil,
    isFeatured: Bool = false,
  ) {
    self.filename = filename
    self.body = body
    self.isFeatured = isFeatured
    self.output = output
  }

  var copyText: String {
    body.map { $0.text }.joined()
  }
}

@View
struct CodePanel {
  let data: CodeSnippetData

  var body: some View {
    div(
      .class(
        data.isFeatured
          ? "min-w-0 w-full max-w-140 animate-code-enter overflow-hidden rounded-xl border border-[#253451] bg-code text-[#eef4ff] shadow-code tablet:max-w-none"
          : "min-w-0 overflow-hidden rounded-xl border border-[#253451] bg-code text-[#eef4ff] shadow-code"
      ),
      .data("code-window", value: ""),
    ) {
      CodePanelToolbar(data: data)
      pre(
        .class(
          "m-0 min-h-47 overflow-x-auto px-5 py-6 font-mono text-sm leading-[1.65] tab-4 mobile:px-3.5 mobile:py-5 mobile:text-xs"
        ),
        .custom(name: "aria-label", value: "\(data.filename) source code"),
      ) {
        code {
          CodeSnippet(tokens: data.body)
        }
      }
      CodePanelFooter(output: data.output)
    }
  }
}

@View
private struct CodePanelToolbar {
  let data: CodeSnippetData

  var body: some View {
    div(
      .class(
        "grid min-h-[50px] grid-cols-[56px_1fr_auto_auto] items-center gap-3 border-b border-[#253451] bg-[#15223a] px-[14px] mobile:grid-cols-[38px_minmax(0,1fr)_auto] mobile:gap-2"
      )
    ) {
      div(
        .class(
          "flex gap-1.5 mobile:gap-1 [&>span]:size-2 [&>span]:rounded-full [&>span]:bg-[#66758d] mobile:[&>span]:size-1.75"
        ),
        .custom(name: "aria-hidden", value: "true"),
      ) {
        span { "" }
        span { "" }
        span { "" }
      }
      span(
        .class(
          "overflow-hidden font-mono text-xs text-ellipsis whitespace-nowrap text-[#cad6e9]"
        )
      ) {
        data.filename
      }
      span(.class("font-mono text-[11px] text-[#93a5c1] mobile:hidden")) { "Swift" }
      button(
        .type(.button),
        .class(
          "inline-flex min-h-9 min-w-18 cursor-pointer items-center justify-center gap-1.5 rounded-[7px] border border-[#40506c] bg-[#1c2a45] px-2.5 py-1.5 font-mono text-[11px] text-[#e7eef9] hover:border-[#788ba8] hover:bg-[#253654] [&.is-success]:border-[#3b9a6c] [&.is-success]:text-[#a8e2c4] [&.is-error]:border-[#d68d65] [&.is-error]:text-[#ffd0b9] mobile:min-w-15.5 mobile:px-2"
        ),
        .data("copy-code", value: data.copyText),
        .custom(name: "aria-label", value: "Copy \(data.filename) code"),
      ) {
        span(.custom(name: "aria-hidden", value: "true")) { "□" }
        span(.data("copy-label", value: "")) { "Copy" }
      }
    }
  }
}

@View
private struct CodePanelFooter {
  let output: String?

  var body: some View {
    if let output {
      div(
        .class(
          "border-t border-[#253451] bg-[#0c1526] px-5 py-3 font-mono text-[13px] text-[#bce7ca]"
        )
      ) {
        span(.custom(name: "aria-hidden", value: "true")) { "✓" }
        " \(output)"
      }
    }

    span(
      .class("sr-only"), .custom(name: "aria-live", value: "polite"),
      .data("copy-status", value: ""),
    ) { "" }
  }
}

extension CodeSnippetData {
  static var hero: Self {
    Self(
      filename: "GreetingService.swift",
      body: [
        .accent("@RPCService"), .br,
        .keyword("protocol"), " ", .type("GreetingService"), " {", .br,
        "    ", .keyword("func"), " ", .accent("greet"), "(name: ", .type("String"),
        ") ", .keyword("async throws"), " -> ", .type("String"), .br,
        "}", .br,
        .br,
        .keyword("let"), " greeting = ", .keyword("try await"), " client.",
        .accent("greet"), "(name: ", .string("\"Taylor\""), ")",
      ],
      output: "\"Hello, Taylor!\"",
      isFeatured: true,
    )
  }

  static var protocolStep: Self {
    Self(
      filename: "UserService.swift",
      body: [
        .accent("@RPCService"), .br,
        .keyword("protocol"), " ", .type("UserService"), " {", .br,
        "    ", .keyword("func"), " ", .accent("user"), "(id: ", .type("User.ID"),
        ") ", .keyword("async throws"), " -> ", .type("User"), .br,
        "}",
      ],
    )
  }

  static var handlerStep: Self {
    Self(
      filename: "UserHandler.swift",
      body: [
        .keyword("struct"), " ", .type("UserHandler"), ": ", .type("UserServiceHandler"),
        " {", .br,
        "    ", .keyword("func"), " ", .accent("user"), "(id: ", .type("User.ID"),
        ") ", .keyword("async throws"), " -> ", .type("User"), " {", .br,
        "        ", .keyword("try await"), " repository.", .accent("find"), "(id)", .br,
        "    }", .br,
        "}",
      ],
    )
  }

  static var clientStep: Self {
    Self(
      filename: "ProfileView.swift",
      body: [
        .keyword("let"), " user = ", .keyword("try await"), " users.", .accent("user"),
        "(id: selectedID)", .br,
        .accent("print"), "(user.displayName)",
      ],
    )
  }
}
