FROM python:3.11-alpine 
WORKDIR /app
COPY app/ .
RUN pip install Flask
EXPOSE 8080
CMD ["python", "devops-server.py"] 
