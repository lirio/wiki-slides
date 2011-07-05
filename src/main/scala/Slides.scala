package  net.whiteants

import ru.circumflex._, core._, web._, markeven._
import xml._
import java.io.File

object Slides {
  val descriptor = new File(getClass.getResource("/slideshow.xml").toURI)

  val
  title = (XML.loadFile(descriptor) \\ "title").text

  lazy val all:Seq[Slide] = (XML.loadFile(descriptor) \\ "slides" \ "slide").flatMap {
    case e: Elem => Some(new Slide(e))
    case _ => None
  }
  def getById(id: String): Option[Slide] = all.find(_.id == id)
}

class Slide(e:Elem) {
  val id = (e \ "@id").text
  val content = toHtml(e.text)
}











