// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetCharacterQuery: GraphQLQuery {
  public static let operationName: String = "GetCharacter"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetCharacter($id: ID!) { character(id: $id) { __typename id name image } }"#
    ))

  public var id: ID

  public init(id: ID) {
    self.id = id
  }

  public var __variables: Variables? { ["id": id] }

  public struct Data: RickMorty.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { RickMorty.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("character", Character?.self, arguments: ["id": .variable("id")]),
    ] }

    /// Get a specific character by ID
    public var character: Character? { __data["character"] }

    /// Character
    ///
    /// Parent Type: `Character`
    public struct Character: RickMorty.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { RickMorty.Objects.Character }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("id", RickMorty.ID?.self),
        .field("name", String?.self),
        .field("image", String?.self),
      ] }

      /// The id of the character.
      public var id: RickMorty.ID? { __data["id"] }
      /// The name of the character.
      public var name: String? { __data["name"] }
      /// Link to the character's image.
      /// All images are 300x300px and most are medium shots or portraits since they are intended to be used as avatars.
      public var image: String? { __data["image"] }
    }
  }
}
