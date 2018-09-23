let _ =
  let open Webapi.Dom in
  let button = document |> Document.createElement "button" in

  let body =
    document
    |> Document.asHtmlDocument
    |> Js.Option.andThen (fun [@bs] e -> HtmlDocument.body e)
    |> Js.Option.getExn
  in

  let _ =
    Element.setInnerText button "Click Me!";
    Element.appendChild button body
  in

  CallbagFromEvent.from_event button "click"
  |> CallbagForEach.for_each Js.log
