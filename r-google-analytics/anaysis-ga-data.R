

# 필요한 패키지 설치
install.packages("googleAuthR")
install.packages("googleAnalyticsR")
install.packages("jsonlite")

# 패키지 로드
library(googleAuthR)
library(googleAnalyticsR)
library(jsonlite)

# JSON 파일 경로 설정
json_file <- "Quickstart-93ce48675b3f.json"

# OAuth 2.0 인증 설정
gar_auth_service(json_file)

# property = 356464508 로부터 데이터 가져오기
ga_data <- google_analytics_4(viewId = 356464508,
                              date_range = c("2024-01-01", "2024-12-31"),
                              metrics = "sessions",
                              dimensions = "date",
                              anti_sample = TRUE)
