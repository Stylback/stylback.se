Dockerfiles etc. for production instances.

Run:

```bash
sudo docker build -t jekyll-prod -f prod/Dockerfile .
```

From the project root directory context, run:

```bash
sudo docker compose -f prod/compose.yml up -d --build
```