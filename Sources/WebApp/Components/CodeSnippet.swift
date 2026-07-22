import ElementaryUI

@View
struct CodeSnippet {
  enum Token: ExpressibleByStringLiteral, Equatable, Sendable {
    case plain(String)
    case keyword(String)
    case type(String)
    case accent(String)
    case string(String)
    case br

    init(stringLiteral value: String) {
      self = .plain(value)
    }

    var text: String {
      switch self {
      case .plain(let text), .keyword(let text), .type(let text), .accent(let text),
        .string(let text):
        text
      case .br:
        "\n"
      }
    }
  }

  let tokens: [Token]

  private var lines: [[Token]] {
    tokens.reduce(into: [[]]) { lines, token in
      if token == .br {
        lines.append([])
      } else {
        lines[lines.endIndex - 1].append(token)
      }
    }
  }

  var body: some View {
    ForEach(Array(lines.enumerated()), key: { $0.offset }) { index, line in
      span(.class("block min-w-full w-max whitespace-pre")) {
        span(
          .class(
            "mr-3.5 inline-block w-7.5 select-none text-[#62728e] mobile:mr-2.25 mobile:w-5.5"
          )
        ) { "\(index + 1)" }
        ForEach(Array(line.enumerated()), key: { $0.offset }) { _, token in
          CodeSnippetToken(token: token)
        }
      }
    }
  }
}

@View
private struct CodeSnippetToken {
  let token: CodeSnippet.Token

  var body: some View {
    switch token {
    case .plain(let text):
      text
    case .keyword(let text):
      span(.class("text-[#c8a7ff]")) { text }
    case .type(let text):
      span(.class("text-[#ffd479]")) { text }
    case .accent(let text):
      span(.class("text-[#ff8a61]")) { text }
    case .string(let text):
      span(.class("text-[#a7dfa8]")) { text }
    case .br:
      ""
    }
  }
}
