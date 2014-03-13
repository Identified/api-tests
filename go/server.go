package main

import (
	"fmt"
	"net/http"
  "encoding/json"
  "log"
  "strings"
)

func helloHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "hello world")
}

type JsonV1 struct {
  Str string
}

type JsonV2 struct {
  String string
}

func v1Handler(w http.ResponseWriter, r *http.Request) {
  decoder := json.NewDecoder(r.Body)
  json := new(JsonV1)
  decoder.Decode(&json)
  log.Println(json.Str)
  
	fmt.Fprintf(w, "{\"str\": %s}", strings.ToUpper(json.Str))
}

func v2Handler(w http.ResponseWriter, r *http.Request) {
  decoder := json.NewDecoder(r.Body)
  json := new(JsonV2)
  decoder.Decode(&json)
  log.Println(json.String)
  
	fmt.Fprintf(w, "{\"string\": %s}", strings.ToUpper(json.String))
}

func main() {
	http.HandleFunc("/hello", helloHandler)
	http.HandleFunc("/v1/json", v1Handler)
	http.HandleFunc("/v2/json", v2Handler)
	http.ListenAndServe(":8080", nil)
}
