# README

```sh
docker run -it --rm --platform linux/amd64 -u root -p 8000:8000 py
uv run manage.py migrate
uv run manage.py createsuperuser --username admin --email admin@example.com

uv run manage.py runserver 0.0.0.0:8000
```
