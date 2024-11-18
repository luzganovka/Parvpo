FROM alpine
RUN apk update && apk add g++ git
RUN git clone https://github.com/luzganovka/Parvpo-lab1.git
WORKDIR /Parvpo-lab1
RUN g++ hard_work.cpp -fopenmp -o hard_work
ENTRYPOINT ["./hard_work"]
#CMD ./hard_work > output/output.txt
#CMD ["sh", "-c", "./hard_work > output.txt"]

# to run:
#     sudo docker build -t lab1 .
#     sudo docker run --mount type=bind,src="$(pwd)",target=/src lab1
#
#     sudo docker run --rm -v $(pwd):/output lab1
#     sudo docker run --mount type=volume,source=/thome/luki/tmp,destination=/src lab1
