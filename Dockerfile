FROM nikolaik/python-nodejs:python3.11-nodejs20

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 5000

CMD ["gunicorn", "app:app", "--timeout", "120", "--workers", "2", "--bind", "0.0.0.0:5000"]