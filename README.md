# tapaviz : 뉴스타파 데이터팀 시각화 프로토타입

아직 개발 중...

## 설치 방법

    install.packages("devtools") # 이 라이브러리가 없으면 설치해주세요
    library(devtools)
    devtools::install_github("jiyeonvis/tapaviz", force=T)
    library(tapaviz)

## 패키지 함수

### register_fonts()
tapaviz에서 사용하는 폰트를 설치하는 함수입니다. 한 번만 실행하시면 됩니다. 차트 제작에 필요한 폰트(NotoSansKR 등)를 시스템에 등록합니다.

    register_fonts()

### nt_style(panel=TRUE, gridLines="x", legend="top")

tapaviz의 기본 스타일을 적용하는 함수입니다. 기본 값은 `panel=TRUE, gridLines="x", legend="top"`로 설정되어 있습니다

panel=TRUE면 차트 밑배경이 회색으로 채워집니다. panel=FALSE면 밑배경이 사라집니다.

gridLines으로 x축과 y축의 유무를 설정할 수 있습니다. x축만 그리면 gridLines="x", y축만 그리면 gridLines="y", 모두 그리면 "both". 축 없애고 싶으면 그 외 다른 텍스트 입력

legend로 범례 위치를 지정합니다. "top", "bottom", "left", "right"으로 위치를 설정할 수  있습니다. 범례를 없애고 싶으면 "none"을 입력하세요. 


(아직 좀 불친절한) 예제 코드는 아래와 같습니다

    chart.data %>% mutate(minus = -1*minus,
                 시도 = factor(시도, levels=order.sido %>% rev)) %>% 
    gather(2:3, key="key", value="value") %>% 
    ggplot(aes(x=시도, y=value, group=key, fill=key)) +
    geom_bar(stat="identity", width=0.8) +
    coord_flip() +
    scale_fill_manual(values=c("minus"="#E64E53", "plus"="#3D89C3")) +
    geom_hline(yintercept=0, size=0.5)+
    nt_style(panel=F, legend="none")
    
## 문의
jiyeon@newstapa.org
