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
	sh ./scripts/init_folder.sh postgres/data
	sh ./scripts/init_folder.sh postgres/backup

.PHONY:init-docker-volume
init-docker-volume:
	sh ./scripts/init_volume.sh clickhouse/data clickhouse_db_data
	sh ./scripts/init_volume.sh clickhouse/logs clickhouse_db_logs
	sh ./scripts/init_volume.sh nats/jetstream/n1/data jetstream_cluster_n1
	sh ./scripts/init_volume.sh nats/jetstream/n2/data jetstream_cluster_n2
	sh ./scripts/init_volume.sh nats/jetstream/n3/data jetstream_cluster_n3
	sh ./scripts/init_volume.sh redis/data redis_data
	sh ./scripts/init_volume.sh postgres/data postgres_data
	sh ./scripts/init_volume.sh postgres/backup postgres_backup

.PHONY:init-docker-network
init-docker-network:
	sh ./scripts/init_network.sh postgres
	sh ./scripts/init_network.sh clickhouse-db
	sh ./scripts/init_network.sh nats
	sh ./scripts/init_network.sh redis-db

.PHONY:run-all
run-all:
	cd clickhouse && docker-compose up -d && cd ..
	cd nats && docker-compose up -d && cd ..
	cd postgres && docker-compose up -d && cd ..
	cd redis && docker-compose up -d && cd ..

.PHONY:connect-to-bridge
connect-to-bridge:
	sh ./scripts/connect_bridge.sh postgres
	sh ./scripts/connect_bridge.sh clickhouse-db
	sh ./scripts/connect_bridge.sh redis-db
	sh ./scripts/connect_bridge.sh n1
	sh ./scripts/connect_bridge.sh n2
	sh ./scripts/connect_bridge.sh n3
	docker network inspect bridge
