.PHONY: all
all:
	make ckan
	make netkan

.PHONY: ckan
ckan:
	rm ckan*.deb -f
	dpkg-deb --build ckan/ .

.PHONY: netkan
netkan:
	rm netkan*.deb -f
	dpkg-deb --build netkan/ .

.PHONY: clean
clean:
	rm *.deb -f
