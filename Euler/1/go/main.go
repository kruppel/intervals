package main

import (
	"fmt"
	"os"
	"strconv"
)

func main() {
	var sum int64

	i, _ := strconv.ParseInt(os.Args[1], 0, 64)

	for i > 0 {
		i -= 1
		if i%3 == 0 || i%5 == 0 {
			sum += i
		}
	}

	fmt.Println(sum)
}
