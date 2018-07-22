module Character.Character exposing (getCharacterSpeed)

import Die exposing (Die)
import Character.Bonus exposing (Bonus(..))
import Character.Initial exposing (Name, getBonuses)


--getCharacterMovementModifier : Special -> List GlobalEffect -> List ActiveSpell -> List Equipment -> Int
--getCharacterHealth : List CharacterBonus -> List Wound -> StartingHealth -> Int
--getCharacterHealth partyMembers


type Wound
    = Int


getMovementBonus : Bonus -> Int
getMovementBonus characterBonus =
    case characterBonus of
        MovementModifier modifier ->
            modifier

        _ ->
            0


getCharacterSpeed : Name -> Int
getCharacterSpeed name =
    name
        |> getBonuses
        |> List.map getMovementBonus
        |> List.foldl (+) 0
