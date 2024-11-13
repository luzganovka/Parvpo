FROM alpine
RUN apk update && apk add g++ git
RUN git clone https://github.com/luzganovka/Parvpo-lab1.git
WORKDIR /Parvpo-lab1
RUN mkdir output
RUN touch output/output.txt
RUN g++ hard_work.cpp -fopenmp -o hard_work
#CMD ./hard_work > output/output.txt
CMD ["sh", "-c", "./hard_work > output.txt"]

# to run:
#     docker build -t lab1 .
#     docker run --rm -v $(pwd):/output lab1
#     docker run --mount type=volume,source=/thome/luki/tmp,destination=/output lab1