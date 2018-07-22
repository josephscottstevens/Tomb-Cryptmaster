module Character.Initial
    exposing
        ( Name(..)
        , create
        , getHealth
        , getBonuses
        )

import Die exposing (Die)
import Character.Type exposing (Type(..))
import Character.Class exposing (Class(..))
import Character.Bonus exposing (Bonus(..))


type Name
    = BrotherTanis


getHealth : Name -> Int
getHealth characterName =
    characterName
        |> create
        |> .health


getBonuses : Name -> List Bonus
getBonuses characterName =
    characterName
        |> create
        |> .bonuses


type alias InitialStats =
    { health : Int
    , attackDie : Die
    , skillDie : Die
    , magicDie : Die
    , holinessDie : Die
    , characterType : Type
    , classes : List Class
    , bonuses : List Bonus
    }


create : Name -> InitialStats
create characterName =
    case characterName of
        BrotherTanis ->
            { health = 10
            , attackDie = { green = 0, blue = 0, red = 0 }
            , skillDie = { green = 0, blue = 0, red = 0 }
            , magicDie = { green = 0, blue = 0, red = 0 }
            , holinessDie = { green = 0, blue = 0, red = 0 }
            , characterType = Pariah
            , classes = [ Cleric ]
            , bonuses = [ MovementModifier -3 ]
            }
