#' NEWSTAPA 스타일 ggplot 테마
#'
#' @param panel 배경 패널을 표시할지 여부
#' @param gridLines 'x', 'y', 'both', 'none' 중 선택
#' @param legend 범례 위치 ('top', 'bottom', 'left', 'right')
#' @return ggplot2 theme object
#' @export
nt_style <- function(panel=TRUE, gridLines="x", legend="top") { # default

  plot_background <- ggplot2::element_rect(fill = "#ffffff", color = NA)
  plot_title <- ggplot2::element_text(size=ggplot2::unit(33, "pt"), family="notosans", face="bold",lineheight=1.1,
                                      margin = ggplot2::margin(t = 10, l = 0, b = 7, r = 0))
  plot_subtitle <- ggplot2::element_text(size=ggplot2::unit(20, "pt"), family="notosans",lineheight=1.1,
                                         margin = ggplot2::margin(t = 0, l = 0, b = 10, r = 0))

  plot_caption <- ggplot2::element_text(
    size=12, family="notosans", color="#888", lineheight=1.2,
    margin = ggplot2::margin(t = 15, l = 0, b = 0, r = 0)
  )

  #panel - 필요 없는 경우도 있을 듯?
  if(panel) {
    panel_background <- ggplot2::element_rect(fill = "#Efefef")
  } else {
    panel_background = ggplot2::element_blank()
  }

  panel_grid_minor <- ggplot2::element_blank()
  if(gridLines == "x") {
    panel_grid_major_y <- ggplot2::element_blank()
    panel_grid_major_x <- ggplot2::element_line(color = "#cbcbcb")
  } else if(gridLines=="y") {
    panel_grid_major_y <- ggplot2::element_line(color = "#cbcbcb")
    panel_grid_major_x <- ggplot2::element_blank()
  } else if (gridLines=="both") {
    panel_grid_major_y <- ggplot2::element_line(color = "#cbcbcb")
    panel_grid_major_x <- ggplot2::element_line(color = "#cbcbcb")
  } else {
    panel_grid_major_y <- ggplot2::element_blank()
    panel_grid_major_x <- ggplot2::element_blank()
  }


  legend_margin <- ggplot2::margin(t = 0, l = 0, b = 0, r = 0)
  legend_position <- legend

  legend_key_width <- ggplot2::unit(16, "pt")
  legend_key_height <- ggplot2::unit(14, "pt")
  legend_key <- ggplot2::element_blank()
  legend_text <- ggplot2::element_text(size = 14,family="notosans")
  legend_title <- ggplot2::element_blank()

  axis_title <- ggplot2::element_blank() # text(color = "#333", size=14,family="notosans")
  axis_text <- ggplot2::element_text(color = "#333", size=15,family="notosans")
  axis_ticks <-ggplot2::element_blank()



  ggplot2::theme(
    plot.margin = ggplot2::margin(10, 20, 10, 20, unit="pt"),
    plot.background = plot_background,
    plot.title = plot_title,
    plot.subtitle = plot_subtitle,

    panel.background = panel_background,

    #panel grid - 경우의 수 추가 필요
    panel.grid.minor = panel_grid_minor,
    panel.grid.major.y = panel_grid_major_y,
    panel.grid.major.x = panel_grid_major_x,

    # legend
    # legend.background = element_rect(fill = "#EC4899"), # 디버깅용
    legend.margin = legend_margin,
    legend.position = legend_position,

    legend.key.width = legend_key_width,
    legend.key.height = legend_key_height ,
    legend.key= legend_key, # 배경색 없애기
    legend.text = legend_text,
    legend.title = legend_title, # 색 구분되는 변수명 가리기; 변수명이 필요하면 legend.title = element_text()

    # axis
    axis.title = axis_title,
    axis.text = axis_text,
    axis.ticks = axis_ticks,

    # 주석
    plot.caption = plot_caption
    # caption에 아무 내용이 없다면(그렇지만 출처에 아무 내용이 없을 수는 없어요) plot.caption= element_blank()
  )
}
