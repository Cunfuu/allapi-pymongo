FROM python:3.9-alpine as base
WORKDIR /app
COPY . /app

FROM base AS dependencies  
COPY requirements.txt ./
RUN pip install -r requirements.txt

FROM dependencies AS build  
WORKDIR /app
COPY . /app


FROM python:3.9-alpine AS release  
WORKDIR /app
COPY --from=dependencies /app/requirements.txt ./
COPY --from=dependencies /root/.cache /root/.cache
COPY --from=dependencies /app /app

RUN pip install -r requirements.txt
EXPOSE 8080
WORKDIR /app
ENTRYPOINT ["python"]
CMD ["src/app.py"]