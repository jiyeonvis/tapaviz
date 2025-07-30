#'
#'
#' register NosoSansKR
#'
#' @export
register_fonts <- function() {
  font_dir <- system.file("fonts", package = "tapaviz")

  regular   <- file.path(font_dir, "NotoSansKR-Regular.ttf")
  bold      <- file.path(font_dir, "NotoSansKR-Bold.ttf")

# -------------------------------------------------------------------------


  if (file.exists(regular)) {
    sysfonts::font_add(
      family = "notosans",
      regular = regular,
      bold = bold
    )
    showtext::showtext_auto()
  } else {
    packageStartupMessage("failed to enroll notosans font. please check the route of the font files")

  }
}
