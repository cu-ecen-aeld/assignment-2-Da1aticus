# When "CROSS_COMPILE=aarch64-none-linux-gnu-", the program will be build for ARM 


default_target: 
	$(CROSS_COMPILE)gcc -g -Wall -c -o writer.o writer.c 
	$(CROSS_COMPILE)gcc writer.c -o writer
	 


clean:
	rm writer
	rm *.o