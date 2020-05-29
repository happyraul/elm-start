module Main exposing (main)

import Browser
import Browser.Navigation as Nav
import Page
import Url



-- MAIN


main : Program () Model Msg
main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlChange = ChangedUrl
        , onUrlRequest = ClickedLink
        }



-- MODEL


type Model
    = Home Nav.Key String


init : () -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init () url navKey =
    ( Home navKey "Play!", Cmd.none )



-- UPDATE


type Msg
    = Ignored
    | ClickedLink Browser.UrlRequest
    | ChangedUrl Url.Url


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case ( msg, model ) of
        ( Ignored, _ ) ->
            ( model, Cmd.none )

        ( ClickedLink urlRequest, Home navKey _ ) ->
            case urlRequest of
                Browser.Internal url ->
                    ( model, Nav.pushUrl navKey (Url.toString url) )

                Browser.External href ->
                    ( model, Nav.load href )

        ( ChangedUrl url, _ ) ->
            ( model, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view : Model -> Browser.Document Msg
view model =
    case model of
        Home _ title ->
            Page.view Page.Other title
