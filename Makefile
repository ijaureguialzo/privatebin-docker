#!make

ifneq (,$(wildcard ./.env))
    include .env
    export
else
$(error No se encuentra el fichero .env)
endif

help: _header
	${info }
	@echo Opciones:
	@echo ----------------------
	@echo start / stop / restart
	@echo clean
	@echo ----------------------

_urls: _header
	${info }
	@echo -----------------------------------------------------
	@echo [PrivateBin] https://privatebin.test
	@echo [Traefik] https://traefik.privatebin.test/dashboard/
	@echo -----------------------------------------------------

_header:
	@echo ----------
	@echo PrivateBin
	@echo ----------

FICHEROS=-f docker-compose.yml

_start-command:
	@docker-compose $$FICHEROS up -d --remove-orphans

start: _start-command _urls

stop:
	@docker-compose $$FICHEROS down

restart: stop start

clean:
	@docker-compose $$FICHEROS down -v --remove-orphans
