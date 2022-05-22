run:
	nasm -f macho64 src/fizz_buzz.asm -o target/fizz_buzz.o
	ld -macosx_version_min 10.7.0 -lSystem -o target/fizz_buzz target/fizz_buzz.o
	./target/fizz_buzz

clean:
	rm -rf target/*
