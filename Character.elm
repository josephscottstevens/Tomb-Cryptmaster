module Character exposing (CharacterName(..))

import Die exposing (Die)


type Class
    = Cleric
    | Fighter
    | Wizard
    | Rogue


type Type
    = CharacterNone
    | Pariah
    | Mercenary


type Bonus
    = MovementModifier Int
    | HealthModifier Int



--getCharacterMovementModifier : Special -> List GlobalEffect -> List ActiveSpell -> List Equipment -> Int
--getCharacterHealth : List CharacterBonus -> List Wound -> StartingHealth -> Int
--getCharacterHealth partyMembers


type Wound
    = Int


type CharacterName
    = BrotherTanis


getMovementBonus : Bonus -> Int
getMovementBonus characterBonus =
    case characterBonus of
        MovementModifier modifier ->
            modifier

        _ ->
            0


getCharacterSpeed : CharacterName -> Int
getCharacterSpeed characterName =
    let
        character =
            initialCharacterStats characterName

        movementBonus =
            getMovementBonus character.bonus
    in
        movementBonus


initialCharacterStats : CharacterName -> InitialCharacterStats
initialCharacterStats characterName =
    case characterName of
        BrotherTanis ->
            { health = 10
            , attackDie = { green = 0, blue = 0, red = 0 }
            , skillDie = { green = 0, blue = 0, red = 0 }
            , magicDie = { green = 0, blue = 0, red = 0 }
            , holinessDie = { green = 0, blue = 0, red = 0 }
            , characterType = Pariah
            , classes = [ Cleric ]
            , bonus = MovementModifier -3
            }


type alias InitialCharacterStats =
    { health : Int
    , attackDie : Die
    , skillDie : Die
    , magicDie : Die
    , holinessDie : Die
    , characterType : Type
    , classes : List Class
    , bonus : Bonus
    }
