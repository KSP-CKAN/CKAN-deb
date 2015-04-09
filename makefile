.PHONY: all
all:
	@make clean
	@make ckan
	@make netkan

.PHONY: ckan
ckan:	
	@rm ckan*.deb -f
	@fakeroot dpkg-deb --build ckan/ .

.PHONY: netkan
netkan:
	@rm netkan*.deb -f
	@fakeroot dpkg-deb --build netkan/ .

.PHONY: clean
clean:
	@find . -name "*~" -delete
	@rm *.deb -f

.PHONY: check
check: ckan netkan
	@echo ""
	@echo "Running lintian on ckan.deb"
	@find ckan*.deb -exec lintian {} \;
	@echo ""
	@echo "Running lintian on netkan.deb"
	@find netkan*.deb -exec lintian {} \;
