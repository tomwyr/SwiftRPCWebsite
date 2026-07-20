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
        switch self {
        case .hero:
            """
            @RPCService
            protocol GreetingService {
                func greet(name: String) async throws -> String
            }

            let greeting = try await client.greet(name: "Taylor")
            """
        case .protocolStep:
            """
            @RPCService
            protocol UserService {
                func user(id: User.ID) async throws -> User
            }
            """
        case .handlerStep:
            """
            struct UserHandler: UserServiceHandler {
                func user(id: User.ID) async throws -> User {
                    try await repository.find(id)
                }
            }
            """
        case .clientStep:
            """
            let user = try await users.user(id: selectedID)
            print(user.displayName)
            """
        }
    }
}

@View
struct CodePanel {
    let kind: CodeKind

    var body: some View {
        div(.class(kind == .hero ? "code-window hero-code" : "code-window")) {
            div(.class("code-titlebar")) {
                div(.class("window-controls"), .custom(name: "aria-hidden", value: "true")) {
                    span { "" }
                    span { "" }
                    span { "" }
                }
                span(.class("code-filename")) { kind.filename }
                span(.class("language-label")) { "Swift" }
                button(
                    .type(.button),
                    .class("copy-button"),
                    .data("copy-code", value: kind.copyText),
                    .custom(name: "aria-label", value: "Copy \(kind.filename) code")
                ) {
                    span(.class("copy-icon"), .custom(name: "aria-hidden", value: "true")) { "□" }
                    span(.data("copy-label", value: "")) { "Copy" }
                }
            }
            pre(.class("code-content"), .custom(name: "aria-label", value: "\(kind.filename) source code")) {
                code {
                    if kind == .hero {
                        HeroCode()
                    } else if kind == .protocolStep {
                        ProtocolCode()
                    } else if kind == .handlerStep {
                        HandlerCode()
                    } else {
                        ClientCode()
                    }
                }
            }
            if kind == .hero {
                div(.class("code-response")) {
                    span(.custom(name: "aria-hidden", value: "true")) { "✓" }
                    " \"Hello, Taylor!\""
                }
            }
            span(.class("sr-only"), .custom(name: "aria-live", value: "polite"), .data("copy-status", value: "")) { "" }
        }
    }
}

@View
struct HeroCode {
    var body: some View {
        span(.class("code-line")) {
            span(.class("line-number")) { "1" }
            span(.class("syntax-macro")) { "@RPCService" }
        }
        span(.class("code-line")) {
            span(.class("line-number")) { "2" }
            span(.class("syntax-keyword")) { "protocol" }
            " "
            span(.class("syntax-type")) { "GreetingService" }
            " {"
        }
        span(.class("code-line")) {
            span(.class("line-number")) { "3" }
            "    "
            span(.class("syntax-keyword")) { "func" }
            " "
            span(.class("syntax-method")) { "greet" }
            "(name: "
            span(.class("syntax-type")) { "String" }
            ") "
            span(.class("syntax-keyword")) { "async throws" }
            " -> "
            span(.class("syntax-type")) { "String" }
        }
        span(.class("code-line")) {
            span(.class("line-number")) { "4" }
            "}"
        }
        span(.class("code-line")) {
            span(.class("line-number")) { "5" }
            " "
        }
        span(.class("code-line")) {
            span(.class("line-number")) { "6" }
            span(.class("syntax-keyword")) { "let" }
            " greeting = "
            span(.class("syntax-keyword")) { "try await" }
        }
        span(.class("code-line code-indent")) {
            span(.class("line-number")) { " " }
            "client."
            span(.class("syntax-method")) { "greet" }
            "(name: "
            span(.class("syntax-string")) { "\"Taylor\"" }
            ")"
        }
    }
}

@View
struct ProtocolCode {
    var body: some View {
        span(.class("code-line")) { span(.class("line-number")) { "1" }; span(.class("syntax-macro")) { "@RPCService" } }
        span(.class("code-line")) { span(.class("line-number")) { "2" }; span(.class("syntax-keyword")) { "protocol" }; " "; span(.class("syntax-type")) { "UserService" }; " {" }
        span(.class("code-line")) { span(.class("line-number")) { "3" }; "    "; span(.class("syntax-keyword")) { "func" }; " "; span(.class("syntax-method")) { "user" }; "(id: "; span(.class("syntax-type")) { "User.ID" }; ") "; span(.class("syntax-keyword")) { "async throws" }; " -> "; span(.class("syntax-type")) { "User" } }
        span(.class("code-line")) { span(.class("line-number")) { "4" }; "}" }
    }
}

@View
struct HandlerCode {
    var body: some View {
        span(.class("code-line")) { span(.class("line-number")) { "1" }; span(.class("syntax-keyword")) { "struct" }; " "; span(.class("syntax-type")) { "UserHandler" }; ": "; span(.class("syntax-type")) { "UserServiceHandler" }; " {" }
        span(.class("code-line")) { span(.class("line-number")) { "2" }; "    "; span(.class("syntax-keyword")) { "func" }; " "; span(.class("syntax-method")) { "user" }; "(id: "; span(.class("syntax-type")) { "User.ID" }; ") "; span(.class("syntax-keyword")) { "async throws" }; " -> "; span(.class("syntax-type")) { "User" }; " {" }
        span(.class("code-line")) { span(.class("line-number")) { "3" }; "        "; span(.class("syntax-keyword")) { "try await" }; " repository."; span(.class("syntax-method")) { "find" }; "(id)" }
        span(.class("code-line")) { span(.class("line-number")) { "4" }; "    }" }
        span(.class("code-line")) { span(.class("line-number")) { "5" }; "}" }
    }
}

@View
struct ClientCode {
    var body: some View {
        span(.class("code-line")) { span(.class("line-number")) { "1" }; span(.class("syntax-keyword")) { "let" }; " user = "; span(.class("syntax-keyword")) { "try await" }; " users."; span(.class("syntax-method")) { "user" }; "(id: selectedID)" }
        span(.class("code-line")) { span(.class("line-number")) { "2" }; span(.class("syntax-method")) { "print" }; "(user.displayName)" }
    }
}
