package net.whiteants

import ru.circumflex._, core._, web._, freemarker._
import java.util.Date

class Main extends RequestRouter {
  val log = new Logger("net.whiteants")

  'currentDate := new Date
  'title := Slides.title


  get("/") = {
    'slides := Slides.all
    ftl("index.ftl")
  }

  get("/test") = "I'm fine, thanks!"

}






