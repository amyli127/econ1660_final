PYTHON = python3

.PHONY = help download-master download-raw test clean
.DEFAULT_GOAL = help

current_dir = $(shell pwd)

remote = https://srv-store5.gofile.io/download/epSFkN

# generate the desired project file structure
setup:

	[ -d ${current_dir}/data/bigfiles ] || mkdir ${current_dir}/data/bigfiles

help:
	@echo "---------------HELP-----------------"
	@echo "To download necessary data type make download-master"
	@echo "To test the project type make test"
	@echo "------------------------------------"

# download clean order data
download-master: setup

	[ -f ${current_dir}/data/bigfiles/master_orders.txt ] || curl ${remote}/master_orders.txt -o ${current_dir}/data/bigfiles/master_orders.txt --progress-bar
	[ -f ${current_dir}/data/bigfiles/master_users.txt ] || curl ${remote}/master_users.txt -o ${current_dir}/data/bigfiles/master_users.txt --progress-bar
	[ -f ${current_dir}/data/bigfiles/master_stores.txt ] || curl ${remote}/master_stores.txt -o ${current_dir}/data/bigfiles/master_stores.txt --progress-bar

# download raw order data
download-raw:
	# TODO

# run all tests
test:
	@echo "beginning tests..."
	@echo "finished tests!"

# clean out generated + downloaded data files. WILL DELETE ALL FILES IN BIGFILES!
clean: setup

	rm -r ${current_dir}/data/bigfiles* 