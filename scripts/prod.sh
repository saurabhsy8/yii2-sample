docker pull saurabh3460/yii2-prod:latest
docker stop yii2-prod
# docker rm yii2-prod
docker run -d --rm --name yii2-prod -p 80:80 saurabh3460/yii2-prod:latest
docker rmi -f $(docker images -f "dangling=true" -q) 2>/dev/null