.PHONY:init-folders
init:
	sh ./scripts/init_filder.sh clickhouse/data
	sh ./scripts/init_filder.sh clickhouse/logs
	# sh ./scripts/init_filder.sh mongo/backups
	# sh ./scripts/init_filder.sh mongo/data
	# sh ./scripts/init_filder.sh mongo/logs
	# sh ./scripts/init_filder.sh mongo/reports
	sh ./scripts/init_filder.sh nats/jetstream/n1/data
	sh ./scripts/init_filder.sh nats/jetstream/n2/data
	sh ./scripts/init_filder.sh nats/jetstream/n3/data
	sh ./scripts/init_filder.sh redis/data

.PHONY:init-docker
init:
	docker-compose up

.PHONY:run-all
run-dev:
	cd clickhouse && docker-compose up -d && cd ..
	cd nats && docker-compose up -d && cd ..
	cd postgres && docker-compose up -d && cd ..
	cd redis && docker-compose up -d && cd ..
