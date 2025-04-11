#' 시스템 폰트 등록 함수
#'
#' tapaviz에 포함된 NotoSansKR 폰트를 시스템에 등록합니다.
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
    # 'notosans' 폰트를 등록하지 못했습니다. 폰트 파일 경로를 확인하세요.
    # → 다음처럼 바꿔줘
    packageStartupMessage("⚠ failed to enroll notosans font. please check the route of the font files")

  }
}
