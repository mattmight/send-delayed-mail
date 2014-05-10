.PHONY: all

all: bin/send-delayed-mail

config.sh config.sed:
	bash setup.sh

bin:
	mkdir bin

bin/send-delayed-mail: bin src/send-delayed-mail.sh config.sed 
	sed -f config.sed src/send-delayed-mail.sh > bin/send-delayed-mail
	chmod u+rx bin/send-delayed-mail

install: bin/send-delayed-mail 
	cp bin/send-delayed-mail $$HOME/bin/

clean:
	rm -rfv bin config.sh config.sed

