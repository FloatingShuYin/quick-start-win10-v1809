set hostPath=%windir%\System32\drivers\etc\hosts

attrib -R %hostPath%
@echo 151.101.44.249 github.global.ssl.fastly.net>>%hostPath%
@echo 192.30.253.113 github.com>>%hostPath%
@echo 103.245.222.133 assets-cdn.github.com>>%hostPath%
@echo 23.235.47.133 assets-cdn.github.com>>%hostPath%
@echo 203.208.39.104 assets-cdn.github.com>>%hostPath%
@echo 204.232.175.78 documentcloud.github.com>>%hostPath%
@echo 204.232.175.94 gist.github.com>>%hostPath%
@echo 107.21.116.220 help.github.com>>%hostPath%
@echo 207.97.227.252 nodeload.github.com>>%hostPath%
@echo 199.27.76.130 raw.github.com>>%hostPath%
@echo 107.22.3.110 status.github.com>>%hostPath%
@echo 204.232.175.78 training.github.com>>%hostPath%
@echo 207.97.227.243 www.github.com>>%hostPath%
@echo 185.31.16.184 github.global.ssl.fastly.net>>%hostPath%
@echo 185.31.18.133 avatars0.githubusercontent.com>>%hostPath%
@echo 185.31.19.133 avatars1.githubusercontent.com>>%hostPath%
ipconfig /flushdns