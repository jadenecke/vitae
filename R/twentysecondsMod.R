#' Twenty Seconds CV template
#'
#' A curriculum vitae, otherwise known as a CV or résumé, is a document used by
#' individuals to communicate their work history, education and skill set. This
#' is a style template for your curriculum written in LaTex. The main goal of
#' this template is to provide a curriculum that is able to survive to the
#' résumés screening of "twenty seconds":
#' https://github.com/spagnuolocarmine/TwentySecondsCurriculumVitae-LaTex
#'
#' @param \dots Arguments passed to \code{\link[vitae]{cv_document}}.
#'
#' @section Preview:
#' `r insert_preview("twentyseconds")`
#'
#' @return An R Markdown output format object.
#'
#' @author Mitchell O'Hara-Wild, theme by Carmine Spagnuolo
#' ([@spagnuolocarmine](https://github.com/spagnuolocarmine))
#'
#' @export
twentysecondsMod <- function(...) {
  template <- system.file("rmarkdown", "templates", "twentysecondsMod",
                          "resources", "twentysecondstemplateMod.tex",
                          package = "vitae"
  )
  set_entry_formats(twentyseconds_cv_entries)
  copy_supporting_files("twentysecondsMod")
  cv_document(..., template = template)
}


twentyseconds_cv_entries <- new_entry_formats(
  brief = function(what, when, with){
    with <- lapply(with, function(x){
      if(length(x) == 0) return("")
      return(paste(". ", x, collapse = "\n"))
    })

    paste(
      c(
        "\\nopagebreak\\begin{twentyshort}",
        glue_alt("\t\\twentyitemshort{<<when>>}{<<what>><<with>>}"),
        "\\end{twentyshort}"
      ),
      collapse = "\n"
    )
  },
  detailed = function(what, when, with, where, why){
    why <- lapply(why, function(x) {
      if(length(x) == 0) return("")
      paste(c(
        "\\begin{minipage}{0.9\\textwidth}%",
        "\\begin{itemize}%",
        paste0("\\item ", x, "%"),
        "\\end{itemize}%",
        "\\end{minipage}"
      ), collapse = "\n")
    })
    where <- ifelse(where == "", "", paste0(where, ""))

    paste(c(
      "\\nopagebreak\\begin{twenty}",
      glue_alt("\t\\twentyitem{<<when>>}{<<what>>}{<<with>>}{<<where>>}{<<why>>}"),
      "\\end{twenty}"
    ), collapse = "\n")
  }
)
