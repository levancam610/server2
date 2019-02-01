package Controller

import (
	"../DTO"
	"../Database"
	"github.com/gin-gonic/gin"
	"strconv"
)

type Post struct {
	Id        int    `json:"id"`
	FirstName string `json:"title"`
	LastName  string
	Email     string
	UserName  string
	PassWord  string
}

type Clothes struct {
	Id         int
	Name       string
	CategoryId int
	Gender     string
	Amount     int
	Price      int
}
type Clothes2 struct {
	Name string
	Id   int
}
type DataClothes struct {
	TotalPage  int
	TotalCount int
	Data       []DTO.ClothesCategory
}

func FindClotheById(c *gin.Context) {
	clotheId := c.Param("clotheId")
	db := Database.DBConn()
	clothes := []DTO.Clothes{}
	db.First(&clothes, clotheId)
	c.JSON(200, clothes)
	defer db.Close()

}

func DeleteClothes(c *gin.Context) {
	clotheId := c.Param("clotheId")
	db := Database.DBConn()
	db.Delete(DTO.Clothes{}, "Id=?", clotheId)
	defer db.Close()

}

func GetList(c *gin.Context) {
	currentPage := c.Query("currentPage")
	pageSize := c.Query("pageSize")
	//orderBy := c.Query("orderBy")
	//search := c.Query("search")
	//categoryId := c.Query("categoryId")

	currentPage2, err1 := strconv.Atoi(currentPage)
	currentPage2 -= 1
	pageSize2, err2 := strconv.Atoi(pageSize)
	if err1 != nil || err2 != nil {
		panic("loi page ko convert dc integer")
	}
	//from := strconv.Itoa(currentPage2 * pageSize2)
	data := DataClothes{}
	//result := []Clothes2{}
	db := Database.DBConn()
	db.Table("clothes").Select("clothes.id,clothes.name, clothes.category_id, clothes.gender , clothes.created_at, clothes.updated_at, clothes.deleted_at, clothes.image , clothes.amount , clothes.price, categories.name").Joins("left outer join categories on categories.id  = clothes.category_id").Find(&data.Data)
	/* Where("category_id=? AND name LIKE ?", categoryId, "%"+search+"%").Order(orderBy + " desc").Limit(pageSize).Offset(from). */
	//db.Where("category_id=? AND name LIKE ?", categoryId, "%"+search+"%").Order(orderBy + " desc").Limit(pageSize).Offset(from).Find(&data.Data)
	//db.Joins("left join categories on caregories.id  = clothes.category_id").Where("category_id=? AND name LIKE ?", categoryId, "%"+search+"%").Order(orderBy + " desc").Limit(pageSize).Offset(from).Find(&data.Data)
	//db.Table("clothes").Select("clothes.name, categories.name").Joins("left join categories on caregories.id  = clothes.category_id").Where("category_id=? AND name LIKE ?", categoryId, "%"+search+"%").Order(orderBy + " desc").Limit(pageSize).Offset(from).Scan(&result)
	//asdasd

	count := 0
	db.Model(&DTO.Clothes{}).Count(&count)
	data.TotalCount = count
	if count%pageSize2 == 0 {
		count = count / pageSize2
	} else {
		count = count/pageSize2 + 1
	}
	data.TotalPage = count
	c.JSON(200, data.Data)

	defer db.Close()

}

func CreateClothes(c *gin.Context) {
	db := Database.DBConn()
	var json DTO.Clothes
	err := c.BindJSON(&json)
	if err == nil {
		db.Create(&json)
		c.JSON(200, gin.H{
			"messages": "inserted",
		})
		return
	}
	c.JSON(500, gin.H{"error": err.Error()})
	defer db.Close()
}

/* Get all category  */
func GetAllCategory(c *gin.Context) {
	db := Database.DBConn()
	category := []DTO.Category{}
	db.Find(&category)
	c.JSON(200, category)
	defer db.Close()
}

/*----------- create list image clothes ---------------- */
func CreateImageClothes(c *gin.Context) {
	db := Database.DBConn()
	var json DTO.Image
	err := c.BindJSON(&json)
	if err == nil {
		db.Create(&json)
		c.JSON(200, gin.H{
			"messages": "inserted",
		})
		return
	}
	c.JSON(500, gin.H{"error": err.Error()})
	defer db.Close()
}
func GetImageByClotheId(c *gin.Context) {
	clotheId := c.Param("clotheId")
	db := Database.DBConn()
	image := []DTO.Image{}
	db.Where("clothe_id=?", clotheId).Find(&image)
	c.JSON(200, image)
	defer db.Close()
}
