module Main exposing (main)

import Character.Initial as Character
import Character.Character as Character
import Html exposing (..)


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


type alias Model =
    { activeCharacter : Character.Name
    }


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )


view : Model -> Html Msg
view model =
    let
        characterSpeed =
            model.activeCharacter
                |> Character.getCharacterSpeed
                |> toString
    in
        div []
            [ text characterSpeed ]


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


init : ( Model, Cmd Msg )
init =
    ( { activeCharacter = Character.BrotherTanis }, Cmd.none )
