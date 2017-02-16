#Usage

```bash
#
# DONT FORGET TO ADD THIS PORT TO NAT RULES 
#   WHEN USING VIRTUALBOX/VMWARE ON MAC (boot2docker) !!!
#
export PORT=3333

git clone https://github.com/a0s/lifetest.git
cd lifetest
docker build -t lifetest -f docker/Dockerfile .
docker rm -f lifetest && docker run -itd -p ${PORT}:9292 --name lifetest lifetest
curl "localhost:${PORT}/posts" -H "Accept: application/vnd.api+json"
```

#Examples
```bash
curl "localhost:9292/posts" -H "Accept: application/vnd.api+json"
curl "localhost:9292/posts/1/comments" -H "Accept: application/vnd.api+json"
curl "localhost:9292/posts/1/tags" -H "Accept: application/vnd.api+json"
curl "localhost:9292/tags/1" -H "Accept: application/vnd.api+json"
curl "localhost:9292/comments/1" -H "Accept: application/vnd.api+json"
#curl "localhost:9292/tags/1/posts" -H "Accept: application/vnd.api+json"
```
