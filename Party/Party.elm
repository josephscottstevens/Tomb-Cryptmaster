module Party.Party exposing (getPartySpeed)

import Character.Character as Character
import Character.Initial as Character
import Cards.Treasure exposing (Treasure(..))
import Cards.Curse exposing (Curse(..))


type alias Party =
    { partyMembers : List PartyMember
    }


type alias PartyMember =
    { name : Character.Name
    , treasures : List Treasure
    , curses : List Curse
    }


getPartySpeed : List PartyMember -> Int
getPartySpeed partyMembers =
    partyMembers
        |> List.map (\{ name, treasures, curses } -> Character.getCharacterSpeed name treasures curses)
        |> List.foldl (+) 10
