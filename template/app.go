package main

import (
	"fmt"
	"io"
	"log"
	"net/http"
	"os"
)

// Set up the AWS S3 client
var (
	region      = "us-east-1"
	BUCKET_NAME = os.Getenv("BUCKET_NAME")
	MODEL_ARN   = os.Getenv("MODEL_ARN")
)

func main() {
	http.HandleFunc("/", uploadFile)
	log.Fatal(http.ListenAndServe(":8080", nil))
}

func uploadFile(w http.ResponseWriter, r *http.Request) {
	if r.Method == "POST" {
		file, _, err := r.FormFile("file")
		if err != nil {
			http.Error(w, err.Error(), http.StatusInternalServerError)
			return
		}
		defer file.Close()

		// Implement AWS S3 upload logic here

		// Implement AWS Rekognition label detection logic here

		// Respond with a simple message
		w.Header().Set("Content-Type", "text/plain")
		io.WriteString(w, "File uploaded successfully!")
	} else {
		http.ServeFile(w, r, "upload.html")
	}
}
