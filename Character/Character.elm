module Character.Character exposing (getCharacterSpeed)

import Character.Bonus exposing (Bonus(..))
import Character.Initial as Character
import Cards.Treasure exposing (Treasure(..))
import Cards.Curse exposing (Curse(..))


-- Speed


getMovementBonusHelper : Bonus -> Int
getMovementBonusHelper characterBonus =
    case characterBonus of
        MovementModifier modifier ->
            modifier

        _ ->
            0


type DiceRolledResult
    = DiceRolledResult --"todo"


getCharacterSpeed : Character.Name -> List Treasure -> List Curse -> Int
getCharacterSpeed name treasures curses =
    let
        movementBonus =
            name
                |> Character.getBonuses
                |> List.map getMovementBonusHelper
                |> List.foldl (+) 0
    in
        movementBonus
