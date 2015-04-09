.PHONY: all
all:
	@make clean
	@make ckan
	@make netkan

.PHONY: ckan
ckan:	
	@rm ckan*.deb -f
	@fakeroot dpkg-deb --build ckan/ .
	@find ckan*.deb -exec lintian {} \;

.PHONY: netkan
netkan:
	@rm netkan*.deb -f
	@fakeroot dpkg-deb --build netkan/ .
	@find netkan*.deb -exec lintian {} \;

.PHONY: clean
clean:
	@echo "Cleaning up..."
	@find . -name "*~" -delete
	@rm *.deb -f

