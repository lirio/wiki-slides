package net.whiteants.slides

import ru.circumflex._, core._, web._, freemarker._

class Main extends RequestRouter {

  'uri := uri(0)

  get("*/") = Slide.resolve(uri(0) + "index") map { slide =>
    'slide := slide
    ftl("/index.ftl")
  } getOrElse redirect(uri(0) + "index.html.e")

  get("/*.html").and(request.body.xhr_?) =
      Slide.resolve(uri(1)).map(_.html).getOrElse("<div class='not-found'></div>")

  get("/*.html") =
      Slide.resolve(uri(1)) map { slide =>
        'slide := slide
        ftl("/show.ftl")
      } getOrElse redirect(uri(0) + ".e")

  get("/*.html.e") = {
    'slide := Slide.resolve(uri(1))
    ftl("/edit.ftl")
  }

  post("/*.html.e") = {
    Slide.write(uri(1), param("c"))
    redirect(uri(1) + ".html")
  }

}






