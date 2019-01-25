package DTO

import (
	"fmt"
	"github.com/jinzhu/gorm"
)

type Clothes struct {
	Id int
	Name string
	Categoryid int
	Gender string
	Amount int
	Price int
	Type int
	Image string
	Created string
}

type Category struct {
	Name string
	Type int
}
var db *gorm.DB
var err error
func createDatanbase()  {
	db, err := gorm.Open("mysql", "root:camhoi@/shoponline?charset=utf8&parseTime=True&loc=Local")

	if err != nil {
		fmt.Println(err)
	}
	defer db.Close()
	db.AutoMigrate(&Category{})
}