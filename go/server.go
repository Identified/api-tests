package main

import (
  "runtime"
	"encoding/json"
	"fmt"
	"net/http"
	"strings"
)

func helloHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "hello world")
}

type JsonV1 struct {
	Str string
}

func v1Handler(w http.ResponseWriter, r *http.Request) {
	decoder := json.NewDecoder(r.Body)
	json_v1 := new(JsonV1)
	decoder.Decode(&json_v1)

	json_v1.Str = strings.ToUpper(json_v1.Str)
	json.NewEncoder(w).Encode(&json_v1)
}

type JsonV2 struct {
	String string
}

func v2Handler(w http.ResponseWriter, r *http.Request) {
	decoder := json.NewDecoder(r.Body)
	json_v2 := new(JsonV2)
	decoder.Decode(&json_v2)

	json_v2.String = strings.ToUpper(json_v2.String)
	json.NewEncoder(w).Encode(&json_v2)
}

func main() {
	runtime.GOMAXPROCS(runtime.NumCPU())

	http.HandleFunc("/hello", helloHandler)
	http.HandleFunc("/v1/json", v1Handler)
	http.HandleFunc("/v2/json", v2Handler)
	http.ListenAndServe(":8080", nil)
}
