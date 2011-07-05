package net.whiteants.slides

import ru.circumflex._, core._
import java.io.File
import org.apache.commons.io.FileUtils

class Slide(val sourceFile: File) {
  def source: String = FileUtils.readFileToString(sourceFile, "UTF-8")
  def html: String = markeven.toHtml(source)
  def title: String = sourceFile.getName
}

object Slide {
  val SLIDES_ROOT = cx.get("slides.root")
      .map(_.toString)
      .getOrElse("src/main/webapp/slides")

  def resolve(uri: String): Option[Slide] = {
    val f = new File(SLIDES_ROOT, uri + ".me")
    if (f.isFile) Some(new Slide(f))
    else None
  }

  def write(uri: String, text: String): Unit = {
    val f = new File(SLIDES_ROOT, uri + ".me")
    FileUtils.writeStringToFile(f, text, "UTF-8")
  }
}