FROM python:3.7-slim AS build

WORKDIR /app

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . .

RUN python ./src/app.py build

FROM python:3.7-slim AS runtime

WORKDIR /app

COPY --from=build /app/dist /app/dist

CMD ["python", "/app/dist/myapp"]