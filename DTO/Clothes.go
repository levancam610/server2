package DTO

import (
	"fmt"
	"github.com/jinzhu/gorm"
)

type Clothes struct {
	gorm.Model
	Name       string `gorm:"size: 100”`
	CategoryId int
	Gender     string `gorm:"type:varchar(10)”`
	Amount     int    `gorm:"size:5"`
	Price      int    `gorm:"size:10"`
	Type       int    `gorm:"size:5"`
	Image      string `gorm:"type:varchar(255)”`
}

type Category struct {
	gorm.Model
	Name string
	Type int
}

type Image struct {
	gorm.Model
	Link       string `gorm:"type:varchar(255)”`
	CategoryId int    `gorm:"type:int(10)"`
}

var db *gorm.DB
var err error

func createDatanbase() {
	db, err := gorm.Open("mysql", "root:camhoi@/shoponline?charset=utf8&parseTime=True&loc=Local")

	if err != nil {
		fmt.Println(err)
	}
	defer db.Close()
	db.AutoMigrate(&Category{})
}
