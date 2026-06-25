# ================================
# CONFIG
# ================================

COMPOSE = docker-compose          # команда docker compose
SERVICE = postgres_sql21          # имя контейнера postgres
USER = student                    # пользователь БД
# можно менять название и создавать разные базы в одном контейнере,
# но сначала нужно зайти в БД и создать командой \c NAME
DB = data_warehouse

# Запуск контейнеров в фоне
up:
	$(COMPOSE) up -d
# Остановка контейнеров
down:
	$(COMPOSE) down
# Остановка + удаление данных (volume)
delete:
	$(COMPOSE) down -v
# Вывести список запущенных контейнеров
ps:
	docker ps
# Просмотр логов
logs:
	$(COMPOSE) logs -f

pgadmin:
	@echo "http://localhost:5050"

# Подключение к основной БД (sql21)
psql:
	docker exec -it $(SERVICE) psql -U student -d $(DB)

# ================================
# SQL EXECUTION
# ================================

# Выполнение SQL файла:
# пример: make run file=ex00.sql
run:
	docker exec -i $(SERVICE) psql -U $(USER) -d $(DB) < $(file)

# ================================
# SHORTCUTS FOR SCHOOL 21 TASKS
# ================================

ex%: FORCE
		docker exec -i $(SERVICE) psql -U $(USER) -d $(DB) < ex$*/team01_ex$*.sql

FORCE: