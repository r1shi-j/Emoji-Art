//
//  Palette.swift
//  Emoji Art
//
//  Created by Rishi Jansari on 19/07/2024.
//

import Foundation

struct Palette: Identifiable, Codable, Hashable {
    var name: String
    var emojis: String
    var id = UUID()
    
    static var builtins: [Palette] { [
        Palette(name: "Vehicles", emojis: "🚗🚕🚙🚌🚎🏎️🚓🚑🚒🚐🛻🚚🚛🚜🛵🏍️🛺🚃🚅✈️🛩️🚀🛸🚁🚤🛥️"),
        Palette(name: "Sports", emojis: "⚽️🏀🏈⚾️🥎🎾🏐🏉🥏🎱"),
        Palette(name: "Music", emojis: "🎼🎤🎧🎹🪇🥁🪘🎷🎺🪗🎸🪕🎻🪈"),
        Palette(name: "Animals", emojis: "🐥🦉🦇🐺🐗🐴🦄🐛🐌🐙🦖🐠🐊🐅🦓🦏🦧🦍🐪🦣🐘🐃🦓🦘🐏🐖🐑🫏🐕🦌🐕‍🦺🐓🐁🐀🦫🦝🐿️🌲🦔🦥🦨🦩🐄🐛"),
        Palette(name: "Animal Faces", emojis: "🐶🐱🐭🐹🐼🦁🐯🐻🦊🐨🐻‍❄️🐰🐵🐷🐮🐸🐔🐧🐦🐤"),
        Palette(name: "Weather", emojis: "🌤️⛅️🌥️☁️🌦️🌧️⛈️🌩️❄️💨☂️"),
        Palette(name: "Faces", emojis: "😀😃😄😁😆🥹😅😂🤣🥲☺️😊😇🙂🙃😉😌😍🥰😘😗😙😚😋😛😝😜🤪🤨🧐🤓😎🤩🥳🙂‍↕️😞🙂‍↔️😒😏😔😟😕🙁😫😖😣☹️🥺😢😭😤😠😡🤬🥶🥵😳🤯😶‍🌫️😱😨😰🤔🫡🫢😓😥🫣🤭🤫🫠🤥😶😑🫤😐🫥🫨😬🙄😯😲😮😧😦🥱😴🤤😪🤐🤧🤮😵‍💫😵😮‍💨🤢😷🤒🤕🤑🤠")
    ]
    }
}
