package main

import (
	"bufio"
	"fmt"
	"net"
	"os"
	"strings"
)

func main() {
	conn, err := net.Dial("tcp", os.Args[1]+":7000")
	if err != nil {
		// handle error
	}
	fmt.Fprintf(conn, os.Args[2]+"$")
	status, _ := bufio.NewReader(conn).ReadBytes('$')
	fmt.Println(strings.Replace(string(status), "$", "", -1))

	file, err := os.Create("/blkchain1/geth/static-nodes.json")
	if err != nil {
		fmt.Println(err)
	}
	defer file.Close()
	fmt.Fprintf(file, strings.Replace(string(status), "$", "", -1))
}
