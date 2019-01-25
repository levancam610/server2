package Database

import (
	"fmt"
	"github.com/jinzhu/gorm"
)
import (
	_ "github.com/jinzhu/gorm/dialects/mysql"
)

func DBConn() (db *gorm.DB) {
	db, err := gorm.Open("mysql", "root:camhoi@/shoponline?charset=utf8&parseTime=True&loc=Local")

	if err != nil {
		fmt.Println(err)
	}
	return db;
}