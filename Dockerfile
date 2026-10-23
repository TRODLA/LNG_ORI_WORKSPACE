FROM python:3.12-slim

RUN useradd -u 1001 -m appuser

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /app

COPY requirements.txt .

RUN python -m pip install --no-cache-dir --upgrade pip setuptools wheel \
    && python -m pip install --no-cache-dir -r requirements.txt

COPY . .

RUN chown -R 1001:1001 /app

USER 1001

EXPOSE 8501

CMD ["streamlit", "run", "lng_ori_workspace.py", \
     "--server.address=0.0.0.0", \
     "--server.port=8501"]
