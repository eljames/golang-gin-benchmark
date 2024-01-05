package main

import "github.com/gin-gonic/gin"

func main() {
	r := gin.Default()
	r.GET("/request-test", func(context *gin.Context) {
		context.JSON(200, map[string]any{
			"test": "ok",
		})
	})
	r.Run("0.0.0.0:8081")
}
