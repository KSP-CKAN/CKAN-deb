.PHONY: all
all:
	@make clean
	@make buildPerms
	@make ckan
	@make netkan

.PHONY: ckan
ckan:	
	@rm ckan*.deb -f
	@dpkg-deb --build ckan/ .
	find ckan*.deb -exec lintian {} \;

.PHONY: netkan
netkan:
	@rm netkan*.deb -f
	@dpkg-deb --build netkan/ .
	find netkan*.deb -exec lintian {} \;

.PHONY: clean
clean:
	@echo "Cleaning up..."
	@find . -name "*~" -delete
	@rm *.deb -f

.PHONY: buildPerms
buildPerms:
	./buildPerms.sh

.PHONY: usrPerms
usrPerms:
	./usrPerms.sh

