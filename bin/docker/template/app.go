package main

import (
    "html/template"
	"net/http"
	"os"
	"io"
	"log"
	"path/filepath"

	"github.com/disintegration/imaging"
)

// Set up the AWS S3 client
var (
	region      = "us-east-2"
	BUCKET_NAME = os.Getenv("BUCKET_NAME")
	MODEL_ARN   = os.Getenv("MODEL_ARN")
)

func main() {
	http.HandleFunc("/", uploadFile)
	log.Fatal(http.ListenAndServe(":8080", nil))
}

func uploadFile(w http.ResponseWriter, r *http.Request) {
	if r.Method == "POST" {
		file, header, err := r.FormFile("file")
		if err != nil {
			http.Error(w, err.Error(), http.StatusInternalServerError)
			return
		}
		defer file.Close()

		filename := header.Filename
		ext := filepath.Ext(filename)
		if ext == "" {
			http.Error(w, "No file selected", http.StatusBadRequest)
			return
		}

		img, err := imaging.Decode(file)
		if err != nil {
			http.Error(w, "Error decoding image", http.StatusInternalServerError)
			return
		}

		bounds := img.Bounds()
		width, height := bounds.Dx(), bounds.Dy()
		if width > 4096 || height > 4096 {
			http.Error(w, "Height and width must be less than 4096px", http.StatusBadRequest)
			return
		}

		if err := uploadToS3(file, filename); err != nil {
			http.Error(w, err.Error(), http.StatusInternalServerError)
			return
		}

		labels, err := detectLabels(filename)
		if err != nil {
			http.Error(w, err.Error(), http.StatusInternalServerError)
			return
		}

		renderTemplate(w, "index.html", labels)
	} else {
		renderTemplate(w, "index.html", nil)
	}
}

func uploadToS3(file io.Reader, filename string) error {
	// Implement AWS S3 upload logic here
	return nil
}

func detectLabels(filename string) ([]string, error) {
	// Implement AWS Rekognition label detection logic here
	return []string{"Label1", "Label2", "Label3"}, nil
}

func renderTemplate(w http.ResponseWriter, tmpl string, labels []string) {
	tmplPath := filepath.Join("templates", tmpl)
	t, err := template.ParseFiles(tmplPath)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}

	data := map[string]interface{}{
		"Labels": labels,
	}

	err = t.Execute(w, data)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
}
