FROM python:3.12-slim
ENV PYTHONDONTWRITEBYTECODE=1 PYTHONUNBUFFERED=1
WORKDIR /app
COPY requirements-radix.txt /app/requirements.txt
RUN pip install --no-cache-dir -r /app/requirements.txt \
    && groupadd --gid 1001 appgroup \
    && useradd --uid 1001 --gid 1001 --no-create-home appuser \
    && chown 1001:1001 /app
COPY --chown=1001:1001 lng_ori_workspace_radix.py /app/lng_ori_workspace_radix.py
USER 1001:1001
EXPOSE 8501
CMD ["python", "-u", "/app/lng_ori_workspace_radix.py"]
