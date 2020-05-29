module Page exposing (Page(..), view)

import Browser
import Element
import FontAwesome.Styles as Icon


type Page
    = Other


view : Page -> String -> Browser.Document msg
view page title =
    Browser.Document ("Domain | " ++ title)
        [ Icon.css, Element.layout [] <| Element.text "domain content" ]
