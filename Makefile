.PHONY:init-folders
init-folders:
	sh ./scripts/init_folder.sh clickhouse/data
	sh ./scripts/init_folder.sh clickhouse/logs
	# sh ./scripts/init_folder.sh mongo/backups
	# sh ./scripts/init_folder.sh mongo/data
	# sh ./scripts/init_folder.sh mongo/logs
	# sh ./scripts/init_folder.sh mongo/reports
	sh ./scripts/init_folder.sh nats/jetstream/n1/data
	sh ./scripts/init_folder.sh nats/jetstream/n2/data
	sh ./scripts/init_folder.sh nats/jetstream/n3/data
	sh ./scripts/init_folder.sh redis/data

.PHONY:init-docker
init-docker:
	docker compose up

.PHONY:run-all
run-all:
	cd clickhouse && docker compose up -d && cd ..
	cd nats && docker compose up -d && cd ..
	cd postgres && docker compose up -d && cd ..
	cd redis && docker compose up -d && cd ..
