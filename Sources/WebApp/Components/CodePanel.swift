import ElementaryUI

enum CodeKind {
  case hero
  case protocolStep
  case handlerStep
  case clientStep

  var filename: String {
    switch self {
    case .hero: "GreetingService.swift"
    case .protocolStep: "UserService.swift"
    case .handlerStep: "UserHandler.swift"
    case .clientStep: "ProfileView.swift"
    }
  }

  var copyText: String {
    codeLines.map { $0.plainText }.joined(separator: "\n")
  }

  var codeLines: [CodeSnippet.Line] {
    switch self {
    case .hero:
      [
        [.accent("@RPCService")],
        [.keyword("protocol"), " ", .type("GreetingService"), " {"],
        [
          "    ", .keyword("func"), " ", .accent("greet"), "(name: ", .type("String"),
          ") ", .keyword("async throws"), " -> ", .type("String"),
        ],
        ["}"],
        [],
        [
          .keyword("let"), " greeting = ", .keyword("try await"), " client.",
          .accent("greet"), "(name: ", .string("\"Taylor\""), ")",
        ],
      ]
    case .protocolStep:
      [
        [.accent("@RPCService")],
        [.keyword("protocol"), " ", .type("UserService"), " {"],
        [
          "    ", .keyword("func"), " ", .accent("user"), "(id: ", .type("User.ID"),
          ") ", .keyword("async throws"), " -> ", .type("User"),
        ],
        ["}"],
      ]
    case .handlerStep:
      [
        [
          .keyword("struct"), " ", .type("UserHandler"), ": ", .type("UserServiceHandler"),
          " {",
        ],
        [
          "    ", .keyword("func"), " ", .accent("user"), "(id: ", .type("User.ID"),
          ") ", .keyword("async throws"), " -> ", .type("User"), " {",
        ],
        ["        ", .keyword("try await"), " repository.", .accent("find"), "(id)"],
        ["    }"],
        ["}"],
      ]
    case .clientStep:
      [
        [
          .keyword("let"), " user = ", .keyword("try await"), " users.", .accent("user"),
          "(id: selectedID)",
        ],
        [.accent("print"), "(user.displayName)"],
      ]
    }
  }
}

@View
struct CodePanel {
  let kind: CodeKind

  var body: some View {
    div(
      .class(
        kind == .hero
          ? "min-w-0 w-full max-w-140 animate-code-enter overflow-hidden rounded-xl border border-[#253451] bg-code text-[#eef4ff] shadow-code tablet:max-w-none"
          : "min-w-0 overflow-hidden rounded-xl border border-[#253451] bg-code text-[#eef4ff] shadow-code"
      ),
      .data("code-window", value: ""),
    ) {
      CodePanelToolbar(kind: kind)
      pre(
        .class(
          "m-0 min-h-47 overflow-x-auto px-5 py-6 font-mono text-sm leading-[1.65] tab-4 mobile:px-3.5 mobile:py-5 mobile:text-xs"
        ),
        .custom(name: "aria-label", value: "\(kind.filename) source code"),
      ) {
        code {
          CodeSnippet(lines: kind.codeLines)
        }
      }
      CodePanelFooter(kind: kind)
    }
  }
}

@View
private struct CodePanelToolbar {
  let kind: CodeKind

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
        kind.filename
      }
      span(.class("font-mono text-[11px] text-[#93a5c1] mobile:hidden")) { "Swift" }
      button(
        .type(.button),
        .class(
          "inline-flex min-h-9 min-w-18 cursor-pointer items-center justify-center gap-1.5 rounded-[7px] border border-[#40506c] bg-[#1c2a45] px-2.5 py-1.5 font-mono text-[11px] text-[#e7eef9] hover:border-[#788ba8] hover:bg-[#253654] [&.is-success]:border-[#3b9a6c] [&.is-success]:text-[#a8e2c4] [&.is-error]:border-[#d68d65] [&.is-error]:text-[#ffd0b9] mobile:min-w-15.5 mobile:px-2"
        ),
        .data("copy-code", value: kind.copyText),
        .custom(name: "aria-label", value: "Copy \(kind.filename) code"),
      ) {
        span(.custom(name: "aria-hidden", value: "true")) { "□" }
        span(.data("copy-label", value: "")) { "Copy" }
      }
    }
  }
}

@View
private struct CodePanelFooter {
  let kind: CodeKind

  var body: some View {
    if kind == .hero {
      div(
        .class(
          "border-t border-[#253451] bg-[#0c1526] px-5 py-3 font-mono text-[13px] text-[#bce7ca]"
        )
      ) {
        span(.custom(name: "aria-hidden", value: "true")) { "✓" }
        " \"Hello, Taylor!\""
      }
    }

    span(
      .class("sr-only"), .custom(name: "aria-live", value: "polite"),
      .data("copy-status", value: ""),
    ) { "" }
  }
}
