package main

import (
	"./DTO"
	"./Controller"
	"fmt"
	"github.com/gin-contrib/cors"
	"github.com/gin-contrib/sessions"
	"github.com/gin-contrib/sessions/cookie"
	"github.com/gin-gonic/gin"
	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/mysql"
)

var db *gorm.DB
var err error

func createDatabase()  {
	db, err := gorm.Open("mysql", "root:camhoi@/shoponline?charset=utf8&parseTime=True&loc=Local")

	if err != nil {
		fmt.Println(err)
	}
	defer db.Close()
	db.AutoMigrate(DTO.Category{})
}

func setupRouter() *gin.Engine {
	router := gin.Default()
	store := cookie.NewStore([]byte("secret"))
	router.Use(sessions.Sessions("mysession", store))
	config := cors.DefaultConfig()
	config.AllowAllOrigins = true
	router.Use(cors.New(cors.Config{
		AllowOrigins:     []string{"http://localhost:3005", "http://localhost:3000"},
		AllowMethods:     []string{"POST", "GET"},
		AllowHeaders:     []string{"Origin", "Content-Type"},
		/*	ExposeHeaders:    []string{"Content-Length"},*/
	}))
	router.Use(cors.New(config))
	client := router.Group("/api")
	{
		client.GET("/clothesList", Controller.GetList)
		client.POST("/clothes/create", Controller.CreateClothes)
		client.GET("/category", Controller.GetAllCategory)
		/*client.GET("/clothesList", controller.GetList2)

		client.DELETE("/clothes/delete/:id", controller.DeleteClothes)
		client.POST("/clothes/uploadImage", controller.UploadImage)
		client.GET("/clothes/image/:id", controller.GetImageByClothesId)
		client.DELETE("/clothes/image/delete/:id", controller.DeleteClothes)
		client.GET("/clothes/countPage", controller.CountPageClothes)
		client.POST("/login", controller.Login)
		client.GET("/logout", controller.Logout)
		client.GET("/getSession", controller.GetSession)*/
	}

	return router
}
func main() {
	createDatabase()
	//router := setupRouter()
	//router.Run(":8000") // Ứng dụng chạy tại cổng 8080
}