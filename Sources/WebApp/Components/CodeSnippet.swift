import ElementaryUI

@View
struct CodeSnippet {
  struct Line: ExpressibleByArrayLiteral, Equatable, Sendable {
    let fragments: [Fragment]

    init(arrayLiteral fragments: Fragment...) {
      self.fragments = fragments
    }

    var plainText: String {
      fragments.map { $0.text }.joined()
    }
  }

  enum Fragment: ExpressibleByStringLiteral, Equatable, Sendable {
    case plain(String)
    case keyword(String)
    case type(String)
    case accent(String)
    case string(String)

    init(stringLiteral value: String) {
      self = .plain(value)
    }

    var text: String {
      switch self {
      case .plain(let text), .keyword(let text), .type(let text), .accent(let text),
        .string(let text):
        text
      }
    }
  }

  let lines: [Line]

  var body: some View {
    ForEach(Array(lines.enumerated()), key: { $0.offset }) { index, line in
      span(.class("block min-w-full w-max whitespace-pre")) {
        span(
          .class(
            "mr-3.5 inline-block w-7.5 select-none text-[#62728e] mobile:mr-2.25 mobile:w-5.5"
          )
        ) { "\(index + 1)" }
        ForEach(Array(line.fragments.enumerated()), key: { $0.offset }) { _, fragment in
          CodeSnippetFragment(fragment: fragment)
        }
      }
    }
  }
}

@View
private struct CodeSnippetFragment {
  let fragment: CodeSnippet.Fragment

  var body: some View {
    switch fragment {
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
    }
  }
}
