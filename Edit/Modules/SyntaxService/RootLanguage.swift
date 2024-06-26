import Foundation
import UniformTypeIdentifiers

/// Describes a document root language.
///
/// This type must also be compiled into EditIntents, because the AppIntent infrastructure depends on having the type visible within the module.
public enum RootLanguage: Hashable, CaseIterable, Sendable {
	case go
	case markdown
	case ocaml
	case swift

	var typeIdentifier: UTType {
		switch self {
		case .go: .goSource
		case .markdown: .markdown
		case .ocaml: .ocamlSource
		case .swift: .swiftSource
		}
	}
}

extension RootLanguage: RawRepresentable {
	public static func normalizeLanguageName(_ identifier: String) -> String {
		identifier.lowercased().replacingOccurrences(of: "-", with: "_")
	}

	public init?(rawValue: String) {
		switch Self.normalizeLanguageName(rawValue) {
		case "go":
			self = .go
		case "markdown":
			self = .markdown
		case "ocaml":
			self = .ocaml
		case "swift":
			self = .swift
		default:
			return nil
		}
	}

	public var rawValue: String {
		switch self {
		case .go:
			"Go"
		case .markdown:
			"Markdown"
		case .ocaml:
			"OCaml"
		case .swift:
			"Swift"
		}
	}
}
