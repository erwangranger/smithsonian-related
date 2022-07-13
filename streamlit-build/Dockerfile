FROM python:3.10.4

WORKDIR /app

# RUN pwd
RUN git clone https://github.com/wjbmattingly/dap_app.git ;\
    ls -al

WORKDIR /app/dap_app/

RUN pip install -r requirements.txt

RUN pip list > piplist.txt

# override default port (from 8501 to 8080)
ENV STREAMLIT_SERVER_PORT=8080
# these variables might be needed for the right info (logging) to show up in the log
ENV PYTHONUNBUFFERED=1
ENV PYTHONIOENCODING=UTF-8

EXPOSE 8080

ENTRYPOINT ["streamlit", "run"]

CMD ["app.py"]